/// Exception class for handling various platform-related errors.
class UPlatformException implements Exception {
  final String code;

  UPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later';

      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
