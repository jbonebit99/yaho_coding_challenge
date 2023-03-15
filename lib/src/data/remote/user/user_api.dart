import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaho_coding_challenge/src/data/model/user_response.dart';
import 'package:yaho_coding_challenge/src/data/remote/user/rest_user_api.dart';

final userApiProvider = Provider<UserApi>(RestUserApi.new);

abstract class UserApi {
  const UserApi(this.ref);

  final Ref ref;

  Future<UserResponse> getUser(int page);
}
