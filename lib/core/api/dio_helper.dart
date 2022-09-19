import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/app_interceptor.dart';
import 'package:quotes/core/api/end_points.dart';
import 'package:quotes/core/api/status.dart';
import 'package:quotes/core/errors/expations.dart';
import 'package:quotes/core/server/server_locator.dart' as di;

class DioHelper implements ApiConsuomers {
  final Dio dio;

  DioHelper({required this.dio}) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..receiveDataWhenStatusError = true
      ..followRedirects = true;

    dio.interceptors.add(di.sl<AppInterceptor>());
    if(kDebugMode) {
      dio.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future getData(
      {required String url,
      Map<String, dynamic>? qary,
      String? token,
      String lang = 'en'}) async{
    try{
      final response = await dio.get(url , queryParameters:  qary);
      return jsonResponse(response);
    } on DioError catch (error){
      _handleDioError(error);
    }

  }

  @override
  Future postData(
      {required String url,
      Map<String, dynamic>? qary,
      required Map<String, dynamic>? sendDate,
      String? token,
      String lang = 'en'}) async{

      try{
        final response = await dio.post(url , queryParameters:  qary,data: sendDate);
        return jsonResponse(response);
      } on DioError catch (error){
       return _handleDioError(error);
      }

  }

  @override
  Future putData(
      {required String url,
      Map<String, dynamic>? qary,
      required Map<String, dynamic>? sendDate,
      required String? token,
      String lang = 'en'}) async{

    try{
      final response = await dio.put(url , queryParameters:  qary,data: sendDate);
      return jsonResponse(response);
    } on DioError catch (error){
       _handleDioError(error);
    }

  }

  @override
  Future remove(
      {required String url,
      Map<String, dynamic>? qary,
      Map<String, dynamic>? sendDate,
      required String? token,
      String lang = 'en'}) async{
    try{
      final response = await dio.delete(url , queryParameters:  qary,data: sendDate,);
      return jsonResponse(response);
    } on DioError catch (error){
       _handleDioError(error);
    }

  }

  dynamic jsonResponse(Response<dynamic> response){
   final jResponse = jsonDecode(response.data.toString());
   return jResponse;
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.confilct:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
