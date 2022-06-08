import 'package:islamy_app/data/models/custom_error.dart';
import 'package:islamy_app/data/models/quran/surahs.dart';
import 'package:islamy_app/data/web_services/remote/quran_api_services.dart';

class QuranRepository {
  final QuranApiServices quranApiServices;

  QuranRepository({
    required this.quranApiServices,
  });

  Future<List<Surah>> fetchQuran() async {
    try {
      final List<Surah> surahList = await quranApiServices.getQuran();
      return surahList;
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
