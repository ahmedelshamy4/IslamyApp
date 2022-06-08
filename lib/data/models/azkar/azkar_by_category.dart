import 'package:islamy_app/data/models/azkar/azkar_list.dart';

import 'azkar.dart';

class AzkarByCategory {
  final List<Azkar> _azkarList = [];

  List<Azkar> get azkarList => _azkarList;

  getAzkarByCategory(String category) {
    return db
        .where(
          (element) => element.containsValue(category),
        )
        .forEach(
          (element) => _azkarList.add(
            Azkar.fromJson(element),
          ),
        );
  }
}
