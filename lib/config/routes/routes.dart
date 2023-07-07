import 'package:e_commerce/features/home/presentation/pages/home.dart';
import 'package:e_commerce/features/login/domain/entities/login_entity.dart';
import 'package:e_commerce/features/login/presentation/manager/cubit.dart';
import 'package:e_commerce/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/components.dart';
import '../../features/login/data/data_sources/data_sources.dart';
import '../../features/login/presentation/pages/login.dart';

class Routes {
  static const String login = "/";
  static const String signUp = "SignUp";
  static const String home = "home";

}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => LoginCubit(RemoteDto()),
              child: const LoginScreen()),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.home:
        LoginEntity loginEntity = routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(
          builder: (context) =>  HomeScreen(loginEntity),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }
}
