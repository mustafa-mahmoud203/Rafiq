import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/logic/cubit/login_cubit/login_cubit.dart';
import 'package:rafiq/views/Forget%20password/screens/first_forget_password.dart';
import 'package:rafiq/views/Forget%20password/screens/second_forget_password.dart';
import 'package:rafiq/views/home/screens/home_screen.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';
import 'package:rafiq/views/profile/screens/profile_screen.dart';
import '../main_pages/main_home/screens/main_home.dart';
import '../main_pages/main_sign_up/screens/main_sign_up.dart';
import '../notification/screens/notification_screen.dart';
import '../trip/screens/trip_screen.dart';

String? token = CahchHelper.getData(key: 'token');

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) =>
                (token != null) ? MainHomeScreen() : LoginScreen());

      case FirstForgetPassword.routeName:
        return MaterialPageRoute(builder: (_) => FirstForgetPassword());
      case SecondForgetPassword.routeName:
        return MaterialPageRoute(builder: (_) => const SecondForgetPassword());
      case SecondForgetPassword.routeName:
        return MaterialPageRoute(builder: (_) => const SecondForgetPassword());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case TripScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TripScreen());
      case NotificationScreen.routeName:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case MainHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MainHomeScreen());
      case MainSignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MainSignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
