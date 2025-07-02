import 'package:get/get.dart';

import '../analytics_controller/aile_gurugram_controller.dart';

class AlieGuruGramBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AlieGuruGramController());
  }

}