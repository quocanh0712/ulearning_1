

import 'package:ulearning_1/common/entities/course.dart';

abstract class CourseEvents{
  const CourseEvents();
}

class TriggetCourse extends CourseEvents{
  const TriggetCourse(this.courseItem):super();
  final CourseItem courseItem;
}