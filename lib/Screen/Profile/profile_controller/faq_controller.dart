import 'package:get/get.dart';

class FaqController extends GetxController{

  List<String> questions = [
    "How do issues get reported to the authorities?",
    "If I report an issue, does my name go to the authorities?",
  ];

  List<String> answers = [
    "Issues are reported via the app and forwarded to the relevant authorities automatically.",
    "Your name is not shared by default. If you opt-in, it will be shared for follow-up.",
  ];

}