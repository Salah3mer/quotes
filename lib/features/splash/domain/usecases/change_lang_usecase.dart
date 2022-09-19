import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failure.dart';
import 'package:quotes/core/usecases/use_case.dart';
import 'package:quotes/features/splash/domain/repositories/base_lang_repository.dart';

class ChangeLangUseCase implements UseCases<bool , String>{
  final BaseLangRepository baseLangRepository;

  ChangeLangUseCase({required this.baseLangRepository});
  @override
  Future<Either<Failure, bool>> call(String langCode) async{
    return await baseLangRepository.changLang(lang: langCode);
  }
}