import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failure.dart';
import 'package:quotes/core/usecases/use_case.dart';
import 'package:quotes/features/splash/domain/repositories/base_lang_repository.dart';

class GetLangUseCase implements UseCases<String, Noparmas> {
  final BaseLangRepository baseLangRepository;

  GetLangUseCase({required this.baseLangRepository});

  @override
  Future<Either<Failure, String>> call(Noparmas parmas) async {
    return await baseLangRepository.getLang();
  }
}
