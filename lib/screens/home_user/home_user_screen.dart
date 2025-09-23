import 'package:apucha_watch_movil/screens/alerts_user/alerts_user_screen.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/dashboard_user_screen.dart';
import 'package:apucha_watch_movil/screens/perfil_user/perfil_user_screen.dart';
import 'package:flutter/material.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({super.key});

  @override
  State<HomeUserScreen> createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> {
  //for index of bottom navigation bar
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    DashboardUserScreen(),
    AlertsUserScreen(),
    PerfilUserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: _screens[_selectedIndex],
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
            icon: Icon(Icons.notifications),
            label: 'Alertas',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
