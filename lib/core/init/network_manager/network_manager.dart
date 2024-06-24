import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_arch_example_riverpod/core/constants/constants.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class NetworkManager {

  NetworkManager(this.ref, this.baseUrl){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl ?? kFcmBaseUrl,
    ),);
  }

  final Ref ref;
  String? baseUrl;
  late Dio _dio;

  Future<Response<dynamic>> get(
    String apiUrl, {
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.get(
      apiUrl,
      queryParameters: queryParameters,
      options: Options(
        responseType: responseType,
      ),
    );
  }

  Future<Response<dynamic>> post(
    String apiUrl, {
    Map? body,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.post(
      apiUrl,
      queryParameters: queryParameters,
      options: Options(
        responseType: responseType,
      ),
      data: body != null ? json.encode(body) : null,
    );
  }

  Future<Response> formDataPost(
    String apiUrl, {
    FormData? body,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onSendProgress,
  }) async {
    return _dio.post(
      apiUrl,
      queryParameters: queryParameters,
      options: Options(
        responseType: responseType,
      ),
      data: body,
      onSendProgress: (int sent, int total) {
        if (onSendProgress != null) {
          onSendProgress(sent, total);
        }
      },
    );
  }

  Future<Response> formDataPatch(
    String apiUrl, {
    FormData? body,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? queryParameters,
    Function(int, int)? onSendProgress,
  }) async {
    return _dio.patch(
      apiUrl,
      queryParameters: queryParameters,
      options: Options(
        responseType: responseType,
      ),
      data: body,
      onSendProgress: (int sent, int total) {
        if (onSendProgress != null) {
          onSendProgress(sent, total);
        }
      },
    );
  }

  Future<Response> patch(
    String apiUrl, {
    Map? body,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.patch(
      apiUrl,
      queryParameters: queryParameters,
      options: Options(
        responseType: responseType,
      ),
      data: json.encode(body),
    );
  }

  Future<Response> delete(
    String apiUrl, {
    Map? body,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.delete(
      apiUrl,
      queryParameters: queryParameters,
      options: Options(
        responseType: responseType,
      ),
      data: body != null ? json.encode(body) : null,
    );
  }

  Future<String?> getFileSize(String url) async {
    final response = await get(url);
    return response.headers['content-length']?.first;
  }

/*  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }*/
}

final networkManagerProvider = Provider.family<NetworkManager,String?>(NetworkManager.new);