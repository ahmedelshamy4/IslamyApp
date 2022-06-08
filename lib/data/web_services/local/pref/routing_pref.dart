import 'package:islamy_app/data/web_services/local/pref/pref_setup.dart';

import '../../../../presentation/utils/routes/routes_managment.dart';

class RoutingPrefs {
  RoutingPrefs._();

  static void setOnBoardingSeen() =>
      SharedPrefs.preferences.setBool("seen", true);

  static bool getOnBoardindSeen() =>
      SharedPrefs.preferences.getBool("seen") ?? false;

  static String getInitialRoute() => getOnBoardindSeen() == true
      ? RouteConstant.homeRoute
      : RouteConstant.onBoardingRoute;
}
