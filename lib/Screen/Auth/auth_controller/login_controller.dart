import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Routes/route_name.dart';
import '../../../Widgets/custom_snackbar.dart';
import '../../../constants/url_utils.dart';
import '../../../service/api_service.dart';
import '../../../service/auth_service.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  Rx<Country?> selectedCountryCode = Rx(null);
  final AuthService _authService = AuthService();
  final ApiHandler _apiHandler = ApiHandler();
  RxBool isLoggingIn = false.obs;

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

  loginUser() async {
    final String phone = phoneController.text.trim();

    isLoggingIn.value = true;

    await _apiHandler.callAPI(
      apiUrl: UrlUtils.sendOtp,
      methodType: MethodType.post,
      isProgressShow: false,
      params: {
        "mobileNumber": "+${selectedCountryCode.value?.phoneCode ?? 91}$phone",
      },
      onSuccess: (response) {
        isLoggingIn.value = false;
        showCustomSnackBar(message: "Otp send successfully", isError: false);
        Get.toNamed(
          AppRoutes.otpScreen,
          arguments: {
            "mobile_number":
                "+${selectedCountryCode.value ?? 91}${phoneController.text}",
          },
        );
      },
      onError: (error) {
        isLoggingIn.value = false;
        debugPrint("Login Error: $error");
      },
    );
  }

  loginWithGoogle() async {
    await _authService.signOut();
    User? user = await _authService.signInWithGoogle();
  }
}
