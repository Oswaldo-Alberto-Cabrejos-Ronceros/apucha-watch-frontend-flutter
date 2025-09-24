import 'package:apucha_watch_movil/core/theme/app_theme.dart';
import 'package:apucha_watch_movil/screens/home_user/home_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  //for env variables
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apucha Watch',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().themeData(),
      home: HomeUserScreen(),
    );
  }
}
