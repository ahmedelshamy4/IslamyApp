import 'package:flutter/material.dart';
import 'package:islamy_app/presentation/azan/screen/azan_screen.dart';
import 'package:islamy_app/presentation/azkar/screen/azkar_screen.dart';
import 'package:islamy_app/presentation/kibla/kibla_screen.dart';
import 'package:islamy_app/presentation/nawawi/screen/nawawi_screen.dart';
import 'package:islamy_app/presentation/onBoarding/screen/onBoarding_screen.dart';
import 'package:islamy_app/presentation/quran/screen/quran_screen.dart';
import 'package:islamy_app/presentation/radio/screen/radio_screen.dart';

import '../../home/screen/home_screen.dart';
import '../resourses/app_strings_manager.dart';

class RouteConstant {
  static const String onBoardingRoute = "/onBoarding";
  static const String homeRoute = "/home";
  static const String quranRoute = "/quran";
  static const String radioRoute = "/radio";
  static const String azkarRoute = "/azkar";
  static const String azanRoute = "/azan";
  static const String qublaRoute = "/qubla";
  static const String nawawiRoute = "/nawawi";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case RouteConstant.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteConstant.quranRoute:
        return MaterialPageRoute(builder: (_) => const QuranScreen());

      case RouteConstant.nawawiRoute:
        return MaterialPageRoute(builder: (_) => const NawawiScreen());

      case RouteConstant.azkarRoute:
        return MaterialPageRoute(builder: (_) => const AzkarScreen());

      case RouteConstant.radioRoute:
        return MaterialPageRoute(builder: (_) => const RadioScreen());

      case RouteConstant.azanRoute:
        return MaterialPageRoute(builder: (_) => const AzanScreen());

      case RouteConstant.qublaRoute:
        return MaterialPageRoute(builder: (_) => const QiblaScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRoutes),
        ),
        body: const Center(
          child: Text(AppStrings.noRoutes),
        ),
      );
    });
  }
}
