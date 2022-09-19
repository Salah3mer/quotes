import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/expations.dart';
import 'package:quotes/core/errors/failure.dart';
import 'package:quotes/features/splash/data/datasources/cash_lang_data_source.dart';
import 'package:quotes/features/splash/domain/repositories/base_lang_repository.dart';

class LangRepository implements BaseLangRepository {
  final BaseCashLangDataSource cashLangDataSource;

  LangRepository({required this.cashLangDataSource});

  @override
  Future<Either<Failure, bool>> changLang({required String lang}) async {
    try {
      final langIsChanged =
          await cashLangDataSource.changeSavedLang(langCode: lang);
      return Right(langIsChanged);
    } on CacheException {
      return Left(CashFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getLang() async{
    try {
      final langCode =
          await cashLangDataSource.getLangCode();
      return Right(langCode);
    } on CacheException {
      return Left(CashFailure());
    }
  }
}
