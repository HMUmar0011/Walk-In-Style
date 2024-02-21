import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/screens/bottom_bar_navigator_screen/bloc/bottom_navigator_event.dart';
import 'package:walkinstyleapp/screens/bottom_bar_navigator_screen/bloc/bottom_navigator_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationInitial(index: 0)) {
    on<BottomNavigationEvent>((event, emit) {
      emit(BottomNavigationInitial(index: event.currentIndex));
    });
  }
}