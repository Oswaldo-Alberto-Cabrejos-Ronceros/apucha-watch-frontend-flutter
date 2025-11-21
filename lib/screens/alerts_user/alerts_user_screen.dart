import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:apucha_watch_movil/features/fall/domain/models/fall_response.dart';
import 'package:apucha_watch_movil/features/fall/presentation/providers/fall_service_provider.dart';
import 'package:apucha_watch_movil/features/vital_sign_alert/domain/create_vital_signs_alert_dto.dart';
import 'package:apucha_watch_movil/features/vital_sign_alert/presentation/vital_signs_alert_service_provider.dart';
import 'package:apucha_watch_movil/screens/alerts_user/widgets/alert_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertsUserScreen extends ConsumerStatefulWidget {
  const AlertsUserScreen({super.key});

  @override
  ConsumerState<AlertsUserScreen> createState() => _AlertsUserScreenState();
}

class _AlertsUserScreenState extends ConsumerState<AlertsUserScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int? _seniorId;

  bool _loadingFalls = false;
  bool _loadingVital = false;

  String? _errorFalls;
  String? _errorVital;

  List<FallResponse> _falls = [];
  List<CreateVitalSignsAlertDto> _vital = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final session = ref.watch(sessionDataProvider);
    _seniorId = session?["seniorCitizenProfileId"];
    if (_seniorId != null) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    _fetchFalls();
    _fetchVitals();
  }

  Future<void> _fetchFalls() async {
    setState(() {
      _loadingFalls = true;
      _errorFalls = null;
    });

    try {
      final service = ref.read(fallServiceProvider);
      _falls = await service.getFallHistory(_seniorId!);
    } catch (e) {
      _errorFalls = e.toString();
    }

    if (mounted) setState(() => _loadingFalls = false);
  }

  Future<void> _fetchVitals() async {
    setState(() {
      _loadingVital = true;
      _errorVital = null;
    });

    try {
      final service = ref.read(vitalSignsAlertServiceProvider);
      print("leyo servicios");
      _vital = await service.findAllBySeniorId(_seniorId!);
      print("Vitals");
      print(_vital);
    } catch (e) {
      _errorVital = e.toString();
    }

    if (mounted) setState(() => _loadingVital = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial de Alertas"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Caídas", icon: Icon(Icons.warning)),
            Tab(text: "Signos Vitales", icon: Icon(Icons.heart_broken)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildFallsTab(), _buildVitalTab()],
      ),
    );
  }


  Widget _buildFallsTab() {
    if (_loadingFalls) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorFalls != null) {
      return Center(child: Text("Error: $_errorFalls"));
    }

    if (_falls.isEmpty) {
      return const Center(child: Text("No hay alertas de caídas."));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _falls.length,
      itemBuilder: (context, i) {
        final f = _falls[i];
        return AlertCard(
          icon: Icons.info,
          color: Colors.red,
          title: "Posible caída",
          subtitle: f.timestamp.toLocal().toString(),
        );
      },
    );
  }


  Widget _buildVitalTab() {
    if (_loadingVital) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorVital != null) {
      return Center(child: Text("Error: $_errorVital"));
    }

    if (_vital.isEmpty) {
      return const Center(child: Text("No hay alertas de signos vitales."));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _vital.length,
      itemBuilder: (context, i) {
        final v = _vital[i];
        return AlertCard(
          icon: Icons.monitor_heart,
          color: Colors.amber,
          title: "Tipo: ${v.type} Severidad: ${v.severity}",
          subtitle: v.timestamp.toLocal().toString(),
        );
      },
    );
  }
}
