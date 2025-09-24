import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationMapAlertDialog extends StatefulWidget {
  const CurrentLocationMapAlertDialog({super.key});

  @override
  State<CurrentLocationMapAlertDialog> createState() =>
      _CurrentLocationMapAlertDialogState();
}

class _CurrentLocationMapAlertDialogState
    extends State<CurrentLocationMapAlertDialog> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-12.0464, -77.0428); //locaction example
  //methot for contruct the map
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
