

import 'package:ulearning_1/common/entities/course.dart';

class HomePageStates{
  HomePageStates({
    this.courseItem = const <CourseItem>[],
    this.index = 0} );
  final int index;

  final List<CourseItem> courseItem;

  HomePageStates copyWith({int? index, List<CourseItem>? courseItem}){
    return HomePageStates(
      courseItem: courseItem??this.courseItem,
      index: index??this.index
    );
  }
}