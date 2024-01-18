
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_1/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_1/pages/sign_in/bloc/sign_in_blocs.dart';

import '../app_blocs.dart';
import 'welcome/bloc/welcome_blocs.dart';

class AppBlocProviders{
  static get allBlocProviders => [
    BlocProvider(create: (context) => WelcomeBloc()),
    BlocProvider(create: (context) => AppBlocs()),
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context) => RegisterBlocs()),
  ];
}