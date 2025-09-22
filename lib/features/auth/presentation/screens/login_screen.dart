import 'package:apucha_watch_movil/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                //title
                 Text('Apucha Watch', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
                Text('Inicio de sesión', style: TextStyle(fontSize: 16)),
                //textfield email
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(),
                  ),
                ),
                //textfield password
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                FilledButton(onPressed: () {}, child: Text('Iniciar sesión')),
                Center(child: Text('¿No tienes una cuenta?')),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text('Regístrate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
