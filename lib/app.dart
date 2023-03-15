import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaho_coding_challenge/src/gen/fonts.gen.dart';
import 'package:yaho_coding_challenge/src/l10n/l10n.dart';
import 'package:yaho_coding_challenge/src/router/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Tín Đạt Express',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontFamily.montserrat,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
