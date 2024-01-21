

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_1/pages/application/bloc/app_events.dart';
import 'package:ulearning_1/pages/application/bloc/app_states.dart';

class AppBloc extends Bloc<AppEvent, AppState>{
   AppBloc():super( AppState()){
     on<TriggerAppEvent>((event, emit){
       //print("my tapped index ");
      emit(AppState(index: event.index));
     });
   }
}