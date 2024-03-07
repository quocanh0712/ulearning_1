
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_1/common/routes/bloc_observer.dart';
import 'package:ulearning_1/common/service/storage_services.dart';

import 'firebase_options.dart';

class Global{
  static late StorageService storageService;
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

    storageService = await StorageService().init();
  }
}