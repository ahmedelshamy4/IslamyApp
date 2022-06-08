import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy_app/animation/bottom_animation.dart';
import 'package:islamy_app/bussience_logic/quran/cubit/quran_cubit.dart';
import 'package:islamy_app/presentation/quran/widget/quran_item.dart';
import 'package:islamy_app/presentation/utils/resourses/app_strings_manager.dart';
import 'package:islamy_app/app/constants.dart';
import 'package:islamy_app/presentation/utils/resourses/loading_manager.dart';
import 'package:islamy_app/presentation/widgets/appbar_widget.dart';

import '../../../bussience_logic/quran/cubit/quran_cubit.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarWidget(AppStrings.quran, Constants.elevationAppBarOne, context),
      body: BlocConsumer<QuranCubit, QuranState>(
        listener: (context, state) {
          if (state.status == QuranStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.errMsg),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == QuranStatus.loading) {
            return const Center(
              child: CustomLoading(),
            );
          }
          if (state.status == QuranStatus.error) {
            return Center(
              child: Text(
                AppStrings.error,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            );
          }
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: state.surah.length,
            itemBuilder: (BuildContext context, int index) {
              return WidgetAnimator(
                child: QuranItem(
                  surah: state.surah[index],
                  index: index,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
