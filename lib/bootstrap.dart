import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:yaho_coding_challenge/src/gen/assets.gen.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final licenseMontserrat = await rootBundle.loadString(
      Assets.fonts.montserrat.ofl,
    );
    yield LicenseEntryWithLineBreaks(['Montserrat'], licenseMontserrat);
  });

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  final widget = await builder();
  await runZonedGuarded(
    () async => runApp(
      ProviderScope(
        observers: [LogOfProviderScope()],
        child: widget,
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class LogOfProviderScope extends ProviderObserver {
  final log = Logger('LogOfProviderScope');
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log
      ..info('provider: ${provider.name ?? provider.runtimeType}')
      ..info('newValue: $newValue');
  }
}
