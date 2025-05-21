// Scaffold(
// extendBodyBehindAppBar: true,
// body: RsResponsive.isDesktop(context) || RsResponsive.isTablet(context) ?  Row(
// children: [
// Expanded(
// flex: 7,
// child: Container(
// color: Colors.pink[100],
// child:  Stack(
// children: [
// Image.asset(
// "assets/images/register_bg.png",
// fit: BoxFit.cover,
// width: double.infinity,
// height: double.infinity,
// ),
// Container(
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.bottomLeft,
// end: Alignment.topRight,
// colors: [
// const Color(0xff1EFBFA).withOpacity(0.6),
// const Color(0xff16978A).withOpacity(0.3),
// ],
// ),
// ),
// ),
// Positioned(
// left: 0,
// right: 0,
// top: 60,
// child: Padding(
// padding: const EdgeInsets.all(20.0),
// child: Column(
// children: [
// TypewriteText(
// linesOfText: ['Welcome to Ride Share Register'],
// textStyle: Theme.of(context)
//     .textTheme
//     .headlineLarge!
//     .copyWith(fontWeight: FontWeight.bold),
// textAlign: TextAlign.center,
// tryToVibrate: VibrationType.medium,
// cursorSymbol: "|",
// cursorColor: Theme.of(context).colorScheme.onPrimary,
// cursorBlinkingDuration: Duration(seconds: 1),
// // Timing Configuration
// beforeAnimationDuration: Duration.zero,// No delay before typing
// forwardAnimationDuration: Duration(milliseconds: 300),
// afterAnimationDuration: const Duration(seconds: 2), // Wait before reversing
// reverseAnimationDuration: const Duration(milliseconds: 300), // 👈 This enables deletion
// ),
// Container(
// width: MediaQuery.of(context).size.width * 0.2,
// height: MediaQuery.of(context).size.height * 0.2,
// decoration: BoxDecoration(
// // color: Colors.white,
// borderRadius: BorderRadius.circular(20),
// ),
// child: Center(
// child: Image.asset(
// "assets/images/taxi_logo.png",
// fit: BoxFit.contain,
// ),
// ),
// ),
// Text('The Ride Share Flutter App is a smart, secure transport solution connecting passengers, drivers, and admins. Passengers book real-time rides, track vehicles live, and chat with drivers. Verified drivers post rides, manage bookings, and share locations. Admins control user roles, ride activity, and system security. The app also handles **vehicle registration, ride history, and smart fare processing—offering a complete, tech-driven ride-sharing ecosystem', textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge,)
// ],
// ),
// ),
// )
// ],
// ),
// ),
// ),
// Expanded(
// flex: 5,
// child: Container(
// margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
// decoration: BoxDecoration(
//
// color: Theme.of(context).colorScheme.onPrimaryContainer,
// ),
// child: buildCustomScrollView(context),
// ))
// ],
// ) : Padding(
// padding: const EdgeInsets.symmetric(vertical: 10),
// child: buildCustomScrollView(context),
// ),
// );