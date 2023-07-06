import 'package:e_commerce/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/components.dart';
import '../../features/login/presentation/pages/login.dart';

class Routes{
  static const String login ="/";
  static const String signUp ="SignUp";


}
class AppRoutes{


  static Route onGenerate(RouteSettings routeSettings)
  {
    switch(routeSettings.name)
    {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),);
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),);

      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),);
    }


  }



}