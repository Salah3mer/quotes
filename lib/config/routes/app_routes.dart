
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quote/presentation/cubit/quote_cubit.dart';
import 'package:quotes/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:quotes/core/server/server_locator.dart' as di;
import 'package:quotes/features/splash/presentation/screens/spalsh_screen.dart';

class Routes{
  static const String initalRoute ='/';
  static const String randomQuote ='/randomQuote';

}

class AppRoutes{
  static Route? onGeneratedRoute(RouteSettings routeSettings){
    switch(routeSettings.name) {
      case Routes.initalRoute:
        return MaterialPageRoute(builder:((context)=>const SplashScreen()));
      case Routes.randomQuote:
        return MaterialPageRoute(builder:((context)=> BlocProvider(
            create: (context)=>di.sl<QuoteCubit>()..getRandomQuote(),
            child: const QuoteScreen())));

      default:
      return  onRouteError();
    }

  }
  static Route<dynamic> onRouteError(){
    return MaterialPageRoute(builder: ((context)=>const Scaffold(
      body: Center(child: Text(AppStrings.noRouteFound),),
    )));
  }


}