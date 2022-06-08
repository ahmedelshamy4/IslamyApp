import 'package:flutter/material.dart';

import '../../utils/resourses/values_manager.dart';

class BuildCard extends StatelessWidget {
  String title;
  String route;
  String image;
  BuildContext context;
  BuildCard({
    Key? key,
    required this.title,
    required this.route,
    required this.image,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s8,
            vertical: AppSize.s8,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Card(
                  elevation: AppSize.s10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s10),
                  ),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(image),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Card(
                  elevation: AppSize.s10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s10),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
