import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Theme/app_color.dart';
import '../../Theme/app_textstyle.dart';
import '../../Widgets/common_appbar.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.backgroundContainer,
        image: DecorationImage(
          image: AssetImage('assets/image/Splash.png'),
          opacity: 0.2,
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CommonAppBar(
            title: "Frequently Asked Questions",
            centerTitle: true,
          ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildBody()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    List<bool> isExpandedList = List.generate(2, (_) => false); // track expansion

    List<String> questions = [
      "How do issues get reported to the authorities?",
      "If I report an issue, does my name go to the authorities?",
    ];

    List<String> answers = [
      "Issues are reported via the app and forwarded to the relevant authorities automatically.",
      "Your name is not shared by default. If you opt-in, it will be shared for follow-up.",
    ];

    return StatefulBuilder(builder: (context, setState) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.outlineMinimal),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: Colors.grey.shade200,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          questions[index],
                          style: AppTextStyles.reportForm,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpandedList[index] = !isExpandedList[index];
                          });
                        },
                        child: SvgPicture.asset(
                          isExpandedList[index]
                              ? "assets/icons/Up arrow.svg"
                              : "assets/icons/Down arrow.svg",
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ],
                  ),
                  if (isExpandedList[index]) ...[
                    const SizedBox(height: 12),
                    const Divider(color: AppColor.dividerColor),
                    const SizedBox(height: 12),
                    Text(
                      "Ans: ${answers[index]}",
                      style: AppTextStyles.faqAns
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      );
    });
  }

}
