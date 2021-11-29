part of 'connection_bloc.dart';

@immutable
abstract class InternetConnectionState {}

class ConnectionInitial extends InternetConnectionState {}

class ConnectionSuccess extends InternetConnectionState {}

class ConnectionFailure extends InternetConnectionState {}
