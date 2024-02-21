import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/screens/home/bloc/home_page_bloc_event.dart';
import 'package:walkinstyleapp/screens/home/bloc/home_page_bloc_state.dart';
 
class HomePageBloc extends Bloc<HomePageBlocEvent,HomePageBlocState> {
bool isDrawerOpen=false;
  double xOffset=0.0;
   double yOffset=0.0;
  HomePageBloc():super(HomePageBlocInitialState()){
    emit(HomePageRotationState(isDrawerOpen: isDrawerOpen, xOffset: xOffset, yOffset: yOffset));
    on<HomePageRotationEvent>((event, emit) {
      isDrawerOpen=!isDrawerOpen;
     if (isDrawerOpen==true) {
        xOffset = 290.0;
        yOffset = 80.0;
      emit(HomePageRotationState(isDrawerOpen: isDrawerOpen, xOffset: xOffset, yOffset: yOffset));

     }else{
      xOffset=0.0;
      yOffset=0.0;
      emit(HomePageRotationState(isDrawerOpen: isDrawerOpen, xOffset: xOffset, yOffset: yOffset));
  }});
  }
  
}