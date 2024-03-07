import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ulearning_1/common/values/constant.dart';
import 'package:ulearning_1/global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: Duration(seconds: 2),
      receiveTimeout: Duration(seconds: 2),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);
  }

  Future post(String path,
      {dynamic mydata, Map<String, dynamic>? queryParameters , Options? options}) async {
    Options requestOptions = options?? Options();
    requestOptions.headers = requestOptions.headers?? {};
    Map<String, dynamic>? authorization =getAuthorizationHeader();
    if(authorization != null){
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(path,
      data: mydata,
      queryParameters: queryParameters,
      options: requestOptions

    );

    return response.data;
  }

  Map<String, dynamic>? getAuthorizationHeader(){
    var headers =  <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if(accessToken.isNotEmpty){
      headers['Authorization'] = 'Bearer $accessToken';

    }
    return headers;
  }
}
