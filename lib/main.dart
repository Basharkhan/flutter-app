import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/welcme_page.dart';
import 'package:flutter_app/views/wodget_tree.dart';
import 'package:flutter_app/views/widgets/navbar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (BuildContext context, dynamic isDarkMOde, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: isDarkMOde ? Brightness.dark : Brightness.light,
          ),
          home: const WelcomePage(),
        );
      },
    );
  }
}
// begin from 2 hour and 37 minutes in the video