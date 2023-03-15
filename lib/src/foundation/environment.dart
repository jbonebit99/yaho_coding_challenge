enum Flavor { development, staging, production }

abstract class Environment {
  factory Environment.to() {
    final flavor = Flavor.values.byName(
      const String.fromEnvironment('FLAVOR', defaultValue: 'development'),
    );
    switch (flavor) {
      case Flavor.development:
        return _DevEnvironment();
      case Flavor.staging:
        return _StgEnvironment();
      case Flavor.production:
        return _PrdEnvironment();
    }
  }

  Flavor get flavor;
  String get baseUrl;

  static final Environment instance = Environment.to();
}

class _DevEnvironment implements Environment {
  @override
  Flavor get flavor => Flavor.development;

  @override
  String get baseUrl => 'https://reqres.in/';
}

class _StgEnvironment implements Environment {
  @override
  Flavor get flavor => Flavor.staging;

  @override
  String get baseUrl => 'https://reqres.in/';
}

class _PrdEnvironment implements Environment {
  @override
  Flavor get flavor => Flavor.production;

  @override
  String get baseUrl => 'https://reqres.in/';
}
