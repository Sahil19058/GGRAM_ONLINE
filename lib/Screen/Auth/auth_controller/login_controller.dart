import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final phoneController = TextEditingController();

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
  Rx<Country?> selectedCountryCode = Rx(null);
}