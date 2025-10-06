import 'package:apucha_watch_movil/features/auth/domain/models/register_request.dart';
import 'package:apucha_watch_movil/features/auth/presentation/provider/auth_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  //controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  //error message
  String? _errorMessague;
  //loading
  bool _loading = false;

  //metodo que inicia sesion
  Future<void> _register() async {
    setState(() {
      _loading = true;
      _errorMessague = null;
    });
    try {
      final authService = ref.read(authServiceProvider);
      //construimos un RegisterRequest
      final registerRequest = RegisterRequest(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        lastname: _lastnameController.text,
      );
      final result = await authService.register(registerRequest);
      if (result) {
        //if exist
        if (!mounted) return;
        //por mientras despues poner pagina de espera de confimacion de correo
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        setState(() {
          _errorMessague = 'Error al registar usuario';
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
                if (_loading) const CircularProgressIndicator(),
                //error
                if (_errorMessague != null)
                  Text(
                    _errorMessague ?? '',
                    style: const TextStyle(color: Colors.red),
                  ),

                FilledButton(
                  onPressed: _loading ? null : _register,
                  child: Text('Registrarse'),
                ),
                Center(child: Text('¿Ya tienes una cuenta?')),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Iniciar sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
