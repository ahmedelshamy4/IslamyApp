import 'package:equatable/equatable.dart';
import 'package:islamy_app/data/models/radio/radio.dart';

import '../../data/models/custom_error.dart';

enum RadiosStatus { initial, loading, loaded, error }

class RadioState extends Equatable {
  final RadiosStatus status;
  final List<Radios> radio;
  final CustomError error;

  const RadioState(
      {required this.status, required this.radio, required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [status, radio, error];

  factory RadioState.initial() {
    return const RadioState(
      status: RadiosStatus.initial,
      radio: [],
      error: CustomError(),
    );
  }

  RadioState copyWith({
    RadiosStatus? status,
    List<Radios>? radio,
    CustomError? error,
  }) {
    return RadioState(
      status: status ?? this.status,
      radio: radio ?? this.radio,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'RadioState(status: $status, surah: $radio, error: $error)';
}
