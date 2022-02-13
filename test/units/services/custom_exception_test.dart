import 'package:carg/services/custom_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomException', () {
    test('PERMISSION_DENIED', () {
      final exception = CustomException('PERMISSION_DENIED');
      expect(exception.code, 'PERMISSION_DENIED');
      expect(exception.message, "Erreur : Vous n'êtes pas authentifiez");
    });
  });
}
