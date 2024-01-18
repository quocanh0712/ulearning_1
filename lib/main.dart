import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_1/app_blocs.dart';
import 'package:ulearning_1/pages/application/application_page.dart';
import 'package:ulearning_1/pages/bloc_providers.dart';
import 'package:ulearning_1/pages/register/register.dart';
import 'package:ulearning_1/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_1/pages/sign_in/sign_in.dart';
import 'package:ulearning_1/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_1/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

import 'common/values/colors.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            theme: ThemeData(
              appBarTheme:
                  AppBarTheme(
                    iconTheme: IconThemeData(
                      color: AppColors.primaryText
                    ),
                      elevation: 0, backgroundColor: Colors.white),
            ),
            home: ApplicationPage(),
            routes: {
             // "myHomePage": (context) => MyHomePage(),
              "signIn": (context) => SignIn(),
              "register": (context) => Register(),
            },
          ),
        ));
  }
}

