import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/help_screen.dart';


import '../screens/shared/login_screen.dart';
import '../screens/shared/product_screen.dart';
import '../screens/shared/splash_screen.dart';
import '../screens/shared/verify_screen.dart';
import '../view/home_layout.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/help':
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case '/otp':
        return MaterialPageRoute(builder: (_) => const VerifyScreen());
      case '/product':
        return MaterialPageRoute(builder: (_) => const ProductScreen());
      default:
        return null;
    }
  }
}
