import 'package:flutter/material.dart';
import 'package:islamy_app/presentation/utils/resourses/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../bussience_logic/onBoarding/cubit.dart';
import '../../widgets/custom_text.dart';

class BuildBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  final int splashLength;
  final PageController controller;

  const BuildBoardingItem(
      {Key? key,
      required this.model,
      required this.splashLength,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset(
                model.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            SmoothPageIndicator(
              count: 6,
              controller: controller,
              effect: WormEffect(
                dotWidth: 15,
                activeDotColor: ColorManager.primary,
                dotColor: const Color(0xffE4C6A9),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 50),
              child: CustomText(
                text: model.title,
                fontSize: size.width >= 500 ? 25 : size.width / 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            CustomText(
              text: model.body,
              textAlign: TextAlign.center,
              fontSize: size.width >= 500 ? 18 : size.width / 22,
              textColor: ColorManager.black38,
            ),
          ],
        ),
      ),
    );
  }
}
