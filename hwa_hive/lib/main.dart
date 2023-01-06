import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hwa_hive/home/home_view.dart';

Future<void> main() async {
  Hive.init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
