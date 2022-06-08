import 'package:flutter/material.dart';
import '../utils/resourses/app_strings_manager.dart';
import '../utils/resourses/color_manager.dart';
import '../utils/resourses/values_manager.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSize.s10,
                vertical: AppSize.s16,
              ),
              title: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/qua.png",
                  width: AppSize.s180,
                  height: AppSize.s180,
                ),
              ),
            ),
            Divider(color: ColorManager.black38),
            builderListTile(
              context: context,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppSize.s20),
                      topLeft: Radius.circular(AppSize.s20),
                    ),
                  ),
                  builder: (_) {
                    return Container(
                      height: AppSize.s250,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal:AppSize.s30, vertical: AppSize.s5),
                      margin: const EdgeInsets.symmetric(horizontal: AppSize.s30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(20.0),
                          topStart: Radius.circular(20.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60.0, vertical: 5.0),
                              child: Divider(
                                thickness: 3,
                                color: Colors.teal,
                              ),
                            ),
                            SelectableText(
                              AppStrings.about_app,
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: ColorManager.white),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              title: AppStrings.quran,
              icon: Icons.support_outlined,
            )
          ],
        ),
      ),
    );
  }

  Widget builderListTile({
    required BuildContext context,
    required VoidCallback onTap,
    required String title,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s10),
        child: Card(
          elevation: AppSize.s1_5,
          color: ColorManager.greyShade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.s20,
            ),
          ),
          child: ListTile(
            title: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    icon,
                    color: ColorManager.blue,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
