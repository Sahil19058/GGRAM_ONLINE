import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Routes/route_name.dart';
import '../../../Widgets/custom_snackbar.dart';
import '../../../constants/url_utils.dart';
import '../../../service/api_service.dart';

class OtpController extends GetxController {
  TextEditingController otpController = TextEditingController();
  RxBool isLoading = false.obs;
  final ApiHandler _apiHandler = ApiHandler();
  String mobileNumber = "";

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      mobileNumber = Get.arguments["mobile_number"];
    }
  }

  void otpVerificationCall() {
    isLoading.value = true;
    _apiHandler.callAPI(
      apiUrl: UrlUtils.verifyOtp,
      methodType: MethodType.post,
      isProgressShow: false,
      params: {"mobileNumber": mobileNumber, "otp": otpController.text},
      onSuccess: (response) {
        isLoading.value = false;
        Get.toNamed(AppRoutes.bottomNavBar);
        showCustomSnackBar(message: "Verification successful.", isError: false);
      },
      onError: (error) {
        isLoading.value = false;
        debugPrint("Login Error: $error");
      },
    );
  }
}
