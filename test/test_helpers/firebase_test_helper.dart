import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void setupFirebaseAuthMocks() {
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  // Old style firebase_core channel
  const coreChannel = MethodChannel('plugins.flutter.io/firebase_core');
  messenger.setMockMethodCallHandler(coreChannel,
      (MethodCall methodCall) async {
    if (methodCall.method == 'Firebase#initializeCore' ||
        methodCall.method == 'initializeCore') {
      return [
        {
          'name': '[DEFAULT]',
          'options': {
            'apiKey': 'fake-api-key',
            'appId': 'fake-app-id',
            'messagingSenderId': 'fake-sender-id',
            'projectId': 'fake-project-id',
          },
          'pluginConstants': {},
        }
      ];
    }
    if (methodCall.method == 'Firebase#initializeApp' ||
        methodCall.method == 'initializeApp') {
      return {
        'name': methodCall.arguments?['appName'] ?? '[DEFAULT]',
        'options': methodCall.arguments?['options'] ?? {},
        'pluginConstants': {},
      };
    }
    return null;
  });

  // Pigeon-based firebase_core host API (newer plugin versions)
  const pigeonChannel = BasicMessageChannel<Object?>(
    'dev.flutter.pigeon.firebase_core_platform_interface.FirebaseCoreHostApi.initializeCore',
    StandardMessageCodec(),
  );

  messenger.setMockMessageHandler(pigeonChannel.name, (dynamic message) async {
    // Return a List wrapped in the encoded message
    return pigeonChannel.codec.encodeMessage([
      [
        {
          'name': '[DEFAULT]',
          'options': {
            'apiKey': 'fake-api-key',
            'appId': 'fake-app-id',
            'messagingSenderId': 'fake-sender-id',
            'projectId': 'fake-project-id',
          },
          'pluginConstants': {},
        }
      ]
    ]);
  });

  // Pigeon-based firebase_auth host APIs (register listeners etc.)
  const authHostApi = MethodChannel(
      'dev.flutter.pigeon.firebase_auth_platform_interface.FirebaseAuthHostApi');
  messenger.setMockMethodCallHandler(authHostApi,
      (MethodCall methodCall) async {
    return null;
  });
}
