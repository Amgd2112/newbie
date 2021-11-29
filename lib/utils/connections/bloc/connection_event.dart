part of 'connection_bloc.dart';

@immutable
abstract class ConnectionEvent {}

class ListenConnection extends ConnectionEvent {}

class ChangeConnection extends ConnectionEvent {
  final InternetConnectionState connection;
  ChangeConnection(this.connection);
}
