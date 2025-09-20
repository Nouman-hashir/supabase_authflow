import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(String baseUrl)
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ) {
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
      ),
    );
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(DioException error) {
    if (kDebugMode) {
      print("❌ API Error → ${error.type}");
      print("❌ Endpoint → ${error.requestOptions.path}");
      print("❌ Status Code → ${error.response?.statusCode}");
      print("❌ Response → ${error.response?.data}");
    }
  }
}
