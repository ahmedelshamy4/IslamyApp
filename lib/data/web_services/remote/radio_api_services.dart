import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islamy_app/data/models/radio/radio.dart';

class RadioApiServices {
  Future<List<Radios>> getRadio() async {
    try {
      final response = await rootBundle.loadString("assets/json/radios.json");
      List<Radios> radiosList = [];
      final Map<String, dynamic> responseBody = jsonDecode(response);
      var radiosListBody = responseBody['Radios'] as List;
      //print('surahsListBody : $radiosListBody');

      for (var radio in radiosListBody) {
        radiosList.add(Radios.fromJson(radio));
      }
      return radiosList;
    } catch (e) {
      rethrow;
    }
  }
}
