import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:openapi/openapi.dart';

class OpenApiFactory {
  OpenApiFactory();

  Openapi build({
    required String baseUrl,
  }) {
    return Openapi(
      basePathOverride: baseUrl,
      interceptors: [
        if (kDebugMode) LogInterceptor(requestBody: true, responseBody: true),
      ],
    );
  }
}