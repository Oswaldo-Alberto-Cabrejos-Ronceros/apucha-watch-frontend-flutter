import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:apucha_watch_movil/features/fall/domain/models/fall_response.dart';
import 'package:apucha_watch_movil/features/fall/presentation/providers/fall_service_provider.dart';
import 'package:apucha_watch_movil/screens/alerts_user/widgets/alert_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertsUserScreen extends ConsumerStatefulWidget {
  const AlertsUserScreen({super.key});

  @override
  ConsumerState<AlertsUserScreen> createState() => _AlertsUserScreenState();
}

class _AlertsUserScreenState extends ConsumerState<AlertsUserScreen> {
  String? _errorMessageFalls;
  bool _loadingFalls = false;
  List<FallResponse> _falls = [];
  //seniorCitizenId
  int? _seniorCitizenProfileId;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final sessionData = ref.watch(sessionDataProvider);
    final seniorCitizenProfileId = sessionData?['seniorCitizenProfileId'];
    _seniorCitizenProfileId = seniorCitizenProfileId;
    _fetchFalls();
  }

  Future<void> _fetchFalls() async {
    if (!mounted) return;
    setState(() {
      _loadingFalls = true;
      _errorMessageFalls = null;
    });
    try {
      if (_seniorCitizenProfileId == null) {
        throw Exception('No se encontro senior citizen profile Id');
      }
      final fallService = ref.watch(fallServiceProvider);
      _falls = await fallService.getFallHistory(_seniorCitizenProfileId!);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessageFalls = 'Error inesperado $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _loadingFalls = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Historial de Alertas',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Column(
          children: [
            if (_loadingFalls)
              const CircularProgressIndicator()
            else
              ..._falls.map(
                (e) => AlertCard(
                  icon: Icons.info,
                  color: Colors.red,
                  title: 'Posible caida',
                  subtitle: e.timestamp.toLocal().toString(),
                ),
              ),
          ],
        ),
        if (_errorMessageFalls != null)
          Text(
            _errorMessageFalls ?? 'Error al obtener alertas de caidas',
            style: const TextStyle(color: Colors.red),
          ),
        if (_falls.isEmpty && !_loadingFalls)
          Text('No se encontraron alertas de caidas'),
        AlertCard(
          icon: Icons.info,
          color: Colors.red,
          title: 'Posible caida',
          subtitle: 'Hace 2 horas',
        ),
        AlertCard(
          icon: Icons.monitor_heart_sharp,
          color: Colors.amber,
          title: 'Frecuencia cardíaca alta',
          subtitle: 'Hace 1 horas',
        ),
      ],
    );
  }
}
