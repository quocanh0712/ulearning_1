


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_1/pages/course/bloc/course_events.dart';
import 'package:ulearning_1/pages/course/bloc/course_states.dart';

class CourseBloc extends Bloc<CourseEvents, CourseStates>{
  CourseBloc():super(const CourseStates()){
    on<TriggetCourse>(_triggerCourse);
  }

  void _triggerCourse(TriggetCourse event, Emitter<CourseStates> emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }
}