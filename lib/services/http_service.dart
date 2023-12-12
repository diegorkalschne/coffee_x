import 'dart:io';

import 'package:dio/dio.dart';

class HttpService {
  ///Responsável por fazer requisições do tipo `GET`
  static Future<dynamic> get({
    required String url,
    Map? params,
    Map? headers,
  }) async {
    try {
      String urlRequest = url;

      if (headers != null) {
        headers.addAll({
          HttpHeaders.acceptHeader: 'application/json',
        });
      }

      final dio = Dio();

      Response response = await dio.get(
        urlRequest,
        queryParameters: params?.cast(),
        options: Options(
          headers: headers?.cast(),
          followRedirects: false,
          contentType: 'application/json',
          maxRedirects: 0,
          method: 'GET',
          validateStatus: (status) {
            return (status ?? 404) < 300;
          },
        ),
      );

      return response.data;
    } catch (err) {
      rethrow;
    }
  }
}
