import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/core/api/app_interceptor.dart';
import 'package:quotes/core/api/dio_helper.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_quote/data/datasources/local_data_sorce.dart';
import 'package:quotes/features/random_quote/data/datasources/remote_data_sorce.dart';
import 'package:quotes/features/random_quote/data/repositories/quote_repository.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_quote_use_case.dart';
import 'package:quotes/features/random_quote/presentation/cubit/quote_cubit.dart';
import 'package:quotes/features/splash/data/datasources/cash_lang_data_source.dart';
import 'package:quotes/features/splash/data/repositories/lang_repostiory.dart';
import 'package:quotes/features/splash/domain/repositories/base_lang_repository.dart';
import 'package:quotes/features/splash/domain/usecases/change_lang_usecase.dart';
import 'package:quotes/features/splash/domain/usecases/get_lang_usecase.dart';
import 'package:quotes/features/splash/presentation/cubit/lang_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future init() async {
  /// blocs
  sl.registerFactory<QuoteCubit>(() => QuoteCubit(sl()));
  sl.registerFactory<LangCubit>(() => LangCubit(changeLangUseCase: sl(),getLangUseCase: sl()));

  //UseCases
  sl.registerLazySingleton(() => GetRandomQuoteUseCase(sl()));
  sl.registerLazySingleton(() => GetLangUseCase(baseLangRepository: sl()));
  sl.registerLazySingleton(() => ChangeLangUseCase(baseLangRepository: sl()));
  //repository
  sl.registerLazySingleton<BaseQuteRepository>(() => QuoteRepsitory(
        remoteDataSorce: sl(),
        localDataSorce: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<BaseLangRepository>(() => LangRepository(cashLangDataSource: sl()));
  //DataSorce
  sl.registerLazySingleton<BaseRemoteDataSorce>(
      () => RemoteDataSorce(dioHelper: sl()));
  sl.registerLazySingleton<BaseLocalDataSorce>(
      () => LocalDataSorce(sharedPreferences: sl()));
  sl.registerLazySingleton<BaseCashLangDataSource>(
      () => CashLangDataSource(sharedPreferences: sl()));

  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DioHelper(dio: sl()));
  //External
  final sp = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sp);
  sl.registerLazySingleton(() => AppInterceptor());
  sl.registerLazySingleton(() =>
      LogInterceptor(responseBody: true, error: true, responseHeader: false),);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
