import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, PageState> {
  WelcomeBloc() : super(PageState()) {
    on<WelcomeEvent>((event, emit) {
      if(event is PageChangeEvent){
        emit(PageState(pageCount: state.pageCount));
      }
    });
  }
}
