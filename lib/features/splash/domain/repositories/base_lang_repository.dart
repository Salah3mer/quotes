import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failure.dart';

abstract class BaseLangRepository{
  Future<Either<Failure,bool>> changLang({required String lang});
  Future<Either<Failure,String>> getLang();
}