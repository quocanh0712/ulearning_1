import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_1/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning_1/pages/home/bloc/home_page_events.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/user.dart';
import '../../global.dart';

class HomeController{
  late BuildContext context;
  UserItem? get userProfile => Global.storageService.getUserProfile();
  static final HomeController _singleton =HomeController._external();
  HomeController._external();
  factory HomeController({required BuildContext context}){
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
  if(Global.storageService.getUserToken().isNotEmpty){
    var result = await CourseAPI.courseList();
    if(result.code==200){
     if(context.mounted){
       context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
     }
      print("perfect");
      print(result.data![0].name);

    }
    else{
      print(result.code);
    }
  }
  else{
    print("User has already logged out");
  }
  }
}



