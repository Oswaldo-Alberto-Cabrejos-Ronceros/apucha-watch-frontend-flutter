import 'package:apucha_watch_movil/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Padding(padding: EdgeInsets.all(20),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            //title
            Text('Apucha Watch', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
            Text('Registro', style: TextStyle(fontSize: 16)),
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
            //textfield confirm password
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirmar Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombres',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Apellidos',
                border: OutlineInputBorder(),
              ),
            ),
            FilledButton(onPressed: (){}, child: Text('Registrarse')),
            Center(child: Text('¿Ya tienes una cuenta?')),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, '/login');
            }, child: Text('Iniciar sesión'))
          ],

        ),),
      ),
      
    ),);
  }
}