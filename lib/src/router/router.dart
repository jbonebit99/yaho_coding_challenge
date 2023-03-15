import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaho_coding_challenge/src/ui/root/root.dart';

part 'router.g.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: $appRoutes,
  );
});

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData {
  RootRoute({this.$extra});

  final Object? $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      transitionDuration: const Duration(seconds: 2),
      child: const RootPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
