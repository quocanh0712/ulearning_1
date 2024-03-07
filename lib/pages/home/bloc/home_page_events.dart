
import '../../../common/entities/course.dart';

abstract class HomePageEvents{
  HomePageEvents();
}

class HomePageDots extends HomePageEvents{
  final int index;
  HomePageDots(this.index):super();
}

class HomePageCourseItem extends HomePageEvents{
  HomePageCourseItem(this.courseItem);
  final List<CourseItem> courseItem;
}