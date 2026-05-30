import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
abstract class TrackingOrderState {
  const TrackingOrderState();
}

class TrackingOrderInitial extends TrackingOrderState {
  const TrackingOrderInitial();
}

class TrackingOrderLoading extends TrackingOrderState {
  const TrackingOrderLoading();
}

class TrackingOrderLoaded extends TrackingOrderState {
  final LatLng userLocation;
  final LatLng courierLocation;
  final String estimatedTime;
  final int currentStep; // 0: Received, 1: Preparing, 2: Picked up, 3: Arriving
  final String courierName;
  final String courierPhone;

  const TrackingOrderLoaded({
    required this.userLocation,
    required this.courierLocation,
    required this.estimatedTime,
    required this.currentStep,
    required this.courierName,
    required this.courierPhone,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackingOrderLoaded &&
          runtimeType == other.runtimeType &&
          userLocation == other.userLocation &&
          courierLocation == other.courierLocation &&
          estimatedTime == other.estimatedTime &&
          currentStep == other.currentStep &&
          courierName == other.courierName &&
          courierPhone == other.courierPhone;

  @override
  int get hashCode =>
      userLocation.hashCode ^
      courierLocation.hashCode ^
      estimatedTime.hashCode ^
      currentStep.hashCode ^
      courierName.hashCode ^
      courierPhone.hashCode;
}

class TrackingOrderError extends TrackingOrderState {
  final String message;
  const TrackingOrderError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackingOrderError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
