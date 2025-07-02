import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';
import '../../../Theme/app_color.dart';
import '../../../Theme/app_textstyle.dart';
import '../analytics_controller/aile_gurugram_controller.dart';

class AileGuruGramWidget extends GetView<AlieGuruGramController> {
  const AileGuruGramWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdown(
              title: "Zone",
              value: controller.selectedZone?.value,
              items: controller.zoneList,
              onChanged: (newValue) {
                controller.selectedZone?.value = newValue!;
              },
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              title: "Ward",
              value: controller.selectedZone?.value,
              items: controller.zoneList,
              onChanged: (newValue) {
                controller.selectedZone?.value = newValue!;
              },
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              title: "Sector",
              value: controller.selectedZone?.value,
              items: controller.zoneList,
              onChanged: (newValue) {
                controller.selectedZone?.value = newValue!;
              },
            ),
            const SizedBox(height: 24),
            Obx(() {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 330,
                child: SfTreemap(
                  colorMappers: [
                    TreemapColorMapper.range(
                      from: 0,
                      to: 20,
                      color: controller.colors[0],
                    ),
                    TreemapColorMapper.range(
                      from: 21,
                      to: 50,
                      color: controller.colors[1],
                    ),
                    TreemapColorMapper.range(
                      from: 51,
                      to: 80,
                      color: controller.colors[2],
                    ),
                    TreemapColorMapper.range(
                      from: 81,
                      to: 100,
                      color: controller.colors[3],
                    ),
                    TreemapColorMapper.range(
                      from: 101,
                      to: 120,
                      color: controller.colors[4],
                    ),
                  ],
                  dataCount: controller.items.length,
                  weightValueMapper: (int index) =>
                      controller.items[index].value,
                  levels: [
                    TreemapLevel(
                      groupMapper: (index) => controller.items[index].title,

                      labelBuilder: (context, tile) => Center(
                        child: Text(
                          tile.group,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      colorValueMapper: (tile) => tile.indices[0].toDouble(),
                      color: Colors.transparent,
                      tooltipBuilder: (context, tile) {
                        final item = controller.items[tile.indices[0]];
                        return Text('${item.title}: ${item.value}');
                      },
                      // padding: const EdgeInsets.all(2),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String title,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.reportForm),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: DropdownButtonFormField<String>(
            value: value?.isNotEmpty == true ? value : null,
            decoration: const InputDecoration(border: InputBorder.none),
            icon: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset("assets/icons/Vector.png"),
            ),
            hint: const Text("Please select",
                style: TextStyle(color: AppColor.textPrimary)),
            items: items.map((String val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
