class FormValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value.trim())) {
      return 'Name must contain only letters';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Age is required';
    } else if (!RegExp(r'^[1-9][0-9]?$|^100$').hasMatch(value.trim())) {
      return 'Age must be between 1 and 100';
    }
    return null;
  }

  static String? validatePin(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Home PIN is required';
    } else if (!RegExp(r'^\d{6}$').hasMatch(value.trim())) {
      return 'PIN must be exactly 6 digits';
    }
    return null;
  }

  static String? validateGender(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Gender is required';
    }
    return null;
  }

  static String? validateStatus(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Residential status is required';
    }
    return null;
  }
}
