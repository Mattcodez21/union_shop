import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void setupFirebaseAuthMocks() {
  TestWidgetsFlutterBinding.ensureInitialized();

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('plugins.flutter.io/firebase_core'),
    (call) async {
      if (call.method == 'Firebase#initializeCore') {
        return [
          {
            'name': '[DEFAULT]',
            'options': {
              'apiKey': '123',
              'appId': '123',
              'messagingSenderId': '123',
              'projectId': '123',
            },
            'pluginConstants': {},
          }
        ];
      }

      if (call.method == 'Firebase#initializeApp') {
        return {
          'name': call.arguments['appName'],
          'options': call.arguments['options'],
          'pluginConstants': {},
        };
      }

      return null;
    },
  );

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('plugins.flutter.io/firebase_auth'),
    (call) async {
      if (call.method == 'Auth#registerIdTokenListener') {
        return {
          'user': null,
        };
      }
      return null;
    },
  );
}
