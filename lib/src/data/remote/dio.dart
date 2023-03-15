import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaho_coding_challenge/src/foundation/environment.dart';

const defaultTimeout = Duration(milliseconds: 300000);

final dioProvider = Provider((ref) {
  final dio = Dio()
    ..options.baseUrl = Environment.to().baseUrl
    ..options.contentType = 'application/json'
    ..options.connectTimeout = defaultTimeout
    ..options.receiveTimeout = defaultTimeout
    ..options.sendTimeout = defaultTimeout;

  ref.onDispose(dio.close);
  return dio;
});
