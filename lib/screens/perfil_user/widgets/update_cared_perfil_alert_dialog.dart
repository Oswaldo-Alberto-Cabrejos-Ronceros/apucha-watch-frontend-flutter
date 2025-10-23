import 'package:apucha_watch_movil/features/cared_profile/domain/models/cared_profile_update_request.dart';
import 'package:apucha_watch_movil/features/cared_profile/presentation/provider/cared_profile_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateCaredPerfilAlertDialog extends ConsumerStatefulWidget {
  const UpdateCaredPerfilAlertDialog({
    super.key,
    required this.caredProfileId,
    required this.caredNames,
    required this.caredLastnames,
  });

  final int caredProfileId;
  final String caredNames;
  final String caredLastnames;
  @override
  ConsumerState<UpdateCaredPerfilAlertDialog> createState() =>
      _UpdateCaredPerfilAlertDialogState();
}

class _UpdateCaredPerfilAlertDialogState
    extends ConsumerState<UpdateCaredPerfilAlertDialog> {
  //controller
  final _caredNamesController = TextEditingController();
  final _caredLastnamesController = TextEditingController();
  //para carga
  bool _loading = false;
  String? _errorMessague;
  //funcion para editar perfil
  @override
  void initState() {
    super.initState();
    _caredLastnamesController.text = widget.caredLastnames;
    _caredNamesController.text = widget.caredNames;
  }

  Future<void> _sendEditPerfil() async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _errorMessague = null;
    });
    try {
      final caredProfileService = ref.read(caredProfileServiceProvider);
      //creamos update request
      final updateRequest = CaredProfileUpdateRequest(
        name: _caredNamesController.text,
        lastname: _caredLastnamesController.text,
      );
      final updateCaredPerfil = await caredProfileService.update(
        widget.caredProfileId,
        updateRequest,
      );
      if (updateCaredPerfil == null) {
        throw Exception('Error al actualizar perfil, retorno null');
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessague = 'Error al editar perfil $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar datos de perfil'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Text('Nombres', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nombres',
              border: OutlineInputBorder(),
            ),
            controller: _caredNamesController,
          ),
          Text('Apellidos', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            decoration: InputDecoration(
              labelText: 'Apellidos',
              border: OutlineInputBorder(),
            ),
            controller: _caredLastnamesController,
          ),
          if (_loading) const CircularProgressIndicator(),
          //error
          if (_errorMessague != null)
            Text(
              _errorMessague ?? '',
              style: const TextStyle(color: Colors.red),
            ),
          ElevatedButton(
            onPressed: () async {
              await _sendEditPerfil();
              if (!mounted) return;
              if (!_loading && _errorMessague == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Guardado correctamente')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error correctamente $_errorMessague'),
                  ),
                );
              }
              Navigator.of(context).pop();
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
