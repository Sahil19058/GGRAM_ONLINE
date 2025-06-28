import 'package:get/get.dart';
import 'package:ggram_online/Screen/Auth/auth_controller/survey_controller.dart';

class SurveyBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SurveyController());
  }

}