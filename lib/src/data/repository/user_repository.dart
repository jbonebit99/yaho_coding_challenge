import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaho_coding_challenge/src/data/model/user_response.dart';
import 'package:yaho_coding_challenge/src/data/remote/user/user_api.dart';

final userRepositoryProvider = Provider(UserRepository.new);

class UserRepository {
  const UserRepository(this._ref);

  final Ref _ref;
  UserApi get _api => _ref.read(userApiProvider);

  Future<UserResponse> getUser(int page) => _api.getUser(page);
}
