import 'package:apucha_watch_movil/screens/alerts_user/alerts_user_screen.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/dashboard_user_screen.dart';
import 'package:apucha_watch_movil/screens/health_conditions_user/health_conditions_user_screen.dart';
import 'package:apucha_watch_movil/screens/perfil_user/perfil_user_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({super.key});

  @override
  State<HomeUserScreen> createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> {
  //inicializamos el plugin de notificaciones locales
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    //cuando la app esta abierta
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // ignore: avoid_print
      print('Mensaje recibido: ${message.notification?.title}');
      _showNotification(message);
    });

    // 📲 Cuando abres la app tocando la notificación
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // ignore: avoid_print
      print('Notificación tocada: ${message.notification?.title}');
      _showNotification(message);
    });
  }

//funcion para mostrar las notificaciones locales
Future<void> _showNotification(RemoteMessage messague) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
        'default_channel',
        'Notificaciones generales',
        channelDescription: 'Canal de notificaciones generales',
        importance: Importance.max,
        priority: Priority.high,
      );
  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );
  await flutterLocalNotificationsPlugin.show(
    DateTime.now().millisecondsSinceEpoch.remainder(100000),
    messague.notification?.title ?? 'Sin Titulo',
    messague.notification?.body ?? 'Sin cuerpo',
    notificationDetails,
  );
}


  //for index of bottom navigation bar
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    DashboardUserScreen(),
    HealthConditionsUserScreen(),
    AlertsUserScreen(),
    PerfilUserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Apucha Watch',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: SingleChildScrollView(child: _screens[_selectedIndex]),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
          NavigationDestination(
            icon: Icon(Icons.health_and_safety),
            label: 'Salud',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Alertas',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
