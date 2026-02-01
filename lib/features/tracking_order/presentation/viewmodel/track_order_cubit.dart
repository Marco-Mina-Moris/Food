import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/tracking_order/presentation/data/model/route_model.dart';
import 'package:food/features/tracking_order/presentation/data/services/routes_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'track_order_state.dart';

class TrackOrderCubit extends Cubit<TrackOrderState> {
  final RoutesService routesService;

  TrackOrderCubit(this.routesService) : super(TrackOrderInitial());

  BitmapDescriptor? startMarker;   // أيقونة الهدف (النهاية)
  BitmapDescriptor? endMarker;     // أيقونة البداية

  List<LatLng> routePoints = [];   // النقاط اللي جاية من Google
  LatLng? currentDriverPos;        // مكان الرايدر الحالي
  int _currentIndex = 0;           // مؤشر الحركة

  Timer? movementTimer;            // تايمر للحركة

  // --------------------------------------------------------------------------
  // تحميل ماركر البداية والنهاية
  // --------------------------------------------------------------------------
  Future<void> _loadMarkers() async {
    startMarker = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(60, 60)),
      'assets/icons/start_mark.png',
    );

    endMarker = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(70, 70)),
      'assets/icons/end_mark.png',
    );
  }

  // --------------------------------------------------------------------------
  // 1) تحميل Route حقيقي من Google Directions API
  // --------------------------------------------------------------------------
  Future<void> setRoute(RouteModel route) async {
    emit(TrackOrderLoading());

    await _loadMarkers();

    // Get real polyline from Google Directions API
    final polyline = await routesService.getRoutePolyline(
      origin: route.startPoint,
      destination: route.endPoint,
    );

    routePoints = polyline;

    // بداية الحركة من أول نقطة
    currentDriverPos = routePoints.first;

    emit(
      TrackOrderUpdated(
        startPoint: route.startPoint,
        endPoint: route.endPoint,
        polylinePoints: routePoints,
        driverPosition: currentDriverPos!,
      ),
    );

    // ابدأ الحركة بعد تحميل الروت
    startSimulatedMovement();
  }

  // --------------------------------------------------------------------------
  // 2) حركة الرايدر - Simulation - يتحرك كل ثانية على الطريق
  // --------------------------------------------------------------------------
  void startSimulatedMovement() {
    if (routePoints.isEmpty) return;

    _currentIndex = 0;
    currentDriverPos = routePoints[0];

    // cancel old timer لو موجود
    movementTimer?.cancel();

    movementTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        _currentIndex++;

        // إعادة الحركة من الأول لما يوصل للنهاية
        if (_currentIndex >= routePoints.length) {
          _currentIndex = 0;
        }

        currentDriverPos = routePoints[_currentIndex];

        emit(
          TrackOrderUpdated(
            startPoint: routePoints.first,
            endPoint: routePoints.last,
            polylinePoints: routePoints,
            driverPosition: currentDriverPos!,
          ),
        );
      },
    );
  }

  // --------------------------------------------------------------------------
  // cancel timer عند الحاجة
  // --------------------------------------------------------------------------
  void dispose() {
    movementTimer?.cancel();
  }
}
