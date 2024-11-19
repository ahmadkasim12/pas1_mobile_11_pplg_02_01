import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas1_mobile_11_pplg_02_01/pages/mobile/PageDetail.dart';
import 'pages/mobile/LoginMobile.dart';
import 'pages/mobile/MobileNavigator.dart';
import 'pages/mobile/RegisterMobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginMobile()),
        GetPage(name: '/registrar', page: () => RegistrarMobile()),
        GetPage(name: '/home_mobile', page: () => MobileNavigator()),
      ],
    );
  }
}