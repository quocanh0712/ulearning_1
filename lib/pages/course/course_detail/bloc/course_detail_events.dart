

import 'package:ulearning_1/common/entities/course.dart';

abstract class CourseDetailEvents{
  const CourseDetailEvents();
}

class TriggetCourseDetail extends CourseDetailEvents{
  const TriggetCourseDetail(this.courseItem):super();
  final CourseItem courseItem;
}