part of 'connection_bloc.dart';

@immutable
abstract class ConnectionEvent {}

class ListenConnection extends ConnectionEvent {}

class ConnectionChanged extends ConnectionEvent {
  final ConnectivityResult connection;
  ConnectionChanged(this.connection);
}
