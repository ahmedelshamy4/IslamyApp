import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamy_app/animation/bottom_animation.dart';
import 'package:islamy_app/app/constants.dart';
import 'package:islamy_app/data/models/nawawi/nawawi.dart';
import 'package:islamy_app/presentation/nawawi/widget/nawaw_iItem.dart';
import 'package:islamy_app/presentation/utils/resourses/loading_manager.dart';
import 'package:islamy_app/presentation/widgets/appbar_widget.dart';

import '../../utils/resourses/color_manager.dart';
import '../../utils/resourses/values_manager.dart';

class NawawiScreen extends StatelessWidget {
  const NawawiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString(Constants.nawawiJson),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final List<dynamic> data = json.decode(snapshot.data.toString());
              return WidgetAnimator(
                child: CarouselSlider(
                  items: data.map((e) {
                    return NawawiItem(
                      hadith: e[Constants.hadith],
                      description: e[Constants.description],
                      title: e[Constants.title],
                    );
                  }).toList(),
                  options: CarouselOptions(
                    scrollPhysics: const ScrollPhysics(),
                    height: double.infinity,
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    viewportFraction: AppSize.s0_9,
                    initialPage: Constants.initialPage,
                    aspectRatio: AppSize.s2,
                  ),
                ),
              );
            } else {
              return const Center(
                child: Center(
                  child: CustomLoading(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
