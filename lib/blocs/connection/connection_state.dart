part of 'connection_bloc.dart';

class InternetConnectionState extends Equatable {
  final bool isConnected;
  const InternetConnectionState({required this.isConnected});

  factory InternetConnectionState.initial() {
    return const InternetConnectionState(isConnected: false);
  }

  factory InternetConnectionState.change({required bool isConnected}) {
    return InternetConnectionState(isConnected: isConnected);
  }

  @override
  List<Object?> get props => [isConnected];

  @override
  String toString() => "InternetConnectionState(isConnected: $isConnected)";
}
