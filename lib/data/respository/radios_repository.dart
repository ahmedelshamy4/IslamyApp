import 'package:islamy_app/data/models/radio/radio.dart';
import 'package:islamy_app/data/web_services/remote/radio_api_services.dart';

import '../models/custom_error.dart';

class RadiosRepository {
  final RadioApiServices radioApiServices;

  RadiosRepository({required this.radioApiServices});

  Future<List<Radios>> fetchRadios() async {
    try {
      final List<Radios> radioList = await radioApiServices.getRadio();
      return radioList;
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
