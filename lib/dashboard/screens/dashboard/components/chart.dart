import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/dashboard/controllers/storage_details_controller.dart';
import '../../../constants.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ride_share/dashboard/controllers/storage_details_controller.dart';
import '../../../constants.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final StorageDetailsController storageDetailsController = Get.put(StorageDetailsController());

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    await storageDetailsController.fetchUserStorageDetailsMethod();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionData,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Obx(() {
                  if (storageDetailsController.isLoading) {
                    return shimmerText(width: 60, height: 12);
                  }
                  return Text(
                    "${storageDetailsController.approvedUser.length} Approved",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      height: 0.5,
                    ),
                  );
                }),
                const SizedBox(height: 4),
                Obx(() {
                  if (storageDetailsController.isLoading) {
                    return shimmerText(width: 80, height: 10);
                  }
                  return Text(
                    "${storageDetailsController.totalUsers.length} of Total App User",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 7,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// A small reusable shimmer line for text placeholders
  Widget shimmerText({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child:  SizedBox(height: height, width: width, child: ColoredBox(color: Colors.white)),
    );
  }
}


List<PieChartSectionData> paiChartSelectionData = [
  PieChartSectionData(
    color: primaryColor,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 20,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 10,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 15,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: primaryColor.withOpacity(0.1),
    value: 25,
    showTitle: false,
    radius: 13,
  ),
];
