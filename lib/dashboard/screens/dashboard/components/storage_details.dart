import 'package:flutter/material.dart';
import 'package:ride_share/dashboard/controllers/storage_details_controller.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';


class StorageDetails extends StatefulWidget {
  const StorageDetails({super.key});

  @override
  State<StorageDetails> createState() => _StorageDetailsState();
}

class _StorageDetailsState extends State<StorageDetails> {
  final StorageDetailsController storageDetailsController = Get.put(StorageDetailsController());

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    await storageDetailsController.fetchUserStorageDetailsMethod();
  }

  Widget buildInfoCard({
    required bool isLoading,
    required int total,
    required int pending,
    required String svg,
    required String title,
    required String emptyTitle,
    required String label,
  }) {
    if (isLoading) return const ShimmerStorageCard();

    if (total == 0) {
      return StorageInfoCard(
        svgSrc: svg,
        title: emptyTitle,
        amountOfFiles: "$total $label",
        numOfFiles: "$pending Pending",
      );
    }

    return StorageInfoCard(
      svgSrc: svg,
      title: title,
      amountOfFiles: "$total $label",
      numOfFiles: "$pending Pending",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Storage Details", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: defaultPadding),
          const Chart(),

          // Users Card
          Obx(() => buildInfoCard(
            isLoading: storageDetailsController.isLoading,
            total: storageDetailsController.totalUsers.length,
            pending: storageDetailsController.pendingUser.length,
            svg: "assets/icons/folder.svg",
            title: "Total Users App",
            emptyTitle: "No Users Found",
            label: "User",
          )),

          // Drivers Card
          Obx(() => buildInfoCard(
            isLoading: storageDetailsController.isLoading,
            total: storageDetailsController.totalDriver.length,
            pending: storageDetailsController.pendingDriver.length,
            svg: "assets/icons/media.svg",
            title: "Total Drivers App",
            emptyTitle: "No Drivers Found",
            label: "Driver",
          )),

          // Passengers Card
          Obx(() => buildInfoCard(
            isLoading: storageDetailsController.isLoading,
            total: storageDetailsController.totalPassenger.length,
            pending: storageDetailsController.pendingPassenger.length,
            svg: "assets/icons/Documents.svg",
            title: "Total Passenger App",
            emptyTitle: "No Passengers Found",
            label: "Passenger",
          )),

          // Unknown (static)
          const StorageInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Unknown",
            amountOfFiles: "0",
            numOfFiles: "0",
          ),
        ],
      ),
    );
  }
}


class ShimmerStorageCard extends StatelessWidget {
  const ShimmerStorageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade600,
            child: const SizedBox(height: 20, width: 20, child: ColoredBox(color: Colors.white)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade800,
                    highlightColor: Colors.grey.shade600,
                    child: const SizedBox(height: 10, width: 100, child: ColoredBox(color: Colors.white)),
                  ),
                  const SizedBox(height: 5),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade800,
                    highlightColor: Colors.grey.shade600,
                    child: const SizedBox(height: 8, width: 50, child: ColoredBox(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade600,
            child: const SizedBox(height: 10, width: 30, child: ColoredBox(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

