import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../modules/models/enum_navigation_name.dart';
import '../../modules/models/navigation_item.dart';
import '../../config/routes/router.dart';

part 'routes_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  RoutesBloc()
      : super(RoutesState(
          selectedItem: NewbieRouter.mapNavigationItem(NavigationName.feed),
        )) {
    on<DestinationChanged>((event, emit) {
      emit(RoutesState.change(
        selectedItem: NewbieRouter.mapNavigationItem(event.destination),
      ));
    });
  }
}
