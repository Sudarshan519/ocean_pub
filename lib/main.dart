import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:publication_app/features/authors/authors_view.dart';
import 'package:publication_app/features/dashboard/homepage/homepage_view.dart';
import 'package:publication_app/features/distributors/distributors_view.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here

      debugShowCheckedModeBanner: false,
      title: 'Ocean Publication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}
