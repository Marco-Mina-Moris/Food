import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteModel {
  final LatLng startPoint;
  final LatLng endPoint;
  final List<LatLng> polylinePoints;

  RouteModel({
    required this.startPoint,
    required this.endPoint,
    required this.polylinePoints,
  });
}
