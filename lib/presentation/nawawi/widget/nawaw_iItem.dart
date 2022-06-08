import 'package:flutter/material.dart';
import 'package:islamy_app/app/constants.dart';
import 'package:islamy_app/presentation/utils/resourses/app_strings_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/color_manager.dart';
import 'package:islamy_app/presentation/widgets/appbar_widget.dart';

import '../../utils/resourses/values_manager.dart';

class NawawiItem extends StatelessWidget {
  final String hadith;
  final String description;
  final String title;

  const NawawiItem({
    Key? key,
    required this.hadith,
    required this.description,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title, Constants.elevationAppBarZero, context),
      body: Column(
        children: [
          const SizedBox(height: AppSize.s20),
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: AppSize.s1,
                ),
                borderRadius: BorderRadius.circular(AppSize.s10),
              ),
              padding: const EdgeInsets.all(AppSize.s10),
              child: SelectableText(
                hadith,
                style: Theme
                    .of(context)
                    .textTheme
                    .displayLarge,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s20),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s10,
                vertical: AppSize.s30,
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: ColorManager.grey,
                        scrollable: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                        ),
                        content: SelectableText(
                          description,
                          style: Theme
                              .of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: ColorManager.white),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                  AppStrings.close,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: ColorManager.white),
                              ))
                        ],
                      );
                    },
                  );
                },
                minWidth: double.infinity,
                color: ColorManager.brownShade300,
                child: Text(
                  AppStrings.explanationOfTheHadith,
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: ColorManager.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
