import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yaho_coding_challenge/src/data/model/user_response.dart';
import 'package:yaho_coding_challenge/src/data/repository/user_repository.dart';
import 'package:yaho_coding_challenge/src/ui/root/providers/root_provider.dart';
import 'package:yaho_coding_challenge/src/ui/root/state/root_state.dart';
import 'root_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  group('RootStateNotifier', () {
    final mockUserRepository = MockUserRepository();
    final listener = MockListener<RootState>();
    RootStateNotifier override() {
      final container = ProviderContainer(
        overrides: [
          userRepositoryProvider.overrideWithValue(mockUserRepository),
        ],
      );
      addTearDown(container.dispose);

      container.listen<RootState?>(
        rootStateProvider,
        listener.call,
        fireImmediately: true,
      );
      return container.read(rootStateProvider.notifier);
    }

    group('fetch#getUser', () {
      test('success', () async {
        when(mockUserRepository.getUser(1))
            .thenAnswer((_) async => userResponseMockData1);
        final notifier = override();
        await notifier.fetch();

        verifyInOrder([
          listener(
            any,
            RootStateData(
              users: userResponseMockData1.data ?? [],
              response: userResponseMockData1,
            ),
          ),
        ]);
      });

      test('fail', () async {
        when(mockUserRepository.getUser(1)).thenAnswer(
          (_) async => throw Exception('test'),
        );
        final notifier = override();

        // test & verify
        await notifier.fetch();
        verifyInOrder([
          listener(any, const RootStateLoading()),
          listener(any, argThat(isA<RootStateError>())),
        ]);
      });
    });

    group('loadMore#getUser', () {
      test('success', () async {
        when(mockUserRepository.getUser(1))
            .thenAnswer((_) async => userResponseMockData1);
        final notifier = override();
        await notifier.fetch();

        verifyInOrder([
          listener(
            any,
            RootStateData(
              users: userResponseMockData1.data ?? [],
              response: userResponseMockData1,
            ),
          ),
        ]);
        when(mockUserRepository.getUser(2))
            .thenAnswer((_) async => userResponseMockData2);
        await notifier.loadMore();

        verifyInOrder([
          listener(
            any,
            RootStateLoadMore(
              users: userResponseMockData1.data ?? [],
              response: userResponseMockData1,
            ),
          ),
          listener(
            any,
            RootStateData(
              users: [
                ...userResponseMockData1.data ?? [],
                ...userResponseMockData2.data ?? []
              ],
              response: userResponseMockData2,
            ),
          ),
        ]);
      });

      test('fail', () async {
        when(mockUserRepository.getUser(1)).thenAnswer(
          (_) async => throw Exception('test1'),
        );
        final notifier = override();

        // test & verify
        await notifier.fetch();
        verifyInOrder([
          listener(any, const RootStateLoading()),
          listener(any, argThat(isA<RootStateError>())),
        ]);
        when(mockUserRepository.getUser(2)).thenAnswer(
          (_) async => throw Exception('test2'),
        );
        await notifier.loadMore();
        verifyInOrder([
          listener(any, argThat(isA<RootStateError>())),
        ]);
      });
    });
  });
}

class MockListener<T> extends Mock {
  void call(T? previous, T? value);
}

final userResponseMockData1 = UserResponse.fromJson(<String, Object?>{
  'page': 1,
  'per_page': 6,
  'total': 12,
  'total_pages': 2,
  'data': [
    {
      'id': 1,
      'email': 'george.bluth@reqres.in',
      'first_name': 'George',
      'last_name': 'Bluth',
      'avatar': 'https://reqres.in/img/faces/1-image.jpg'
    },
    {
      'id': 2,
      'email': 'janet.weaver@reqres.in',
      'first_name': 'Janet',
      'last_name': 'Weaver',
      'avatar': 'https://reqres.in/img/faces/2-image.jpg'
    },
    {
      'id': 3,
      'email': 'emma.wong@reqres.in',
      'first_name': 'Emma',
      'last_name': 'Wong',
      'avatar': 'https://reqres.in/img/faces/3-image.jpg'
    },
    {
      'id': 4,
      'email': 'eve.holt@reqres.in',
      'first_name': 'Eve',
      'last_name': 'Holt',
      'avatar': 'https://reqres.in/img/faces/4-image.jpg'
    },
    {
      'id': 5,
      'email': 'charles.morris@reqres.in',
      'first_name': 'Charles',
      'last_name': 'Morris',
      'avatar': 'https://reqres.in/img/faces/5-image.jpg'
    },
    {
      'id': 6,
      'email': 'tracey.ramos@reqres.in',
      'first_name': 'Tracey',
      'last_name': 'Ramos',
      'avatar': 'https://reqres.in/img/faces/6-image.jpg'
    }
  ],
  'support': {
    'url': 'https://reqres.in/#support-heading',
    'text':
        'To keep ReqRes free, contributions towards server costs are appreciated!'
  }
});

final userResponseMockData2 = UserResponse.fromJson(<String, Object?>{
  'page': 2,
  'per_page': 6,
  'total': 12,
  'total_pages': 2,
  'data': [
    {
      'id': 7,
      'email': 'michael.lawson@reqres.in',
      'first_name': 'Michael',
      'last_name': 'Lawson',
      'avatar': 'https://reqres.in/img/faces/7-image.jpg'
    },
    {
      'id': 8,
      'email': 'lindsay.ferguson@reqres.in',
      'first_name': 'Lindsay',
      'last_name': 'Ferguson',
      'avatar': 'https://reqres.in/img/faces/8-image.jpg'
    },
    {
      'id': 9,
      'email': 'tobias.funke@reqres.in',
      'first_name': 'Tobias',
      'last_name': 'Funke',
      'avatar': 'https://reqres.in/img/faces/9-image.jpg'
    },
    {
      'id': 10,
      'email': 'byron.fields@reqres.in',
      'first_name': 'Byron',
      'last_name': 'Fields',
      'avatar': 'https://reqres.in/img/faces/10-image.jpg'
    },
    {
      'id': 11,
      'email': 'george.edwards@reqres.in',
      'first_name': 'George',
      'last_name': 'Edwards',
      'avatar': 'https://reqres.in/img/faces/11-image.jpg'
    },
    {
      'id': 12,
      'email': 'rachel.howell@reqres.in',
      'first_name': 'Rachel',
      'last_name': 'Howell',
      'avatar': 'https://reqres.in/img/faces/12-image.jpg'
    }
  ],
  'support': {
    'url': 'https://reqres.in/#support-heading',
    'text':
        'To keep ReqRes free, contributions towards server costs are appreciated!'
  }
});
