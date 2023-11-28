import 'package:flutter_test/flutter_test.dart';
import 'package:proto/loginNavMain.dart';

void main() {
  group('AuthService', () {
    late AuthService authService;

    setUp(() {
      authService = AuthService();
    });

    test('Registration - Success', () async {
      final result = await authService.registration(
        email: 'test@example.com',
        password: 'testPassword',
      );
      expect(result, 'success');
    });

    test('Registration - Weak Password', () async {
      final result = await authService.registration(
        email: 'test@example.com',
        password: 'weak',
      );
      expect(result, 'The password provided is too weak.');
    });

    test('Registration - Email Already in Use', () async {
      final result = await authService.registration(
        email: 'existing@example.com',
        password: 'password123',
      );
      expect(result, 'The email is already being used. Try another one');
    });

    test('Login - Success', () async {
      final result = await authService.login(
        email: 'test@example.com',
        password: 'testPassword',
      );
      expect(result, 'success');
    });

    test('Login - User Not Found', () async {
      final result = await authService.login(
        email: 'nonexistent@example.com',
        password: 'password123',
      );
      expect(result, 'User with that email not found');
    });

    test('Login - Wrong Password', () async {
      final result = await authService.login(
        email: 'test@example.com',
        password: 'wrongPassword',
      );
      expect(result, 'Wrong password, try again');
    });
  });
}
