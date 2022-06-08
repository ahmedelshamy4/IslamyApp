import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:islamy_app/app/constants.dart';
import 'package:islamy_app/presentation/widgets/appbar_widget.dart';
import '../../../data/models/quran/ayahs.dart';
import '../../../data/models/quran/surahs.dart';
import '../../utils/resourses/color_manager.dart';
import '../../utils/resourses/values_manager.dart';

class QuranDetails extends StatelessWidget {
  final Surah surah;
  final List<Ayah> ayahList;

  const QuranDetails({
    Key? key,
    required this.surah,
    required this.ayahList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appBarWidget(
        surah.name.toString().trim(),
        Constants.elevationAppBarOne,
        context,
      ),
      body: ListView.builder(
        itemCount: ayahList.length,
        itemBuilder: (BuildContext context, int index) =>
            buildAyah(height, index, width, context),
      ),
    );
  }

  Widget buildAyah(
    double height,
    int index,
    double width,
    context,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        width * AppSize.s0_015,
        AppSize.s0,
        AppSize.s0,
        AppSize.s0,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: height * AppSize.s0_013,
          backgroundColor: ColorManager.darkDlue,
          child: CircleAvatar(
            radius: height * AppSize.s0_013,
            backgroundColor: ColorManager.white,
            child: Text(
              ayahList[index].numberInSurah.toString(),
              style: TextStyle(
                fontSize: height * AppSize.s0_013,
                color: ColorManager.blue,
              ),
            ),
          ),
        ),
        title: SelectableText(
          ayahList[index].text,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
