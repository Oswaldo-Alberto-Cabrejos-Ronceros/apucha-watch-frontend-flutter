import 'package:apucha_watch_movil/features/auth/presentation/provider/auth_service_provider.dart';
import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
      //get authService from provider
      final authService = ref.read(authServiceProvider);
      final result = await authService.login(
        _emailController.text,
        _passwordController.text,
      );
      if (result != null) {
        final sessionDataProviderRef = ref.read(sessionDataProvider.notifier);
        sessionDataProviderRef.login(
          result.session.access_token,
          result.user.id,
        );
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
                    Navigator.pushNamed(context, '/register');
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
