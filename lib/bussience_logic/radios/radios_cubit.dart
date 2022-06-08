import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy_app/bussience_logic/radios/radios_states.dart';
import 'package:islamy_app/data/models/radio/radio.dart';

import '../../data/models/custom_error.dart';
import '../../data/respository/radios_repository.dart';

class RadioCubit extends Cubit<RadioState> {
  final RadiosRepository radiosRepository;

  RadioCubit({required this.radiosRepository}) : super(RadioState.initial()) {
    fetchAllRadios();
  }

  Future<void> fetchAllRadios() async {
    emit(state.copyWith(status: RadiosStatus.loading));
    try {
      final List<Radios> radioList = await radiosRepository.fetchRadios();
      emit(state.copyWith(status: RadiosStatus.loaded, radio: radioList));
    } on CustomError catch (e) {
      emit(state.copyWith(status: RadiosStatus.error, error: e));
    }
  }
}
