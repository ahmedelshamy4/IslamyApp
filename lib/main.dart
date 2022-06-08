import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy_app/presentation/utils/routes/routes_managment.dart';

import 'app/my_app.dart';
import 'data/web_services/core/error_widget.dart';
import 'data/web_services/local/pref/pref_setup.dart';
import 'data/web_services/local/pref/routing_pref.dart';
import 'my_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  errorWidget();
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  await SharedPrefs.init();

  BlocOverrides.runZoned(
    () {
      runApp(
        MyApp(
          appRouter: RouteGenerator(),
          initialRoute:  RoutingPrefs.getInitialRoute(),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}
