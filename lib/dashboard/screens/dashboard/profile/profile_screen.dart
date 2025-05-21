// // import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:get/get.dart';
// // import '../../../../widgets/custom_square_button.dart';
// //
// // class ProfileScreen extends StatefulWidget {
// //   const ProfileScreen({super.key});
// //
// //   @override
// //   State<ProfileScreen> createState() => _ProfileScreenState();
// // }
// //
// // class _ProfileScreenState extends State<ProfileScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     final mediaQuery = MediaQuery.of(context).size;
// //     // Sizes
// //     final headerHeight = mediaQuery.height * 0.25;
// //     final circleSize = 100.0;
// //
// //     return Scaffold(
// //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
// //       extendBodyBehindAppBar: true,
// //       resizeToAvoidBottomInset: true,
// //       body: SingleChildScrollView(
// //         child : Column(
// //           children: [
// //             Container(
// //               width: double.infinity,
// //               height: headerHeight,
// //               decoration: const BoxDecoration(),
// //               child: Stack(
// //                 children: [
// //                   // Background image
// //                   Image.asset(
// //                     "assets/images/register_bg.png",
// //                     fit: BoxFit.cover,
// //                     width: double.infinity,
// //                     height: double.infinity,
// //                   ),
// //                   // Gradient overlay
// //                   Container(
// //                     decoration: BoxDecoration(
// //                       gradient: LinearGradient(
// //                         begin: Alignment.bottomLeft,
// //                         end: Alignment.topRight,
// //                         colors: [
// //                           const Color(0xff1EFBFA).withOpacity(0.6),
// //                           const Color(0xff16978A).withOpacity(0.3),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                   // Back button
// //                   CustomSquareButton.squareButton(
// //                     onTap: () {
// //                       Get.back();
// //                     },
// //                     border: Border.all(
// //                       color: Theme.of(context).colorScheme.onPrimary,
// //                       width: 1.5,
// //                     ),
// //                     child: SvgPicture.asset(
// //                       "assets/images/back.svg",
// //                       color: Theme.of(context).colorScheme.onPrimary,
// //                     ),
// //                   ),
// //                   // Centered "Profile" text
// //                   Center(
// //                     child: Text(
// //                       "Profile",
// //                       style: Theme.of(context).textTheme.headlineSmall?.copyWith(
// //                         color: Theme.of(context).colorScheme.onPrimary,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Container(
// //               width: circleSize,
// //               height: circleSize,
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(circleSize / 2),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black12,
// //                     blurRadius: 6,
// //                     offset: Offset(0, 3),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Container(
// //               margin: EdgeInsets.only(top: headerHeight,),
// //               // color: Colors.pink[50],
// //               child: Padding(
// //                 padding:  EdgeInsets.symmetric(horizontal: 12),
// //
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //
// //                   children: [
// //                     SizedBox(height: 52),
// //                     Text("@Muhammad Arslan", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
// //                     Text("marslanflutterdev1@gmail.com", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
// //                     Text("3550106361973", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
// //                     Text("923284123292", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
// //                     SizedBox(height: 10),
// //                     Text("Building a 1m/y software development agency ✨. Rising by lifting others", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
// //                     customDataRow(context, icon: Icons.local_activity, text: "Approved"),
// //                     customDataRow(context, icon: Icons.location_on_rounded, text: "Faisalabad University"),
// //                     customDataRow(context, icon: Icons.calendar_month, text: " 9 May 2025 at 18:27:16 UTC+5"),
// //                     SizedBox(height: 10),
// //                     Text("I'm Muhammad Arslan. Play role of Driver. Let's innovate ❤️✨.", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
// //                     Row(
// //                       children: [
// //                         customVehicleDataRow(context, vehicle: "ALQ 7608", subText: "Vehicle No."),
// //                         SizedBox(width: 6,),
// //                         customVehicleDataRow(context, vehicle: "887766", subText: "Vehicle Chassis No."),
// //                       ],
// //                     ),
// //                     SizedBox(height: 50),
// //                     TabBarExampleScreen(),
// //
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         )
// //
// //       ),
// //     );
// //   }
// //
// //   Row customVehicleDataRow(BuildContext context, {String vehicle = "ALQ 7608", String subText = "Vehicle No."}) {
// //     return Row(
// //       children: [
// //         Text(vehicle, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
// //         SizedBox(width: 2),
// //         Text(subText, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
// //       ],
// //     );
// //   }
// //
// //   Row customDataRow(BuildContext context, {IconData icon = Icons.local_activity, String text = "7608"}) {
// //     return Row(
// //       children: [
// //         Icon(icon, size: 15, color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4)),
// //         const SizedBox(width: 8),
// //         Text(text,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10))
// //       ],
// //     );
// //   }
// // }
// //
// // class TabBarExampleScreen extends StatelessWidget {
// //   const TabBarExampleScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 3,
// //       child: Column(
// //         children: [
// //           TabBar(
// //             tabs: [
// //               Tab( icon: Icon(Icons.home)),
// //               Tab( icon: Icon(Icons.person)),
// //               Tab( icon: Icon(Icons.settings)),
// //             ],
// //           ),
// //           // SizedBox(height: 300,),
// //           Expanded(
// //             child: TabBarView(
// //               children: [
// //                 Column(
// //                   children: [
// //                     Text('This is Tab 1'),
// //                     SizedBox(height: 800,),
// //                     Text('This is Tab 1'),
// //                   ],
// //                 ),
// //                 Center(child: Text('This is Tab 2')),
// //                 Center(child: Text('This is Tab 3')),
// //               ],
// //             ),
// //           )
// //         ],
// //       ),// Number of tabs
// //     );
// //   }
// // }
// //
// // profile_view.dart code
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:ride_share/core/theme/components/rs_color.dart';
// import 'package:ride_share/ride_share/auth/sign_in/sign_in_view.dart';
// import 'package:ride_share/ride_share/wrapper/on_board/on_board_view.dart';
// import 'package:sticky_headers/sticky_headers.dart';
// import '../../../../widgets/custom_square_button.dart';
//
// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});
//
//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }
//
// class _ProfileViewState extends State<ProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context).size;
//     final headerHeight = mediaQuery.height * 0.25;
//     final circleSize = 100.0;
//     final PageController controller = PageController();
//     int selectedIndex =
//     0; // Make this a reactive state variable if using StatefulWidget or GetX/Provider/etc.
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         resizeToAvoidBottomInset: true,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(top: headerHeight),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 50,
//                             child: Row(
//                               children: [
//                                 Spacer(),
//                                 Container(
//                                   margin: EdgeInsets.only(
//                                     top: 8,
//                                     bottom: 6,
//                                   ),
//                                   width: 100,
//                                   height: 70,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(50),
//                                       border: Border.all(
//                                           color: Theme.of(context)
//                                               .colorScheme
//                                               .onPrimary,
//                                           width: 2)),
//                                   child: Center(
//                                     child: Text(
//                                       "Edit Status",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyMedium!
//                                           .copyWith(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text("@Muhammad Arslan",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyMedium!
//                                   .copyWith(fontWeight: FontWeight.bold)),
//                           Text("marslanflutterdev1@gmail.com",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall!
//                                   .copyWith(fontSize: 10)),
//                           Text("3550106361973",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall!
//                                   .copyWith(fontSize: 10)),
//                           Text("923284123292",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall!
//                                   .copyWith(fontSize: 10)),
//                           SizedBox(height: 10),
//                           Text(
//                               "Building a 1m/y software development agency ✨. Rising by lifting others.",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyMedium!
//                                   .copyWith(fontWeight: FontWeight.bold)),
//                           customDataRow(context,
//                               icon: Icons.local_activity, text: "Approved"),
//                           customDataRow(context,
//                               icon: Icons.location_on_rounded,
//                               text: "Faisalabad University"),
//                           customDataRow(context,
//                               icon: Icons.calendar_month,
//                               text: " 9 May 2025 at 18:27:16 UTC+5"),
//                           SizedBox(height: 10),
//                           Text(
//                               "I'm Muhammad Arslan. Play role of Driver. Let's innovate ❤️✨.",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyMedium!
//                                   .copyWith(fontWeight: FontWeight.bold)),
//                           Row(
//                             children: [
//                               customVehicleDataRow(context,
//                                   vehicle: "ALQ 7608", subText: "Vehicle No."),
//                               SizedBox(
//                                 width: 6,
//                               ),
//                               customVehicleDataRow(context,
//                                   vehicle: "887766",
//                                   subText: "Vehicle Chassis No."),
//                             ],
//                           ),
//                           Container(
//                             height: 5,
//                             color: Theme.of(context).scaffoldBackgroundColor,
//                           ),
//                           StickyHeader(
//                             header: Container(
//                               padding: EdgeInsets.only(top: 0),
//                               margin: EdgeInsets.only(top: 0),
//                               height: 70,
//                               decoration: BoxDecoration(
//                                   color: Theme.of(context)
//                                       .scaffoldBackgroundColor),
//                               child: GNav(
//                                 // rippleColor: Colors.teal, // tab button ripple color when pressed
//                                 // hoverColor: Colors.pink, // tab button hover color
//                                   onTabChange: (index) {
//                                     setState(() {
//                                       selectedIndex = index;
//                                       controller.animateToPage(
//                                         index,
//                                         duration: Duration(milliseconds: 500),
//                                         curve: Curves.ease,
//                                       );
//                                     });
//                                   },
//                                   selectedIndex: selectedIndex,
//                                   haptic: true, // haptic feedback
//                                   tabMargin: EdgeInsets.symmetric(vertical: 20),
//                                   tabBorderRadius: 10,
//                                   // tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
//                                   // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
//                                   // tabBorder: Border.all(width: 0),
//                                   // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
//                                   curve: Curves
//                                       .easeOutExpo, // tab animation curves
//                                   duration: Duration(
//                                       milliseconds:
//                                       900), // tab animation duration
//                                   gap:
//                                   8, // the tab button gap between icon and text
//                                   color: Theme.of(context)
//                                       .colorScheme
//                                       .onPrimary, // unselected icon color
//                                   activeColor: Theme.of(context)
//                                       .colorScheme
//                                       .primary, // selected icon and text color
//                                   iconSize: 24, // tab button icon size
//                                   textStyle: Theme.of(context)
//                                       .textTheme
//                                       .bodyMedium!
//                                       .copyWith(
//                                       color: RsColor.primaryFirst,
//                                       fontWeight: FontWeight.bold),
//                                   // tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 0,
//                                       vertical: 0), // navigation bar padding
//                                   tabs: [
//                                     GButton(
//                                       icon: Icons.post_add_sharp,
//                                       text: 'Post',
//                                     ),
//                                     GButton(
//                                       icon: Icons.book,
//                                       text: 'Booking',
//                                     ),
//                                     GButton(
//                                       icon: Icons.search_outlined,
//                                       text: 'Search',
//                                     ),
//                                   ]),
//                             ),
//
//                             content: Container(
//                               height: mediaQuery.height,
//                               decoration: BoxDecoration(),
//                               child: Column(
//                                 children: [
//                                   Flexible(
//                                     child: PageView(
//                                       controller: controller,
//                                       onPageChanged: (index) {
//                                         setState(() {
//                                           selectedIndex = index;
//                                         });
//                                       },
//                                       physics: AlwaysScrollableScrollPhysics(),
//                                       children: [
//                                         MyHomePage(),
//                                         MyHomePage(),
//                                         MyHomePage(),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: mediaQuery.height * 0.25,
//                     color: Colors.pink.withOpacity(0.5),
//                     child: Stack(
//                       children: [
//                         Image.asset(
//                           "assets/images/register_bg.png",
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                           height: double.infinity,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               begin: Alignment.bottomLeft,
//                               end: Alignment.topRight,
//                               colors: [
//                                 const Color(0xff1EFBFA).withOpacity(0.6),
//                                 const Color(0xff16978A).withOpacity(0.3),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 30, // before 40
//                           left: 12,
//                           child: CustomSquareButton.squareButton(
//                             onTap: () {
//                               Get.back();
//                             },
//                             padding: EdgeInsets.zero,
//                             border: Border.all(
//                                 color: Theme.of(context).colorScheme.onPrimary,
//                                 width: 1.5),
//                             child: SvgPicture.asset(
//                               "assets/images/back.svg",
//                               color: Theme.of(context).colorScheme.onPrimary,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 38, // before 48
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: Text(
//                             "Profile",
//                             textAlign: TextAlign.center,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall
//                                 ?.copyWith(
//                               color:
//                               Theme.of(context).colorScheme.onPrimary,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     left: 16,
//                     top: headerHeight - (circleSize / 2),
//                     child: Container(
//                       width: circleSize,
//                       height: circleSize,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(circleSize / 2),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 6,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Row customVehicleDataRow(BuildContext context,
//       {String vehicle = "ALQ 7608", String subText = "Vehicle No."}) {
//     return Row(
//       children: [
//         Text(vehicle,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyMedium!
//                 .copyWith(fontWeight: FontWeight.bold)),
//         SizedBox(width: 2),
//         Text(subText,
//             style:
//             Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
//       ],
//     );
//   }
//
//   Row customDataRow(BuildContext context,
//       {IconData icon = Icons.local_activity, String text = "7608"}) {
//     return Row(
//       children: [
//         Icon(icon,
//             size: 15,
//             color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4)),
//         const SizedBox(width: 8),
//         Text(text,
//             style:
//             Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10))
//       ],
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   final List<String> sampleImages = const [
//     'https://media.istockphoto.com/id/2201384385/photo/construction-worker-spraying-house-insulation.webp?a=1&b=1&s=612x612&w=0&k=20&c=TOgE_Cm-pW9fE8RcOw3TfZazedhSh2RwTmirr25izek=',
//     'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
//     'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
//     'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://media.istockphoto.com/id/2201384385/photo/construction-worker-spraying-house-insulation.webp?a=1&b=1&s=612x612&w=0&k=20&c=TOgE_Cm-pW9fE8RcOw3TfZazedhSh2RwTmirr25izek=',
//     'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
//     'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
//     'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://media.istockphoto.com/id/2201384385/photo/construction-worker-spraying-house-insulation.webp?a=1&b=1&s=612x612&w=0&k=20&c=TOgE_Cm-pW9fE8RcOw3TfZazedhSh2RwTmirr25izek=',
//     'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
//     'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
//     'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://media.istockphoto.com/id/2201384385/photo/construction-worker-spraying-house-insulation.webp?a=1&b=1&s=612x612&w=0&k=20&c=TOgE_Cm-pW9fE8RcOw3TfZazedhSh2RwTmirr25izek=',
//     'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
//     'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
//     'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//     'https://plus.unsplash.com/premium_photo-1685086785636-2a1a0e5b591f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: QuiltedImageGrid(imageUrls: sampleImages),
//     );
//   }
// }
//
// class QuiltedImageGrid extends StatelessWidget {
//   final List<String> imageUrls;
//
//   const QuiltedImageGrid({super.key, required this.imageUrls});
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.custom(
//       padding: const EdgeInsets.all(8),
//       gridDelegate: SliverQuiltedGridDelegate(
//         crossAxisCount: 4,
//         mainAxisSpacing: 4,
//         crossAxisSpacing: 4,
//         repeatPattern: QuiltedGridRepeatPattern.inverted,
//         pattern: const [
//           QuiltedGridTile(2, 2),
//           QuiltedGridTile(1, 1),
//           QuiltedGridTile(1, 1),
//           QuiltedGridTile(1, 2),
//         ],
//       ),
//       childrenDelegate: SliverChildBuilderDelegate(
//             (context, index) {
//           final random = Random();
//           final imageUrl = imageUrls[random.nextInt(imageUrls.length)];
//           return Tile(imageUrl: imageUrl);
//         },
//         childCount: imageUrls.length,
//       ),
//     );
//   }
// }
//
// class Tile extends StatelessWidget {
//   final String imageUrl;
//
//   const Tile({super.key, required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: Image.network(
//         imageUrl,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }
