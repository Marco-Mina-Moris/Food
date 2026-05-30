import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/features/user/tracking_order/presentation/view_model/tracking_order_cubit.dart';
import 'package:food/features/user/tracking_order/presentation/view_model/tracking_order_state.dart';
import 'package:food/features/user/tracking_order/presentation/views/widgets/courier_onfo_card.dart';
import 'package:food/features/user/tracking_order/presentation/views/widgets/order_history_item_widget.dart';
import 'package:food/features/user/tracking_order/presentation/views/widgets/order_progress_tracker_widget.dart';

class TrackingOrderView extends StatelessWidget {
  const TrackingOrderView({super.key});

  void _fitMapToMarkers(GoogleMapController controller, LatLng userLocation, LatLng driverLocation) {
    double minLat = userLocation.latitude < driverLocation.latitude ? userLocation.latitude : driverLocation.latitude;
    double maxLat = userLocation.latitude > driverLocation.latitude ? userLocation.latitude : driverLocation.latitude;
    double minLng = userLocation.longitude < driverLocation.longitude ? userLocation.longitude : driverLocation.longitude;
    double maxLng = userLocation.longitude > driverLocation.longitude ? userLocation.longitude : driverLocation.longitude;

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 80.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TrackingOrderCubit, TrackingOrderState>(
        builder: (context, state) {
          if (state is TrackingOrderLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrackingOrderError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TrackingOrderCubit>().loadTrackingInfo();
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }
          if (state is TrackingOrderLoaded) {
            final userLocation = state.userLocation;
            final driverLocation = state.courierLocation;

            final Set<Marker> markers = {
              Marker(
                markerId: const MarkerId('user_location'),
                position: userLocation,
                infoWindow: const InfoWindow(
                  title: 'Delivery Destination',
                  snippet: 'Halal Lab office',
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
              ),
              Marker(
                markerId: const MarkerId('driver_location'),
                position: driverLocation,
                infoWindow: InfoWindow(
                  title: 'Courier ${state.courierName}',
                  snippet: 'Arriving in ${state.estimatedTime}',
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              ),
            };

            final Set<Polyline> polylines = {
              Polyline(
                polylineId: const PolylineId('route_path'),
                points: [userLocation, driverLocation],
                color: AppColors.orange,
                width: 5,
              ),
            };

            return Stack(
              children: [
                // Google Map in the background
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: userLocation,
                    zoom: 14.0,
                  ),
                  markers: markers,
                  polylines: polylines,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    Future.delayed(const Duration(milliseconds: 300), () {
                      _fitMapToMarkers(controller, userLocation, driverLocation);
                    });
                  },
                ),
                
                // Floating App Bar on top of map
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: CustomAppBarWidget(
                      title: AppStrings.trackOrder,
                      trailing: const SizedBox(),
                      backColor: AppColors.veryDarkBlue,
                      leadingImage: Assets.assetsImagesBackwhite,
                    ),
                  ),
                ),
                
                // Draggable Scrollable Bottom Sheet
                DraggableScrollableSheet(
                  initialChildSize: 0.3,
                  minChildSize: 0.15,
                  maxChildSize: 0.8,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            // Drag handle indicator
                            Container(
                              width: 50,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const OrderHistoryItemWidget(),
                            const SizedBox(height: 36),
                            OrderProgressTrackerWidget(
                              currentStep: state.currentStep,
                              estimatedTime: state.estimatedTime,
                            ),
                            const SizedBox(height: 30),
                            CourierInfoCard(
                              name: state.courierName,
                              phone: state.courierPhone,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
