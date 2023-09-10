import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/observer.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'config/routes/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer=MyBlocObserver();
  String route;
  var user = CacheHelper.getData("User");
  if(user == null)
    {
      route= Routes.login;
    }
  else {
    route= Routes.home;
  }
  runApp( MyApp(route));
}

