import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/constants.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  static const Duration _timeOutDuration = Duration(seconds: 1);
  StreamSubscription? _connectivitySubscription;

  NetworkBloc() : super(ConnectionInitial()) {
    on<ListenConnection>((event, emit) {
      _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
        (result) {
          add(ConnectionChanged(result));
        },
      );
    });

    on<ConnectionChanged>((event, emit) async {
      bool hasConnection = false;
      if (event.connection != ConnectivityResult.none) {
        hasConnection = await _checkConnection();
      }

      emit((hasConnection) ? ConnectionSuccess() : ConnectionFailure());
    });
  }

  Future<bool> _checkConnection() async {
    bool hasConnection = false;

    try {
      final result = await InternetAddress.lookup(
        ConstantPath.google,
      ).timeout(_timeOutDuration);
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        hasConnection = true;
      }
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e.message);
    }

    return hasConnection;
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
