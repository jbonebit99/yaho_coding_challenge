import 'package:dio/dio.dart';
import 'package:yaho_coding_challenge/src/data/model/user_response.dart';
import 'package:yaho_coding_challenge/src/data/remote/dio.dart';
import 'package:yaho_coding_challenge/src/data/remote/user/user_api.dart';

class RestUserApi extends UserApi {
  RestUserApi(super.ref);

  Dio get _dio => ref.read(dioProvider);

  @override
  Future<UserResponse> getUser(int page) async {
    final response = await _dio.get<Map<String, Object?>>(
      '/api/users?page=$page',
    );
    return UserResponse.fromJson(response.data!);
  }
}
