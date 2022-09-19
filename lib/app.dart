import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/local/app_localizations_setup.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/config/themes/app_theme.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/server/server_locator.dart'as di;
import 'package:quotes/features/splash/presentation/cubit/lang_cubit.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=> di.sl<LangCubit>()..getSavedLang())
    ],
      child: BlocBuilder<LangCubit,LangState>(
        buildWhen: (previceState,currentState){
          return previceState!=currentState;
        },
        builder:(context,state)=> MaterialApp(
          // خلي بالك منها هي السبب في ان الترجمه ترندر في الاسكرين
          locale: state.locale,
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: lightTheme(),
          onGenerateRoute: AppRoutes.onGeneratedRoute,
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
        ),
      ),
    );
  }
}
