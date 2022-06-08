import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islamy_app/app/constants.dart';
import 'package:islamy_app/bussience_logic/azan/states.dart';
import 'package:islamy_app/presentation/utils/resourses/app_strings_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/assets_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/color_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/values_manager.dart';
import 'package:islamy_app/presentation/widgets/appbar_widget.dart';

import '../../../bussience_logic/azan/cubit.dart';
import '../widget/azan_item.dart';

class AzanScreen extends StatelessWidget {
  const AzanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myCoordinates = Coordinates(
      AppCubit.get(context).prayerTimes.coordinates.latitude,
      AppCubit.get(context).prayerTimes.coordinates.longitude,
    );
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    String nextPrayer = prayerTimes.nextPrayer().toString();
    String Asr = DateFormat.jm().format(prayerTimes.asr);
    List NextSala = nextPrayer.split('.');
    List asr = Asr.split(':');
    int asrTime = int.parse(asr[0]);

    return BlocBuilder<AppCubit, AppCubitStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBarWidget(
              AppStrings.azan, Constants.elevationAppBarOne, context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.21,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: const Image(
                            image: AssetImage(ImageAssets.azantwo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Center(
                              child: Text(
                                '${AppStrings.nextPrayer} : '
                                '${NextSala[1] == 'none' ? "fajr" : NextSala[1]}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Theme.of(context).canvasColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: AppSize.s16),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      opacity: 0.6,
                      fit: BoxFit.fill,
                      image: AssetImage(ImageAssets.bg),
                    ),
                    borderRadius: BorderRadius.circular(AppSize.s16),
                    border: Border.all(
                      color: ColorManager.greyShade500,
                      width: AppSize.s1,
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                        width: double.infinity,
                      ),
                      salaItem(
                        context: context,
                        Enstring: 'Fajr',
                        Tstring: DateFormat.jm().format(prayerTimes.fajr),
                        Arstring: 'الفجر',
                      ),
                      const SizedBox(height: 19),
                      salaItem(
                        context: context,
                        Enstring: 'Sunrise',
                        Tstring: DateFormat.jm().format(prayerTimes.sunrise),
                        Arstring: 'الشروق',
                      ),
                      const SizedBox(height: 19),
                      salaItem(
                        context: context,
                        Enstring: 'Zuhr',
                        Tstring: DateFormat.jm().format(prayerTimes.dhuhr),
                        Arstring: 'الظهر',
                      ),
                      const SizedBox(height: 19),
                      salaItem(
                        context: context,
                        Enstring: 'Asr',
                        Tstring: '${asrTime - 1}:${asr[1]}',
                        Arstring: 'العصر',
                      ),
                      const SizedBox(height: 19),
                      salaItem(
                        context: context,
                        Enstring: 'Maghrib',
                        Tstring: DateFormat.jm().format(prayerTimes.maghrib),
                        Arstring: 'المغرب',
                      ),
                      const SizedBox(height: 19),
                      salaItem(
                        context: context,
                        Enstring: 'Isha',
                        Tstring: DateFormat.jm().format(prayerTimes.isha),
                        Arstring: 'العشاء',
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      SelectableText(
                        AppStrings.prayer_time_title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: ColorManager.primary),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
