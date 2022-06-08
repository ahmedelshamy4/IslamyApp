import 'package:flutter/material.dart';
import 'package:islamy_app/data/models/quran/surahs.dart';
import 'package:islamy_app/presentation/quran/screen/quran_details.dart';
import 'package:islamy_app/presentation/utils/resourses/color_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/navigate_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/values_manager.dart';

import '../../utils/resourses/assets_manager.dart';

class QuranItem extends StatelessWidget {
  final Surah surah;
  final int index;

  const QuranItem({
    Key? key,
    required this.surah,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuranDetails(
                surah: surah,
                ayahList: surah.ayah,
              ),
            ));
      },
      child: Card(
        margin: const EdgeInsets.all(AppSize.s3),
        elevation: AppSize.s1_5,
        color: ColorManager.greyShade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s20,
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: AppSize.s24,
            backgroundImage: const AssetImage(
              ImageAssets.star,
            ),
            backgroundColor: Colors.transparent,
            child: Text(
              surah.number.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          title: Text(
            surah.name,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: ColorManager.darkDlue),
          ),
        ),
      ),
    );
  }
}
