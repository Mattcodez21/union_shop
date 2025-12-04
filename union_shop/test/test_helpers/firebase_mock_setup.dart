import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockFirebaseApp extends Mock implements FirebaseApp {}

Future<void> initializeFirebaseMocks() async {
  final mockApp = MockFirebaseApp();
  when(mockApp.name).thenReturn('[DEFAULT]');
  await Firebase.initializeApp();
  FirebaseAuth.instanceFor(app: mockApp);
}