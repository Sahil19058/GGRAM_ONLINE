import 'package:get/get.dart';

class OfficialDetailController extends GetxController{
  late final Map<String, String> official;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    official = Map<String, String>.from(Get.arguments);
  }
}