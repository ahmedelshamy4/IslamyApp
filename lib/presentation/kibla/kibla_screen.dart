import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:islamy_app/app/constants.dart';
import 'package:islamy_app/presentation/kibla/qibla_compass.dart';
import 'package:islamy_app/presentation/utils/resourses/app_strings_manager.dart';
import 'package:islamy_app/presentation/widgets/appbar_widget.dart';
import 'dart:math' as math;

import '../utils/resourses/assets_manager.dart';
import '../utils/resourses/color_manager.dart';
import '../utils/resourses/values_manager.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarWidget(AppStrings.kible, Constants.elevationAppBarOne, context),
      body: Container(
        decoration: BoxDecoration(
          color: ColorManager.greyShade500,
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        child: FutureBuilder(
            future: _deviceSupport,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error.toString()}'),
                );
              }
              if (snapshot.hasData) {
                return const QiblaCompass();
              } else {
                return const Text('Error');
              }
            }),
      ),
    );
  }
}
