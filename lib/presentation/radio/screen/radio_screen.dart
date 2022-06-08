import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy_app/app/constants.dart';
import 'package:islamy_app/bussience_logic/radios/radios_cubit.dart';
import 'package:islamy_app/bussience_logic/radios/radios_states.dart';
import 'package:islamy_app/presentation/radio/widget/radio_item.dart';
import 'package:islamy_app/presentation/utils/resourses/app_strings_manager.dart';
import 'package:islamy_app/presentation/widgets/appbar_widget.dart';

import '../../../animation/bottom_animation.dart';
import '../../utils/resourses/loading_manager.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarWidget(AppStrings.radio, Constants.elevationAppBarOne, context),
      body: BlocConsumer<RadioCubit, RadioState>(
        listener: (context, state) {
          if (state.status == RadiosStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.errMsg),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == RadiosStatus.loading) {
            return const Center(
              child: CustomLoading(),
            );
          }
          if (state.status == RadiosStatus.error) {
            return Center(
              child: Text(
                AppStrings.error,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            );
          }
          // update json data
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: state.radio.length,
            itemBuilder: (BuildContext context, int index) {
              return WidgetAnimator(
                child: RadioItem(
                  radios: state.radio[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
