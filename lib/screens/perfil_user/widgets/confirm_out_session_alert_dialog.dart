import 'package:apucha_watch_movil/features/auth/presentation/provider/auth_service_provider.dart';
import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmOutSessionAlertDialog extends ConsumerWidget {
  const ConfirmOutSessionAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //get authService from provider
    final authService = ref.read(authServiceProvider);
    final sessionDataProviderRef = ref.read(sessionDataProvider.notifier);
    return AlertDialog(
      title: const Text('Cerrar sesión'),
      content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () async {
            await authService.logout();
            sessionDataProviderRef.logout();
            if (!context.mounted) return;
            Navigator.of(context).pushReplacementNamed('/login');
          },
          child: const Text('Cerrar sesión'),
        ),
      ],
    );
  }
}
