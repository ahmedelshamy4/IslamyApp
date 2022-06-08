import 'package:flutter/material.dart';
import 'package:islamy_app/data/models/azkar/all_azkar.dart';
import 'package:islamy_app/presentation/azkar/screen/azkar_details.dart';

import '../../utils/resourses/assets_manager.dart';
import '../../utils/resourses/color_manager.dart';
import '../../utils/resourses/values_manager.dart';

class BuildListItem extends StatelessWidget {
  final BuildContext context;
  final int index;

  const BuildListItem({Key? key, required this.context, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s70,
      decoration: BoxDecoration(
        color: ColorManager.greyShade200,
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        elevation: AppSize.s5,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AzkarDetailsItem(
                    azkar: azkarDataList[index].toString().trim(),
                  ),
                ));
          },
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    ImageAssets.star,
                  ),
                ),

              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p4,
                    vertical: AppPadding.p12,
                  ),
                  child: Text(
                    azkarDataList[index].toString(),
                    style: Theme.of(context).textTheme.headlineLarge,
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
