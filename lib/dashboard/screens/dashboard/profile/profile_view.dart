import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';
import 'package:ride_share/dashboard/rs_responsive.dart';
import 'package:ride_share/dashboard/screens/dashboard/profile/profile_view_controller.dart';
import 'package:ride_share/widgets/custom_text_form_field.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../../../widgets/custom_square_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    debugPrint('Screen size is ${size.width} x ${size.height}');
    final mediaQuery = MediaQuery.of(context).size;
    final headerHeight = mediaQuery.height * 0.25;
    final circleSize = 100.0;
    final PageController controller = PageController();
    int selectedIndex = 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: buildProfileContent(headerHeight, context, selectedIndex,
              controller, mediaQuery, circleSize),
        ),
      ),
    );
  }

  Widget buildProfileContent(
      double headerHeight,
      BuildContext context,
      int selectedIndex,
      PageController controller,
      Size mediaQuery,
      double circleSize) {
    return Column(
      crossAxisAlignment:
          RsResponsive.isDesktop(context) || RsResponsive.isTablet(context)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
      children: [
        if (RsResponsive.isDesktop(context) || RsResponsive.isTablet(context))
          StickyHeader(
            header: RsResponsive.isDesktop(context) ||
                    RsResponsive.isTablet(context)
                ? Container(
                    width: mediaQuery.width,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: RsResponsive.isTablet(context) ? 7 : 8,
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Back button
                                CustomSquareButton.squareButton(
                                  onTap: () => Get.back(),
                                  borderRadius: BorderRadius.circular(10),
                                  margin: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    width: 1.5,
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/images/back.svg",
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                SizedBox(width: 10),
                                // Search box
                                Container(
                                  width: mediaQuery.width * 0.25,
                                  height: 50,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: CustomTextFormField(
                                    fillColor: RsColor.primaryFirst,
                                    suffixIcon: Icons.search,
                                    hintText: "Search...",
                                  ),
                                ),
                                Spacer(),
                                // Expanded Sticky Header
                                if (RsResponsive.isDesktop(context))
                                  Expanded(
                                    flex: 4,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: buildStickyHeaderBar(
                                        context,
                                        selectedIndex,
                                        controller,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: RsResponsive.isTablet(context) ? 5 : 4,
                          child: RsResponsive.isTablet(context)
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: buildStickyHeaderBar(
                                    context,
                                    selectedIndex,
                                    controller,
                                  ),
                                )
                              : SizedBox(), // or remove if not needed on mobile
                        ),
                      ],
                    ),
                  )
                : Text(""),
            content: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Side - 70%
                  Expanded(
                    flex: RsResponsive.isTablet(context) ? 7 : 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: RsResponsive.isMobile(context)
                              ? mediaQuery.width
                              : RsResponsive.isTablet(context)
                                  ? mediaQuery.width
                                  : mediaQuery.width * 0.7,
                          padding: RsResponsive.isMobile(context) ||
                                  RsResponsive.isTablet(context)
                              ? EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12)
                              : EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                          child: userMainData(
                            headerHeight,
                            context,
                            selectedIndex,
                            controller,
                            mediaQuery,
                            circleSize,
                          ),
                        ),
                        SizedBox(height: 10),
                        if (RsResponsive.isDesktop(context) ||
                            RsResponsive.isTablet(context))
                          AnalyticsCard()
                      ],
                    ),
                  ),

                  SizedBox(width: 20),

                  // Right Side - 30%
                  if (RsResponsive.isDesktop(context) ||
                      RsResponsive.isTablet(context))
                    Expanded(
                      flex: RsResponsive.isTablet(context) ? 5 : 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildStickyContentSection(
                              context, mediaQuery, controller, selectedIndex)
                          // // First Container
                          // stickyNavBar(
                          //   context,
                          //   selectedIndex,
                          //   controller,
                          //   mediaQuery,
                          // ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        if (RsResponsive.isMobile(context))
          userMainData(
            headerHeight,
            context,
            selectedIndex,
            controller,
            mediaQuery,
            circleSize,
          ),
        if (RsResponsive.isMobile(context))
          StickyHeader(
            header: buildStickyHeaderBar(context, selectedIndex, controller,
                bgColor: Colors.transparent),
            content: buildStickyContentSection(
                context, mediaQuery, controller, selectedIndex),
          ),
        if (RsResponsive.isMobile(context))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: AnalyticsCard(),
          )
      ],
    );
  }

  Widget userMainData(
      double headerHeight,
      BuildContext context,
      int selectedIndex,
      PageController controller,
      Size mediaQuery,
      double circleSize) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: headerHeight),
          padding: RsResponsive.isMobile(context)
              ? EdgeInsets.symmetric(horizontal: 12)
              : EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(
                        top: 8,
                        bottom: 6,
                      ),
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.onPrimary,
                              width: 2)),
                      child: Center(
                        child: Text(
                          "Edit Status",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("@Muhammad Arslan",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              Text("marslanflutterdev1@gmail.com",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 10)),
              Text("3550106361973",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 10)),
              Text("923284123292",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 10)),
              SizedBox(height: 10),
              Text(
                  "Building a 1m/y software development agency ✨. Rising by lifting others.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              customDataRow(context,
                  icon: Icons.local_activity, text: "Approved"),
              customDataRow(context,
                  icon: Icons.location_on_rounded,
                  text: "Faisalabad University"),
              customDataRow(context,
                  icon: Icons.calendar_month,
                  text: " 9 May 2025 at 18:27:16 UTC+5"),
              SizedBox(height: 10),
              Text(
                  "I'm Muhammad Arslan. Play role of Driver. Let's innovate ❤️✨.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  customVehicleDataRow(context,
                      vehicle: "ALQ 7608", subText: "Vehicle No."),
                  SizedBox(
                    width: 6,
                  ),
                  customVehicleDataRow(context,
                      vehicle: "887766", subText: "Vehicle Chassis No."),
                ],
              ),

              // stickyNavBar(context, selectedIndex, controller, mediaQuery),
            ],
          ),
        ),
        Container(
          height: mediaQuery.height * 0.25,
          color: Colors.pink.withOpacity(0.5),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/register_bg.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
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
              if (RsResponsive.isMobile(context))
                Positioned(
                  top: 30, // before 40
                  left: 12,
                  child: CustomSquareButton.squareButton(
                    onTap: () {
                      Get.back();
                    },
                    padding: EdgeInsets.zero,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 1.5),
                    child: SvgPicture.asset(
                      "assets/images/back.svg",
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              if (RsResponsive.isMobile(context))
                Positioned(
                  top: 38, // before 48
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Text(
                    "Profile",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          top: headerHeight - (circleSize / 2),
          child: Container(
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
        ),
      ],
    );
  }

  Container buildStickyContentSection(BuildContext context, Size mediaQuery,
      PageController controller, int selectedIndex) {
    return Container(
      decoration: BoxDecoration(
        color: RsResponsive.isDesktop(context) || RsResponsive.isTablet(context)
            ? Theme.of(context).colorScheme.onPrimaryContainer
            : null,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: RsResponsive.isMobile(context) || RsResponsive.isTablet(context)
          ? EdgeInsets.only(left: 12, right: 12, bottom: 12)
          : EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
      child: Container(
        height: mediaQuery.height,
        color: Colors.transparent,
        // decoration: BoxDecoration(),
        child: Column(
          children: [
            Flexible(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  selectedIndex = index;
                  // setState(() {
                  //   selectedIndex = index;
                  // });
                },
                physics: NeverScrollableScrollPhysics(),
                children: [
                  MyHomePage(),
                  MyHomePage(),
                  MyHomePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStickyHeaderBar(
      BuildContext context, int selectedIndex, PageController controller,
      {Color? bgColor, double? gap}) {
    final ProfileViewController profileViewController =
        Get.put(ProfileViewController());

    return Obx(
      () => Container(
        padding: RsResponsive.isMobile(context)
            ? EdgeInsets.symmetric(horizontal: 12)
            : EdgeInsets.zero,
        margin: EdgeInsets.only(top: 0),
        height: 70,
        decoration: BoxDecoration(
            color: RsResponsive.isMobile(context)
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).colorScheme.onPrimaryContainer),
        child: GNav(
            // rippleColor: Colors.teal, // tab button ripple color when pressed
            // hoverColor: Colors.pink, // tab button hover color
            onTabChange: (index) {
              profileViewController.changeTab(index);
              controller.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
              // setState(() {
              //   selectedIndex = index;
              // controller.animateToPage(
              //   index,
              //   duration: Duration(milliseconds: 500),
              //   curve: Curves.ease,
              // );
              // });
            },
            selectedIndex: profileViewController.selectedIndex.value,
            haptic: true, // haptic feedback
            tabMargin: EdgeInsets.symmetric(vertical: 20),
            tabBorderRadius: 10,
            // tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
            // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
            // tabBorder: Border.all(width: 0),
            // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 900), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Theme.of(context)
                .colorScheme
                .onPrimary, // unselected icon color
            activeColor: Theme.of(context)
                .colorScheme
                .primary, // selected icon and text color
            iconSize: 24, // tab button icon size
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: RsColor.primaryFirst, fontWeight: FontWeight.bold),
            tabBackgroundColor:
                Colors.transparent, // selected tab background color
            padding: EdgeInsets.symmetric(
                horizontal: 0, vertical: 0), // navigation bar padding
            tabs: [
              GButton(
                icon: Icons.post_add_sharp,
                text: 'Post',
                haptic: true,
                backgroundColor: Colors.transparent,
              ),
              GButton(
                icon: Icons.book,
                text: 'Booking',
                haptic: true,
                backgroundColor: Colors.transparent,
              ),
              GButton(
                icon: Icons.search_outlined,
                text: 'Search',
                haptic: true,
                backgroundColor: Colors.transparent,
              ),
            ]),
      ),
    );
  }

  Row customVehicleDataRow(BuildContext context,
      {String vehicle = "ALQ 7608", String subText = "Vehicle No."}) {
    return Row(
      children: [
        Text(vehicle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        SizedBox(width: 2),
        Text(subText,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10)),
      ],
    );
  }

  Row customDataRow(BuildContext context,
      {IconData icon = Icons.local_activity, String text = "7608"}) {
    return Row(
      children: [
        Icon(icon,
            size: 15,
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4)),
        const SizedBox(width: 8),
        Text(text,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10))
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final List<String> sampleImages = const [
    'https://media.istockphoto.com/id/2201384385/photo/construction-worker-spraying-house-insulation.webp?a=1&b=1&s=612x612&w=0&k=20&c=TOgE_Cm-pW9fE8RcOw3TfZazedhSh2RwTmirr25izek=',
    'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://media.istockphoto.com/id/2201384385/photo/construction-worker-spraying-house-insulation.webp?a=1&b=1&s=612x612&w=0&k=20&c=TOgE_Cm-pW9fE8RcOw3TfZazedhSh2RwTmirr25izek=',
    'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://media.istockphoto.com/id/2201384385/photo/construction-worker-spraying-house-insulation.webp?a=1&b=1&s=612x612&w=0&k=20&c=TOgE_Cm-pW9fE8RcOw3TfZazedhSh2RwTmirr25izek=',
    'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://media.istockphoto.com/id/2201384385/photo/construction-worker-spraying-house-insulation.webp?a=1&b=1&s=612x612&w=0&k=20&c=TOgE_Cm-pW9fE8RcOw3TfZazedhSh2RwTmirr25izek=',
    'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1587620962725-abab7fe55159?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1584949091598-c31daaaa4aa9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1566837945700-30057527ade0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1685086785636-2a1a0e5b591f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGRldmVsb3BlcnxlbnwwfHwwfHx8MA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          RsResponsive.isDesktop(context) || RsResponsive.isTablet(context)
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Colors.transparent,
      appBar: RsResponsive.isDesktop(context) || RsResponsive.isTablet(context)
          ? AppBar(
              title: Text(
                "Profile",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              automaticallyImplyLeading: false,
              centerTitle: true,
            )
          : null,
      body: QuiltedImageGrid(imageUrls: sampleImages),
    );
  }
}

class QuiltedImageGrid extends StatelessWidget {
  final List<String> imageUrls;

  const QuiltedImageGrid({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      padding: EdgeInsets.zero,
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: RsResponsive.isTablet(context) ? 2 : 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: const [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final random = Random();
          final imageUrl = imageUrls[random.nextInt(imageUrls.length)];
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Tile(imageUrl: imageUrl),
          );
        },
        childCount: imageUrls.length,
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String imageUrl;

  const Tile({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
// analytics

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Analytics",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.visibility_sharp,
                  size: 28,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                SizedBox(width: 8),
                Text("Private to you",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: RsResponsive.isDesktop(context)
                ? mediaQuery.height * 0.2
                : null,
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: RsResponsive.isDesktop(context)
                  ? Axis.horizontal
                  : Axis.vertical,
              children: buildAnalyticalItems(context),
            ),
          ),
          /* GridView.count(
            crossAxisCount: RsResponsive.isMobile(context) ? 1 : (RsResponsive.isTablet(context) ? 2 : 3),
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 6,
            childAspectRatio: RsResponsive.isDesktop(context)
                ? 16 / 9  // Widescreen format for desktop
                : RsResponsive.isTablet(context)
                ? (MediaQuery.of(context).orientation == Orientation.portrait ? 3 / 2 : 4 / 3)
                : (MediaQuery.of(context).orientation == Orientation.portrait ? 4 / 5 : 9 / 16),
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildAnalyticsItem(
                context: context,
                icon: Icons.bar_chart,
                title: "881 post impressions",
                subtitle: "Check out who's engaging with your posts.",
                otherText: "Past 7 days",
              ),
              _buildAnalyticsItem(
                context: context,
                icon: Icons.person_3,
                title: "28 profile views",
                subtitle: "Discover who's viewed your profile.",
              ),
              _buildAnalyticsItem(
                context: context,
                icon: Icons.search,
                title: "4 search appearances",
                subtitle: "See how often you appear in search results.",
              ),
            ],
          ),*/
          Divider(color: Colors.grey[300]),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText(
                "Show all analytics",
                style: Theme.of(context).textTheme.bodyLarge,
                gradientType: GradientType.linear,
                radius: 2.5,
                colors: [RsColor.primaryFirst, RsColor.primarySecond],
              ),
              ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        RsColor.primaryFirst,
                        RsColor.primarySecond.withOpacity(0.6)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  child: Icon(
                    Icons.navigate_next_sharp,
                  )),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildAnalyticsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required BuildContext context,
    String? otherText,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: RsResponsive.isDesktop(context) ? 20 : 12,
            vertical: RsResponsive.isDesktop(context) ? 0 : 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 28,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 12)),
                  SizedBox(height: 4),
                  Text(otherText.toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10, fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildAnalyticalItems(BuildContext context) {
    return [
      _buildAnalyticsItem(
        context: context,
        icon: Icons.bar_chart,
        title: "881 post impressions",
        subtitle: "Check out who's engaging with your posts.",
        otherText: "Past 7 days",
      ),
      _buildAnalyticsItem(
        context: context,
        icon: Icons.person_3,
        title: "28 profile views",
        subtitle: "Discover who's viewed your profile.",
      ),
      _buildAnalyticsItem(
        context: context,
        icon: Icons.search,
        title: "4 search appearances",
        subtitle: "See how often you appear in search results.",
      ),
    ];
  }
}
