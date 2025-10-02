import 'package:apucha_watch_movil/features/auth/infrastructure/auth_service.dart';
import 'package:apucha_watch_movil/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final AuthService authService;
  const LoginScreen({super.key, required this.authService});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //error message
  String? _errorMessague;
  bool _loading = false;

  //metodo que inicia sesion
  Future<void> _login() async {
    setState(() {
      _loading = true;
      _errorMessague = null;
    });
    try {
      final result = await widget.authService.login(
        _emailController.text,
        _passwordController.text,
      );
      if (result != null) {
        //if exist
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        setState(() {
          _errorMessague = 'Credenciales invalidas';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessague = 'Error inesperado $e';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

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
                Text(
                  'Apucha Watch',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text('Inicio de sesión', style: TextStyle(fontSize: 16)),
                //textfield email
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(),
                  ),
                ),
                //textfield password
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                if (_loading) const CircularProgressIndicator(),

                //error
                if (_errorMessague != null)
                  Text(
                    _errorMessague ?? '',
                    style: const TextStyle(color: Colors.red),
                  ),

                FilledButton(
                  onPressed: _loading ? null : _login,
                  child: Text('Iniciar sesión'),
                ),
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
