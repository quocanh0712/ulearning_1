import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_1/common/routes/names.dart';
import 'package:ulearning_1/pages/application/application_page.dart';
import 'package:ulearning_1/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_1/pages/course/bloc/course_blocs.dart';
import 'package:ulearning_1/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:ulearning_1/pages/course/course_detail/course_detail.dart';
import 'package:ulearning_1/pages/course/paywebview/bloc/payview_blocs.dart';
import 'package:ulearning_1/pages/course/paywebview/paywebview.dart';
import 'package:ulearning_1/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning_1/pages/home/home_page.dart';
import 'package:ulearning_1/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:ulearning_1/pages/profile/settings/settings_page.dart';
import 'package:ulearning_1/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_1/pages/register/register.dart';
import 'package:ulearning_1/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_1/pages/sign_in/sign_in.dart';
import 'package:ulearning_1/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_1/pages/welcome/welcome.dart';

import '../../global.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: HomePage(),
        bloc: BlocProvider(
          create: (_) => HomePageBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: SettingsPage(),
        bloc: BlocProvider(
          create: (_) => SettingsBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.COURSE_DETAIL,
        page: CourseDetail(),
        bloc: BlocProvider(
          create: (_) => CourseDetailBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.PAY_WEB_VIEW,
        page: PayWebView(),
        bloc: BlocProvider(
          create: (_) => PayWebViewBlocs(),
        ),
      ),

    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {


        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if(isLoggedin){
            return MaterialPageRoute(builder: (_)=> ApplicationPage(),settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) =>const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
