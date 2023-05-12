import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<Response> get(
    String endPoint, {
    Map<String, dynamic>? query,
  });

  Future<Response> post(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  });

  Future<Response> put(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  });
}
