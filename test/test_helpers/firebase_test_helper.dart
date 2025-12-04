import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFirebasePlatform extends FirebasePlatform {
  MockFirebasePlatform() : super();

  static Map<String, FirebaseAppPlatform> _apps = {};

  @override
  FirebaseAppPlatform app([String name = defaultFirebaseAppName]) {
    if (_apps.containsKey(name)) {
      return _apps[name]!;
    }
    throw FirebaseException(
      plugin: 'core',
      code: 'no-app',
      message: 'No Firebase App "$name" has been created.',
    );
  }

  @override
  List<FirebaseAppPlatform> get apps => _apps.values.toList();

  @override
  Future<FirebaseAppPlatform> initializeApp({
    String? name,
    FirebaseOptions? options,
  }) async {
    final appName = name ?? defaultFirebaseAppName;
    if (_apps.containsKey(appName)) {
      return _apps[appName]!;
    }

    final app = MockFirebaseAppPlatform(appName, options ?? _testOptions);
    _apps[appName] = app;
    return app;
  }

  static FirebaseOptions get _testOptions => const FirebaseOptions(
        apiKey: 'fake-api-key',
        appId: 'fake-app-id',
        messagingSenderId: 'fake-sender-id',
        projectId: 'fake-project-id',
      );
}

class MockFirebaseAppPlatform extends FirebaseAppPlatform {
  MockFirebaseAppPlatform(String name, FirebaseOptions options)
      : super(name, options);
}

void setupFirebaseAuthMocks() {
  TestWidgetsFlutterBinding.ensureInitialized();

  FirebasePlatform.instance = MockFirebasePlatform();
}
