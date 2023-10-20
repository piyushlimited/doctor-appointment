import 'dart:io';
import 'package:dio/dio.dart';

class ApiClient {
  static ApiClient? _instance;
  late Dio _dio;

  factory ApiClient() {
    _instance ??= ApiClient._();
    return _instance!;
  }

  ApiClient._() {
    _dio = Dio();
  }

  static void initialize(String baseUrl,
      {Duration timeout = const Duration(seconds: 15)}) {
    _instance?._dio.options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        });
  }

  Future<Response> getRequest(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      _checkResponseStatusCode(response);
      return response;
    } on DioException catch (exception) {
      throw await _handleApiError(exception);
    }
  }

  Future<Response> postRequest(String endpoint, dynamic data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      _checkResponseStatusCode(response);
      return response;
    } on DioException catch (exception) {
      throw await _handleApiError(exception);
    }
  }

  Future<Response> postMultipartRequest(
      String endpoint, Map<String, dynamic>? data, List<File>? files) async {
    try {
      final formData = FormData();
      if (data != null) {
        formData.fields.addAll(
            data.entries.map((e) => MapEntry(e.key, e.value.toString())));
      }
      if (files != null) {
        for (int i = 0; i < files.length; i++) {
          final file = files[i];
          formData.files.add(MapEntry(
            'file$i',
            await MultipartFile.fromFile(file.path),
          ));
        }
      }

      final response = await _dio.post(endpoint, data: formData);
      _checkResponseStatusCode(response);
      return response;
    } on DioException catch (exception) {
      throw await _handleApiError(exception);
    }
  }

  void _checkResponseStatusCode(Response response) {
    if (response.statusCode != 200) {
      throw ApiException(
          response.statusCode!, "Something went wrong, Please try again.");
    }
  }

  Future<ApiException> _handleApiError(DioException error) async {
    return ApiException(
        error.response?.statusCode ?? 0,
        error.response?.statusMessage ??
            "Something went wrong, Please try again.");
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() {
    return 'ApiException: $statusCode - $message';
  }
}
