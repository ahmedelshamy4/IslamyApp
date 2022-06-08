import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamy_app/bussience_logic/azan/cubit.dart';
import 'package:islamy_app/bussience_logic/quran/cubit/quran_cubit.dart';
import 'package:islamy_app/bussience_logic/radios/radios_cubit.dart';
import 'package:islamy_app/data/respository/quran_repository.dart';
import 'package:islamy_app/data/respository/radios_repository.dart';
import 'package:islamy_app/data/web_services/remote/quran_api_services.dart';
import 'package:islamy_app/data/web_services/remote/radio_api_services.dart';
import 'package:islamy_app/presentation/utils/resourses/app_strings_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/theme_manager.dart';

import '../bussience_logic/onBoarding/cubit.dart';
import '../presentation/utils/routes/routes_managment.dart';

class MyApp extends StatelessWidget {
  final RouteGenerator appRouter;
  final String? initialRoute;

  const MyApp({
    super.key,
    required this.appRouter,
    this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        //Quran
        RepositoryProvider(
          create: (context) => QuranRepository(
            quranApiServices: QuranApiServices(),
          ),
        ),
        //Radios
        RepositoryProvider(
          create: (context) => RadiosRepository(
            radioApiServices: RadioApiServices(),
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<OnBoardingCubit>(create: (context) => OnBoardingCubit()),
          BlocProvider<AppCubit>(create: (context) => AppCubit()..determinePosition()),
          BlocProvider<QuranCubit>(
            create: (context) => QuranCubit(
              quranRepository: context.read<QuranRepository>(),
            ),
          ),
          BlocProvider<RadioCubit>(
            create: (context) => RadioCubit(
              radiosRepository: context.read<RadiosRepository>(),
            ),
          ),
        ],
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.titleApp,
            theme: getApplicationTheme(),
            initialRoute: initialRoute,
            onGenerateRoute: RouteGenerator.generateRoute,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale(AppStrings.languageCode, AppStrings.countryCode),
            ],
          ),
        ),
      ),
    );
  }
}
