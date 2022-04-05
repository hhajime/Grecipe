import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:mofu_flutter/src/ui/view/home_view/home_page.dart';
import 'package:mofu_flutter/src/ui/view/intro_view/loading_page.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/view/intro_view/login_page.dart';
import 'package:mofu_flutter/src/ui/view/home_view/ingredient_add_page.dart';
import 'package:mofu_flutter/src/ui/view/foodvision_view/foodvision_page.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    displayWidth = Get.width;
    displayHeight = Get.height;
    displayRatio = displayHeight / displayWidth;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      title: 'Flutter Demo',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(fontFamily: 'Roboto'),
      themeMode: ThemeMode.light,
      home: LoadingPage(),
    );
  }
}
