import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy_app/presentation/home/screen/home_screen.dart';
import 'package:islamy_app/presentation/utils/resourses/color_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/navigate_manager.dart';

import '../../../bussience_logic/onBoarding/cubit.dart';
import '../../../bussience_logic/onBoarding/states.dart';
import '../../../data/web_services/local/pref/routing_pref.dart';
import '../../utils/routes/routes_managment.dart';
import '../../widgets/navigate.dart';
import '../widget/build_boarding_item.dart';

class BoardingModel {
  final String image, title, body;

  BoardingModel({
    required this.body,
    required this.image,
    required this.title,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController boardingController = PageController();

  @override
  void initState() {
    super.initState();
    RoutingPrefs.setOnBoardingSeen();
  }

  void submit() {
    onNavigate(context, page: const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    final boardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor:ColorManager.primary,
            automaticallyImplyLeading: false,
            actions: [
              TextButton(
                onPressed: () {
                  submit();
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "تخطي",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: SizedBox(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: PageView.builder(
                itemCount: boardingCubit.items.length,
                controller: boardingController,
                onPageChanged: (int index) {
                  (index == boardingCubit.items.length - 1)
                      ? boardingCubit.checkLastPage(changeText: true)
                      : boardingCubit.checkLastPage(changeText: false);
                },
                itemBuilder: (context, index) {
                  return BuildBoardingItem(
                    model: boardingCubit.items[index],
                    splashLength: boardingCubit.items.length,
                    controller: boardingController,
                  );
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorManager.primary,
            onPressed: () {
              (boardingCubit.isLastPage)
                  ? navigatorAndFinish(context, RouteConstant.homeRoute)
                  : boardingController.nextPage(
                      duration: const Duration(microseconds: 5000),
                      curve: Curves.easeIn);
            },
            child: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
