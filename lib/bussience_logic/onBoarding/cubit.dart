import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy_app/bussience_logic/onBoarding/states.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());
  bool isLastPage = false;

  void checkLastPage({required bool changeText}) {
    changeText ? isLastPage = true : isLastPage = false;
    emit(CheckLastPageSuccess());
  }

  List<OnBoardingModel> items = [
    OnBoardingModel(
      image: 'assets/images/logo.jpg',
      title: "القرآن",
      body: "استمتع بجميع سور القرآن الكريم كاملة",
    ),
    OnBoardingModel(
      image: 'assets/images/radio.jpg',
      title: "القرآن",
      body: "استمتع اذاعات القران الكريم لمشاهير القراء حول العالم",
    ),
    OnBoardingModel(
      image: 'assets/images/azkar.png',
      title: "الأذكار",
      body: "الأذكار الصلاة في مدينتك",
    ),
    OnBoardingModel(
      image: 'assets/images/azan.jpg',
      title: "مواعيد الصلاة",
      body: "تحديد مواعيد الصلاة في مدينتك",
    ),
    OnBoardingModel(
      image: 'assets/images/Mecca.png',
      title: "القبلة",
      body: "قم بتحديد القبلة و اقم صلاتك في اي مكان",
    ),
    OnBoardingModel(
      image: 'assets/images/nawawi.jpg',
      title: "القبلة",
      body: "الاربعون النوويه",
    ),
  ];
}

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}
