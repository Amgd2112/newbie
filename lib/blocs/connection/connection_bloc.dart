import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../constant/url.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, InternetConnectionState> {
  static const Duration _timeOutDuration = Duration(seconds: 1);
  StreamSubscription? _connectivitySubscription;

  ConnectionBloc() : super(InternetConnectionState.initial()) {
    on<ListenConnection>((event, emit) {
      _onListenConnection(event, emit);
    });

    on<ConnectionChanged>((event, emit) async {
      await _onChangeConnection(event, emit);
    });
  }

  void _onListenConnection(ConnectionEvent event, Emitter<InternetConnectionState> emit) {
    _connectivitySubscription?.cancel();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((result) {
      add(ConnectionChanged(result));
    });
  }

  Future<bool> _checkConnection() async {
    bool hasConnection = false;

    try {
      final result = await InternetAddress.lookup(ConstantURL.google).timeout(_timeOutDuration);
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        hasConnection = true;
      }
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e.message);
    }

    return hasConnection;
  }

  Future<void> _onChangeConnection(ConnectionChanged event, Emitter<InternetConnectionState> emit) async {
    bool hasConnection = false;
    if (event.connection != ConnectivityResult.none) {
      hasConnection = await _checkConnection();
    }
    emit(InternetConnectionState.change(isConnected: hasConnection));
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
