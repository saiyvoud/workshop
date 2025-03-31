import 'package:ecommerce/components/bottomNavigatorWidget.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/favorite/favorite_view.dart';
import 'package:ecommerce/view/home/home_view.dart';
import 'package:ecommerce/view/profile/profile_view.dart';
import 'package:ecommerce/view/search/search_view.dart';
import 'package:ecommerce/view/splashScreen/splashScreen.dart';
import 'package:flutter/material.dart';

class RouterPath {
  static const String splashScreen = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String home = "/home";
  static const String search = "/search";
  static const String favorite = "/favorite";
  static const String profile = "/profile";
  static const String bottom = "/bottom";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
          settings: settings,
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
          settings: settings,
        );
      case bottom:
        return MaterialPageRoute(
          builder: (_) => BottomNavigatorWidget(),
          settings: settings,
        );
      case search:
        return MaterialPageRoute(
          builder: (_) => SearchView(),
          settings: settings,
        );
      case favorite:
        return MaterialPageRoute(
          builder: (_) => FavoriteView(),
          settings: settings,
        );
      case profile:
        return MaterialPageRoute(
          builder: (_) => ProfileView(),
          settings: settings,
        );

      default:
        throw "Not has Router";
    }
  }
}
