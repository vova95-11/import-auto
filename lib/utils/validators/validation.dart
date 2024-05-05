class UValidator {
  // Empty Text Validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName является обязательным';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Необходимо добавить электронную почту';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Неверный адрес электронной почты';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Необходимо добавить пароль';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Длина пароля должна составлять не менее шести символов';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Пароль должен содержать минимум одну заглавную букву';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Пароль должен содержать минимум одну цифру';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Пароль должен содержать минимум один специальный символ';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Необходимо добавить номер мобильного телефона';
    }

    // Regular expression for phone number validation (assuming a 10-digit RU phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Номер телефона указан неверно (требуется ввести 10 цифр)';
    }

    return null;
  }
}
