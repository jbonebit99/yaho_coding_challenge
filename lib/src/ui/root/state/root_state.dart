import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaho_coding_challenge/src/data/model/user_response.dart';

part 'root_state.freezed.dart';

@freezed
class RootState with _$RootState {
  const factory RootState.data({
    required List<User> users,
    UserResponse? response,
  }) = RootStateData;
  const factory RootState.loading() = RootStateLoading;
  const factory RootState.loadMore({
    required List<User> users,
    UserResponse? response,
  }) = RootStateLoadMore;
  const factory RootState.error({required Exception error}) = RootStateError;
}
