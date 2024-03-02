import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_1/common/routes/names.dart';
import 'package:ulearning_1/common/values/constant.dart';
import 'package:ulearning_1/global.dart';
import 'package:ulearning_1/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_1/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:ulearning_1/pages/profile/settings/bloc/settings_states.dart';
import '../../application/bloc/app_events.dart';
import '../settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void removeUserData(){
    context.read<AppBloc>().add(TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBlocs, SettingsStates>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: [
                settingsButton(context, removeUserData),
              ],
            ),
          );
        },
      )),
    );
  }
}
