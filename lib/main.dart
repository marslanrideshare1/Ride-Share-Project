import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';
import 'package:ride_share/dashboard/screens/dashboard/profile/profile_view.dart';
import 'package:ride_share/dummy.dart';
import 'package:ride_share/ride_share/auth/dev_sign_up/dev_sign_up_view.dart';
import 'package:ride_share/ride_share/auth/sign_in/components/forget_password_view.dart';
import 'package:ride_share/ride_share/auth/sign_in/sign_in_view.dart';
import 'package:ride_share/ride_share/auth/sign_up/sign_up_view.dart';
import 'package:ride_share/ride_share/wrapper/on_board/on_board_view.dart';
import 'package:ride_share/ride_share/wrapper/splash/splash_view.dart';
import 'package:ride_share/widgets/custom_social_button.dart';
import 'core/theme/rs_theme.dart';
import 'firebase_options.dart';
import 'local/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // BuildContext context;
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: RsColor.primaryFirst,
  //   statusBarIconBrightness: Theme.of(context).brightness,
  //   statusBarBrightness: Brightness.light,
  // ));

  runApp(
    //   DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: RsColor.primaryFirst,
      ),
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ride Share',
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      themeMode: ThemeMode.system,
      theme: RsTheme.rideShareLightTheme,
      darkTheme: RsTheme.rideShareDarkTheme,
      home: SplashView(),
    );
  }
}
