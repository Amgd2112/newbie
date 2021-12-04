import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../config/config.dart';
import '../../modules/modules.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initial()) {
    on<DestinationChanged>((event, emit) {
      emit(NavigationState.change(
        selectedItem: RouteConfig.getNavigationItem(event.destination),
      ));
    });
  }
}
