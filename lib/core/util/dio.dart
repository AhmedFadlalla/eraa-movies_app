import 'package:dio/dio.dart';

import 'end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,

      ),
    );
    // dio.interceptors.add(LogInterceptor(
    //     responseBody: true,
    //     error: true,
    //     requestHeader: false,
    //     responseHeader: false,
    //     requestBody: true,
    //     request:true,
    //     ));
  }
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    token,
  }) async {
    dio.options.headers["authorization"] = "Bearer $token";
    dio.options.headers["content-type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
     dynamic data,
    token,
  }) async {
    dio.options.headers["authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Content-Type"] = "application/json";
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
      )
    );
  }
}