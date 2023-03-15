// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $rootRoute,
    ];

GoRoute get $rootRoute => GoRouteData.$route(
      path: '/',
      factory: $RootRouteExtension._fromState,
    );

extension $RootRouteExtension on RootRoute {
  static RootRoute _fromState(GoRouterState state) => RootRoute(
        $extra: state.extra as Object?,
      );

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  void push(BuildContext context) => context.push(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);
}
