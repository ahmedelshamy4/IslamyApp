import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islamy_app/bussience_logic/azan/states.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(ThemeInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  var locationLAT = 30.21035;
  var locationLON = 31.36812;
  late PrayerTimes prayerTimes;


  void determinePosition() {
    final myCoordinates = Coordinates(locationLAT, locationLON);
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.hanafi;
    prayerTimes = PrayerTimes.today(myCoordinates, params);
  }
}
