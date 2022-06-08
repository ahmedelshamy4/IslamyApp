import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/custom_error.dart';
import '../../../data/models/quran/surahs.dart';
import '../../../data/respository/quran_repository.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  final QuranRepository quranRepository;

  QuranCubit({
    required this.quranRepository,
  }) : super(QuranState.initial()) {
    fetchQuran();
  }

  Future<void> fetchQuran() async {
    emit(state.copyWith(status: QuranStatus.loading));
    try {
      final List<Surah> surahList = await quranRepository.fetchQuran();
      emit(state.copyWith(status: QuranStatus.loaded, surah: surahList));
    } on CustomError catch (e) {
      emit(state.copyWith(error: e, status: QuranStatus.error));
    }
  }
}
