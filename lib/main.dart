import 'package:clype/routes/routes.dart';
import 'package:clype/splash/splash_screen.dart';
import 'package:clype/utils/dynamic_link.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  }
  DynamiclinkProvider().intializeDynamicLink();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) {
      runApp(
        const MyApp(),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: MaterialColor(0xFF10225e, AppColors.primarySwatch),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
      ),
      home: const SplashScreen(),
      getPages: RoutesClass.routes,
    );
  }
}
