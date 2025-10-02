import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/core/theme/app_theme.dart';
import 'package:apucha_watch_movil/features/auth/infrastructure/auth_service.dart';
import 'package:apucha_watch_movil/features/auth/presentation/screens/login_screen.dart';
import 'package:apucha_watch_movil/features/auth/presentation/screens/register_screen.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/dashboard_user_screen.dart';
import 'package:apucha_watch_movil/screens/home_user/home_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  //for env variables
   final apiClient = ApiClient('');
  final  authService = AuthService(apiClient);
  await dotenv.load(fileName: ".env");
  runApp( MyApp(authService:  authService,));
}

class MyApp extends StatelessWidget {
  final AuthService authService;

  const MyApp({super.key, required this.authService});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apucha Watch',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().themeData(),
      home: HomeUserScreen(),
      initialRoute: '/login',
      routes: {
        "/login":(context)=> LoginScreen(authService: authService),
        "/register": (context)=> RegisterScreen(),
        "/home": (context) => DashboardUserScreen(),
      },
    );
  }
}
