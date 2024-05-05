/// Custom exception class to handle various Firebase-related errors.
class UFirebaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  UFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occured. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';

      default:
        return 'An unexpected Firebase error occured. Please try again.'; // Произошла непредвиденная ошибка Firebase. Пожалуйста, попробуйте еще раз.
    }
  }
}
