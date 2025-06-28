import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final phoneController = TextEditingController();
  CountryCode selectedCode = CountryCode.fromDialCode("+1");
}