import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'tracking_order_state.dart';

class TrackingOrderCubit extends Cubit<TrackingOrderState> {
  TrackingOrderCubit() : super(const TrackingOrderInitial());

  void loadTrackingInfo() {
    emit(const TrackingOrderLoading());
    try {
      // In a real application, this would fetch from a database or track courier real-time stream.
      emit(const TrackingOrderLoaded(
        userLocation: LatLng(30.0444, 31.2357), // Cairo
        courierLocation: LatLng(30.0534, 31.2467), // Slightly northeast
        estimatedTime: "20 min",
        currentStep: 1, // 0: Received, 1: Preparing, 2: Picked up, 3: Arriving soon
        courierName: "Robert F.",
        courierPhone: "01152416400",
      ));
    } catch (e) {
      emit(TrackingOrderError("Failed to load tracking details: $e"));
    }
  }

  void updateCourierLocation(LatLng newLocation) {
    final currentState = state;
    if (currentState is TrackingOrderLoaded) {
      emit(TrackingOrderLoaded(
        userLocation: currentState.userLocation,
        courierLocation: newLocation,
        estimatedTime: currentState.estimatedTime,
        currentStep: currentState.currentStep,
        courierName: currentState.courierName,
        courierPhone: currentState.courierPhone,
      ));
    }
  }
}
