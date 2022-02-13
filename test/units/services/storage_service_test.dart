import 'package:carg/services/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'storage_service_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late MockFlutterSecureStorage mockFlutterSecureStorage;
  late StorageService storageService;
  const String _email = 'test@test.com';
  const String _key = 'userEmailAddress';

  setUpAll(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    storageService =
        StorageService(flutterSecureStorage: mockFlutterSecureStorage);
  });

  test('Set the email', () async {
    when(mockFlutterSecureStorage.write(key: _key, value: _email))
        .thenAnswer((_) => Future.value());
    storageService.setEmail(_email);
  });

  test('Clear the email', () async {
    when(mockFlutterSecureStorage.delete(key: _key))
        .thenAnswer((_) => Future.value());
    storageService.clearEmail();
  });

  test('Get the email', () async {
    when(mockFlutterSecureStorage.read(key: _key))
        .thenAnswer((_) => Future<String?>(() => _email));
    storageService.getEmail();
  });
}
