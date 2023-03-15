import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaho_coding_challenge/src/data/model/user_response.dart';
import 'package:yaho_coding_challenge/src/data/repository/user_repository.dart';
import 'package:yaho_coding_challenge/src/ui/root/state/root_state.dart';

enum ViewType { list, gird }

final viewTypeInRootProvider = StateProvider<ViewType>((ref) {
  return ViewType.list;
});

final popularUserCountProvider = Provider<AsyncValue<int>>((ref) {
  return ref.watch(paginatedUserProvider(1)).whenData((data) {
    return data.data?.length ?? 0;
  });
});

final paginatedUserProvider =
    FutureProvider.family<UserResponse, int>((ref, pageIndex) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  return ref.read(userRepositoryProvider).getUser(pageIndex);
});

final rootStateProvider =
    StateNotifierProvider<RootStateNotifier, RootState>((ref) {
  return RootStateNotifier(ref.read(userRepositoryProvider));
});

class RootStateNotifier extends StateNotifier<RootState> {
  RootStateNotifier(this._repository) : super(const RootState.loading()) {
    fetch();
  }

  final UserRepository _repository;

  UserResponse? get userResponse => state.when(
        data: (users, response) => response,
        loading: () => null,
        loadMore: (users, response) => response,
        error: (error) => null,
      );

  List<User> get users {
    return state.when(
      data: (users, response) => users,
      loading: () => <User>[],
      loadMore: (users, response) => users,
      error: (error) => <User>[],
    );
  }

  Future<void> fetch() async {
    try {
      final response = await _repository.getUser(userResponse?.page ?? 1);
      state = RootState.data(
        users: [...response.data!],
        response: response,
      );
    } on Exception catch (e) {
      state = RootState.error(error: e);
    }
  }

  Future<void> loadMore() async {
    try {
      if (!_isIdle() || userResponse?.total == users.length) return;

      state = RootState.loadMore(
        users: [...users],
        response: userResponse,
      );
      await Future.delayed(const Duration(seconds: 2), () {});
      final response = await _repository.getUser((userResponse?.page ?? 1) + 1);
      state = RootState.data(
        users: [...users, ...response.data!],
        response: response,
      );
    } on Exception catch (e) {
      state = RootState.error(error: e);
    }
  }

  void handleScrollWithIndex(int index) {
    final perPage = userResponse?.perPage ?? 6;
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % perPage == 0 && itemPosition != 0;
    final pageToRequest = itemPosition ~/ perPage;

    if (requestMoreData && pageToRequest + 1 >= (userResponse?.page ?? 1)) {
      loadMore();
    }
  }

  bool _isIdle() => state.when(
        data: (_, __) => true,
        loading: () => false,
        error: (e) => true,
        loadMore: (_, __) => false,
      );
}
