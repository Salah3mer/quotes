
import 'package:quotes/core/api/dio_helper.dart';
import 'package:quotes/core/api/end_points.dart';
import 'package:quotes/features/random_quote/data/models/quote_model.dart';

abstract class BaseRemoteDataSorce {
  Future<QuoteModel> getRandomQuote();
}

class RemoteDataSorce implements BaseRemoteDataSorce {
  final DioHelper dioHelper;

  RemoteDataSorce({required this.dioHelper});

  @override
  Future<QuoteModel> getRandomQuote() async {
   final response = await dioHelper.getData(url: EndPoints.randomQuote);
   return QuoteModel.fromJson(response);
  }

}