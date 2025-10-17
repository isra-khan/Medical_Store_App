import 'package:flutter/widgets.dart';
import 'package:quickmedicalapp/routes/routes.dart';
import 'package:quickmedicalapp/screens/onboarding_screens.dart/quick_phonenumber_screen.dart';
import 'package:quickmedicalapp/screens/onboarding_screens.dart/walk_through_scren.dart';
import 'package:quickmedicalapp/screens/screens/home_screen.dart';
import 'package:quickmedicalapp/screens/splash/splash_screen.dart';

class AppPages {
  static final Map<String, WidgetBuilder> routes = {
    Routes.splash: (context) => const SplashScreen(),
    Routes.quickNumber: (context) => QuickPhoneNumberScreen(),

    Routes.walkthrough: (context) => const WalkThroughScreen(),
    Routes.home: (context) => HomeScreen(),
  };
}
