import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts_project/view/screens/bottom_nav.dart';
import 'package:webandcrafts_project/view/screens/home_screen/home_screen.dart';
import 'package:webandcrafts_project/view_model/product_view_model.dart';

void main() async {
  // sqfliteFfiInit();

  // databaseFactory = databaseFactoryFfi;
  // sqfliteFfiInit();
  WidgetsFlutterBinding.ensureInitialized();

  // Set the custom HttpOverrides
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web And Crafts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomBar(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
