import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/screens/on_boarding/cubit/page_view_cubit_state.dart';

class PageViewCubit extends Cubit<PageViewState> {
   // ignore: prefer_typing_uninitialized_variables
   int selectedIndex=0;

  PageViewCubit() : super(SelectedPageViewState(selectedIndex: 0));
  
  void changeIndex() {
    try {
        if (selectedIndex >= 0 && selectedIndex <= 3) { // Ensure valid index
      selectedIndex++;
      emit(SelectedPageViewState(selectedIndex: selectedIndex));
    }
      
    } catch (e) {
      log(
        e.runtimeType.toString()
      );
    }
    
  }
  }
  
