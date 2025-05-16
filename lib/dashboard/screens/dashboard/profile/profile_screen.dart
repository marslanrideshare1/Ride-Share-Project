import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_square_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context).size;
    // Sizes
    final headerHeight = mediaQuery.height * 0.25;
    final circleSize = 100.0;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child : Column(
          children: [
            Container(
              width: double.infinity,
              height: headerHeight,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  // Background image
                  Image.asset(
                    "assets/images/register_bg.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          const Color(0xff1EFBFA).withOpacity(0.6),
                          const Color(0xff16978A).withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                  // Back button
                  CustomSquareButton.squareButton(
                    onTap: () {
                      Get.back();
                    },
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                      width: 1.5,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/back.svg",
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  // Centered "Profile" text
                  Center(
                    child: Text(
                      "Profile",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(circleSize / 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: headerHeight,),
              // color: Colors.pink[50],
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(height: 52),
                    Text("@Muhammad Arslan", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
                    Text("marslanflutterdev1@gmail.com", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
                    Text("3550106361973", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
                    Text("923284123292", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
                    SizedBox(height: 10),
                    Text("Building a 1m/y software development agency ✨. Rising by lifting others", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
                    customDataRow(context, icon: Icons.local_activity, text: "Approved"),
                    customDataRow(context, icon: Icons.location_on_rounded, text: "Faisalabad University"),
                    customDataRow(context, icon: Icons.calendar_month, text: " 9 May 2025 at 18:27:16 UTC+5"),
                    SizedBox(height: 10),
                    Text("I'm Muhammad Arslan. Play role of Driver. Let's innovate ❤️✨.", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        customVehicleDataRow(context, vehicle: "ALQ 7608", subText: "Vehicle No."),
                        SizedBox(width: 6,),
                        customVehicleDataRow(context, vehicle: "887766", subText: "Vehicle Chassis No."),
                      ],
                    ),
                    SizedBox(height: 50),
                    TabBarExampleScreen(),

                  ],
                ),
              ),
            ),
          ],
        )

      ),
    );
  }

  Row customVehicleDataRow(BuildContext context, {String vehicle = "ALQ 7608", String subText = "Vehicle No."}) {
    return Row(
      children: [
        Text(vehicle, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(width: 2),
        Text(subText, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
      ],
    );
  }

  Row customDataRow(BuildContext context, {IconData icon = Icons.local_activity, String text = "7608"}) {
    return Row(
      children: [
        Icon(icon, size: 15, color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4)),
        const SizedBox(width: 8),
        Text(text,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10))
      ],
    );
  }
}

class TabBarExampleScreen extends StatelessWidget {
  const TabBarExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab( icon: Icon(Icons.home)),
              Tab( icon: Icon(Icons.person)),
              Tab( icon: Icon(Icons.settings)),
            ],
          ),
          // SizedBox(height: 300,),
          Expanded(
            child: TabBarView(
              children: [
                Column(
                  children: [
                    Text('This is Tab 1'),
                    SizedBox(height: 800,),
                    Text('This is Tab 1'),
                  ],
                ),
                Center(child: Text('This is Tab 2')),
                Center(child: Text('This is Tab 3')),
              ],
            ),
          )
        ],
      ),// Number of tabs
    );
  }
}
