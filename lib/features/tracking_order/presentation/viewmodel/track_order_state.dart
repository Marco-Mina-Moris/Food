import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class TrackOrderState {}

class TrackOrderInitial extends TrackOrderState {}

class TrackOrderLoading extends TrackOrderState {}

class TrackOrderUpdated extends TrackOrderState {
  final LatLng startPoint;
  final LatLng endPoint;
  final List<LatLng> polylinePoints;
  final LatLng driverPosition;

  TrackOrderUpdated({
    required this.startPoint,
    required this.endPoint,
    required this.polylinePoints,
    required this.driverPosition,
  });
}
