import 'package:get/get.dart';

class WardDoingController extends GetxController {
  RxInt reported = 138.obs;
  RxInt resolved = 96.obs;
  RxDouble resolutionPercent = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    calculateResolution();
    // Optional: Listen to changes automatically
    everAll([reported, resolved], (_) => calculateResolution());
  }

  void calculateResolution() {
    if (reported.value == 0) {
      resolutionPercent.value = 0;
    } else {
      resolutionPercent.value = resolved.value / reported.value;
    }
  }

}
