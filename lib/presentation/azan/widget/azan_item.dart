import 'package:flutter/material.dart';
import 'package:islamy_app/presentation/utils/resourses/assets_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/color_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/values_manager.dart';

Widget salaItem({
  required context,
  required String Enstring,
  required String Tstring,
  required String Arstring,
}) {
  return SingleChildScrollView(
    child: SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.075,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.335,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      ImageAssets.bg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.335,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.14),
                      borderRadius: BorderRadius.circular(AppSize.s8),

                  ),
                ),
                Text(
                  Enstring,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: ColorManager.primary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Center(
              child: Text(
                Tstring,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary),
                textAlign: TextAlign.right,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.335,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      ImageAssets.bg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.335,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.14),
                      borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.5, 0.5),
                        spreadRadius: 1.5,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.335,
                    child: Center(
                      child: Text(
                        Arstring,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Theme.of(context).canvasColor,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
