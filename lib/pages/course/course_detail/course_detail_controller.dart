import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning_1/common/apis/course_api.dart';
import 'package:ulearning_1/common/entities/course.dart';
import 'package:ulearning_1/common/widgets/flutter_toasts.dart';
import 'package:ulearning_1/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:ulearning_1/pages/course/course_detail/bloc/course_detail_events.dart';

import '../../../common/routes/names.dart';

class CourseDetailController {
  final BuildContext context;

  CourseDetailController({required this.context});

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args["id"]);
    asyncLoadAllData(args["id"]);
  }

  asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.courseDetail(params: courseRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(TriggetCourseDetail(result.data!));
      } else {
        print('------ context is not available--------');
      }
    } else {
      toastInfo(msg: "Something went wrong");
      print("----------Error code ${result.code}---------");
    }
  }
  Future<void> goBuy(int? id) async {
    print('course id ${id}');
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true
    );
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result =await CourseAPI.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if(result.code == 200){
      var url = Uri.decodeFull(result.data!);
      var res = await Navigator.of(context).pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {
        "url" : url
      });
      if(res =="success"){
        toastInfo(msg: "You bought it successfully");
      }
      print("MY URL $url");

    }else{
        toastInfo(msg: result.msg!);
    }

  }
}
