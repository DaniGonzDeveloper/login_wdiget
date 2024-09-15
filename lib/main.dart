import 'package:flutter/material.dart';
import 'package:login_widget/screens/login_screen/login_page.dart';

import 'Utils/get_it_utility.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //GetIt initializer
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

