import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../config/routes/router.dart';
import '../../config/routes/routes_config.dart';

part 'routes_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  RoutesBloc() : super(RoutesState(screen: NewbieRouter.mapPage(RouteNavigator.feed))) {
    on<DestinationChanged>((event, emit) {
      emit(RoutesState.change(screen: NewbieRouter.mapPage(event.destination)));
    });
  }
}
