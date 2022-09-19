import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/expations.dart';
import 'package:quotes/core/errors/failure.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_quote/data/datasources/local_data_sorce.dart';
import 'package:quotes/features/random_quote/data/datasources/remote_data_sorce.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepsitory extends BaseQuteRepository {
  final NetworkInfo networkInfo;
  final BaseRemoteDataSorce remoteDataSorce;
  final  BaseLocalDataSorce localDataSorce;

  QuoteRepsitory({
    required this.remoteDataSorce,
    required this.localDataSorce,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final resulte = await remoteDataSorce.getRandomQuote();
        localDataSorce.cashQuote(resulte);
        return Right(resulte);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final resulte = await localDataSorce.getFromCash();
        return Right(resulte);
      } on CacheException {
        return Left(CashFailure());
      }
    }
  }
}
