
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_share/dashboard/controllers/recent_file_controller.dart';
import 'package:ride_share/dashboard/screens/dashboard/profile/profile_screen.dart';
import 'package:ride_share/dashboard/screens/dashboard/profile/profile_view.dart';
import 'package:ride_share/ride_share/auth/user/user_model.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constants.dart';
import 'package:get/get.dart';


class RecentFiles extends StatefulWidget {
  const RecentFiles({
    super.key,
  });

  @override
  State<RecentFiles> createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  final RecentFileController recentFileController = Get.put(RecentFileController());

  @override
  void initState() {
    super.initState();
    fetchRecentFileData();
  }
  Future<void> fetchRecentFileData()async{
    await recentFileController.fetchRecentFileMethod();
  }
  @override
  Widget build(BuildContext context){
  return Container(
    padding: EdgeInsets.all(defaultPadding),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent User",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          width: double.infinity,
          child: Obx(
              ()  {
                if(recentFileController.isLoading){
                  return RecentUserShimmer();
                }
                if(recentFileController.totalUsers.isEmpty){
                  return Text(" nothing", style: TextStyle(color: Colors.white),);
                }
              return DataTable(
                columnSpacing: defaultPadding,
                dividerThickness: 1,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("User Name",style: Theme.of(context).textTheme.bodyLarge)
                  ),
                  DataColumn(
                    label: Text("Role",style: Theme.of(context).textTheme.bodyLarge)
                  ),
                  DataColumn(
                    label: Text("Status",style: Theme.of(context).textTheme.bodyLarge)
                  ),
                ],
                rows: List.generate(
                  recentFileController.totalUsers.length,
                      (index) => DataRow(
                        onLongPress: (){
                          Get.to(ProfileView());
                        },
                        cells: [
                          DataCell(
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: Colors.transparent,
                                    ),

                                    child: recentFileController.totalUsers[index].userImg.isNotEmpty ?SvgPicture.asset(
                                      recentFileController.totalUsers[index].userImg,
                                      fit: BoxFit.cover,

                                    ):Image.asset(
                                      'assets/images/subhan.png',
                                      fit: BoxFit.cover,

                                    ),
                                  ) ,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                    child: Text(recentFileController.totalUsers[index].username,overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10),),
                                  ),
                                ],
                              )
                          ),
                          DataCell(Text(recentFileController.totalUsers[index].role.name.toString(),overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10))),
                          DataCell(Text(recentFileController.totalUsers[index].requestStatus.name.toString(),overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10))),
                        ],
                      ),
                ),
              );
            }
          ),
        ),
      ],
    ),
  );
  }

}



class RecentUserShimmer extends StatelessWidget {
   RecentUserShimmer({super.key});

  final RecentFileController recentFileController = Get.put(RecentFileController());
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,

      child: DataTable(
        columnSpacing: defaultPadding,
        columns: const [
          DataColumn(label: Text("User Name")),
          DataColumn(label: Text("Role")),
          DataColumn(label: Text("Status")),
        ],
        rows: List.generate(
          recentFileController.totalUsers.isNotEmpty ?  recentFileController.totalUsers.length : 4,
              (index) => const DataRow(
            cells: [
              DataCell(
                Row(
                  children: [
                    CircleAvatar(radius: 10, backgroundColor: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 10,
                        child: ColoredBox(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              DataCell(
                SizedBox(height: 10, width: 50, child: ColoredBox(color: Colors.white)),
              ),
              DataCell(
                SizedBox(height: 10, width: 50, child: ColoredBox(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
