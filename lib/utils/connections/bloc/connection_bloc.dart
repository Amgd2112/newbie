import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

import '../../../constants/urls.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, InternetConnectionState> {
  static const Duration _timeOutDuration = Duration(seconds: 1);

  ConnectionBloc() : super(ConnectionInitial()) {
    on<ListenConnection>((event, emit) {
      Connectivity().onConnectivityChanged.listen(
        (result) async {
          bool hasConnection = false;
          if (result != ConnectivityResult.none) {
            hasConnection = await checkConnection();
          }

          add(ChangeConnection(
            (hasConnection) ? ConnectionSuccess() : ConnectionFailure(),
          ));
        },
      );
    });

    on<ChangeConnection>((event, emit) {
      emit(event.connection);
    });
  }

  Future<bool> checkConnection() async {
    bool hasConnection = false;

    try {
      final result =
          await InternetAddress.lookup(google).timeout(_timeOutDuration);
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        hasConnection = true;
      }
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e.message);
    }

    return hasConnection;
  }
}
