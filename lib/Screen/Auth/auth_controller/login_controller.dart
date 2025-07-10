import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../service/auth_service.dart';

class LoginController extends GetxController{
  final phoneController = TextEditingController();
  Rx<Country?> selectedCountryCode = Rx(null);
  final AuthService _authService = AuthService();

  openCountryCodePicker(context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      showSearch: false,
      onSelect: (Country country) {
        selectedCountryCode.value = country;
      },
    );
  }

  loginWithGoogle() async {
   await _authService.signOut();
    User? user = await _authService.signInWithGoogle();
  }

}