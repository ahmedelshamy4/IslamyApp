import 'package:flutter/material.dart';
import 'package:islamy_app/presentation/drawer/drawer_page.dart';
import 'package:islamy_app/presentation/home/widget/buildCard.dart';
import '../../utils/resourses/app_strings_manager.dart';
import '../../utils/resourses/assets_manager.dart';
import '../../../app/constants.dart';
import '../../utils/routes/routes_managment.dart';
import '../../widgets/appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        AppStrings.titleApp,
        Constants.elevationAppBarOne,
        context,
      ),
      drawer: const DrawerPage(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                BuildCard(
                  title: AppStrings.quran,
                  route: RouteConstant.quranRoute,
                  image: ImageAssets.quran,
                  context: context,
                ),
                BuildCard(
                  title: AppStrings.radio,
                  route: RouteConstant.radioRoute,
                  image: ImageAssets.radio,
                  context: context,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                BuildCard(
                  title: AppStrings.azkar,
                  route: RouteConstant.azkarRoute,
                  image: ImageAssets.azkar,
                  context: context,
                ),
                BuildCard(
                  title: AppStrings.azan,
                  route: RouteConstant.azanRoute,
                  image: ImageAssets.azan,
                  context: context,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                BuildCard(
                  title: AppStrings.kible,
                  route: RouteConstant.qublaRoute,
                  image: ImageAssets.qubla,
                  context: context,
                ),
                BuildCard(
                  title: AppStrings.nawawi,
                  route: RouteConstant.nawawiRoute,
                  image: ImageAssets.nawawi,
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
