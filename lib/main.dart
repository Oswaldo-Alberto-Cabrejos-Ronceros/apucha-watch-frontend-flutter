import 'package:apucha_watch_movil/core/theme/app_theme.dart';
import 'package:apucha_watch_movil/features/auth/presentation/screens/add_device_screen.dart';
import 'package:apucha_watch_movil/features/auth/presentation/screens/login_screen.dart';
import 'package:apucha_watch_movil/features/auth/presentation/screens/register_screen.dart';
import 'package:apucha_watch_movil/screens/create_senior_citizen/create_senior_citizen.dart';
import 'package:apucha_watch_movil/screens/home_user/home_user_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//manejar notificacion
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // ignore: avoid_print
  print(" Notificación: ${message.notification?.title}");
}

void main() async {
  //inicializamos firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //for env variables
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
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
      initialRoute: '/login',
      routes: {
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/register/device": (context) => AddDeviceScreen(),
        "/register/senior_citizen": (context) => CreateSeniorCitizenScreen(),
        "/home": (context) => HomeUserScreen(),
      },
    );
  }
}
