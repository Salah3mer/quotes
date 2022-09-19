import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failure.dart';
import 'package:quotes/core/usecases/use_case.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';

class GetRandomQuoteUseCase implements UseCases<Quote,Noparmas>{
  final BaseQuteRepository baseQuteRepository;
  GetRandomQuoteUseCase(this.baseQuteRepository);
  @override
  Future<Either<Failure, Quote>> call(Noparmts) {
    return baseQuteRepository.getRandomQuote();
  }
 
  
}