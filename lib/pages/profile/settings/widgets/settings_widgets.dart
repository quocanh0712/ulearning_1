

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_1/common/widgets/base_text_widgets.dart';

import '../../../../common/values/colors.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      child: reusableText("Settings")
    )
  );
}

Widget settingsButton(BuildContext context, void Function()? func){
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Logout"),
              content: Text("Confirm Logout"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel")),
                TextButton(
                    onPressed: func,
                    child: Text("Confirm"))
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/icons/Logout.png"))),
    ),
  );
}