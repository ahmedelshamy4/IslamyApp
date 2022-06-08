import 'package:flutter/material.dart';
import 'package:islamy_app/animation/bottom_animation.dart';
import 'package:islamy_app/app/constants.dart';
import 'package:islamy_app/data/models/azkar/all_azkar.dart';
import 'package:islamy_app/presentation/azkar/widget/_build_listItem.dart';
import 'package:islamy_app/presentation/utils/resourses/app_strings_manager.dart';
import 'package:islamy_app/presentation/widgets/appbar_widget.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarWidget(AppStrings.azkar, Constants.elevationAppBarOne, context),
      body: ListView.builder(
        itemCount: azkarDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return WidgetAnimator(
            child: BuildListItem(context: context, index: index),
          );
        },
      ),
    );
  }
}
