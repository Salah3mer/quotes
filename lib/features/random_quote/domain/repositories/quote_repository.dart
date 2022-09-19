import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failure.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';

abstract class BaseQuteRepository{
  Future<Either<Failure,Quote>> getRandomQuote();
}