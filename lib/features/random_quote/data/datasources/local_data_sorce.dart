import 'dart:convert';

import 'package:quotes/core/errors/expations.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLocalDataSorce{
  Future<QuoteModel> getFromCash();
  Future<void> cashQuote(QuoteModel quote);
}

class LocalDataSorce implements BaseLocalDataSorce{
  final SharedPreferences sharedPreferences;

  LocalDataSorce({required this.sharedPreferences});
  @override
  Future<bool> cashQuote(QuoteModel quote) async {
    return await sharedPreferences.setString(AppStrings.cashedQuote, json.encode(quote));
  }


  @override
  Future<QuoteModel> getFromCash()async {
   final cashedQuote =  sharedPreferences.getString(AppStrings.cashedQuote);
   if ( cashedQuote !=null) {
    final  jsonQuote = Future.value( QuoteModel.fromJson(jsonDecode(cashedQuote)));
      return jsonQuote;
   }  else{
     throw CacheException();
   }
  }
}