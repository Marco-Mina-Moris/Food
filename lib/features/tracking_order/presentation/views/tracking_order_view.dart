import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/core/utils/api_keys.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/features/tracking_order/presentation/data/model/route_model.dart';
import 'package:food/features/tracking_order/presentation/data/services/routes_service.dart';
import 'package:food/features/tracking_order/presentation/viewmodel/track_order_cubit.dart';
import 'package:food/features/tracking_order/presentation/viewmodel/track_order_state.dart';
import 'package:food/features/tracking_order/presentation/views/widgets/courier_onfo_card.dart';
import 'package:food/features/tracking_order/presentation/views/widgets/order_history_item_widget.dart';
import 'package:food/features/tracking_order/presentation/views/widgets/order_progress_tracker_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingOrderView extends StatelessWidget {
  const TrackingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrackOrderCubit(
        RoutesService(apiKey: ApiKeys.directionsApiKey),
      )
        ..setRoute(
          RouteModel(
            startPoint: const LatLng(30.0444, 31.2357),
            endPoint: const LatLng(30.0500, 31.2400),
            polylinePoints: const [
              LatLng(30.0444, 31.2357),
              LatLng(30.0460, 31.2370),
              LatLng(30.0475, 31.2385),
              LatLng(30.0488, 31.2392),
              LatLng(30.0500, 31.2400),
            ],
          ),
        ),
      child: Scaffold(
        body: Stack(
          children: [
            /// ---------------------- Google Map ----------------------
            BlocBuilder<TrackOrderCubit, TrackOrderState>(
              builder: (context, state) {
                if (state is TrackOrderUpdated) {
                  final cubit = context.read<TrackOrderCubit>();

                  return GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: state.startPoint,
                      zoom: 14,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId("start"),
                        position: state.startPoint,
                        icon: cubit.endMarker!,
                      ),
                      Marker(
                        markerId: const MarkerId("end"),
                        position: state.endPoint,
                        icon: cubit.startMarker!,
                      ),
                    },
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId("route"),
                        width: 6,
                        color: const Color(0xFFFFC107),
                        jointType: JointType.round,
                        startCap: Cap.roundCap,
                        endCap: Cap.roundCap,
                        points: state.polylinePoints,
                      ),
                    },
                    zoomControlsEnabled: false,
                    myLocationEnabled: false,
                  );
                }
                return const SizedBox();
              },
            ),

            /// ---------------------- AppBar ----------------------
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  color: const Color(0xFFD0D9E1),
                  padding: const EdgeInsets.all(16),
                  child: CustomAppBarWidget(
                    title: AppStrings.trackOrder,
                    trailing: const SizedBox(),
                    backColor: AppColors.veryDarkBlue,
                    leadingImage: Assets.assetsImagesBackwhite,
                  ),
                ),
              ),
            ),

            /// ---------------------- Bottom Sheet ----------------------
            DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.1,
              maxChildSize: 0.8,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        const SizedBox(height: 42),
                        OrderHistoryItemWidget(),
                        const SizedBox(height: 36),
                        OrderProgressTrackerWidget(),
                        const SizedBox(height: 30),
                        CourierInfoCard(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:food/core/common/widget/custom_app_bar_widget.dart';
// import 'package:food/core/utils/app_assets.dart';
// import 'package:food/core/utils/app_colors.dart';
// import 'package:food/core/utils/app_strings.dart';
// import 'package:food/features/tracking_order/presentation/views/widgets/courier_onfo_card.dart';
// import 'package:food/features/tracking_order/presentation/views/widgets/order_history_item_widget.dart';
// import 'package:food/features/tracking_order/presentation/views/widgets/order_progress_tracker_widget.dart';

// class TrackingOrderView extends StatelessWidget {
//   const TrackingOrderView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             color: Color(0xFFD0D9E1),
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   // Back Button and Title
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: CustomAppBarWidget(
//                       title: AppStrings.trackOrder,
//                       trailing: SizedBox(),
//                       backColor: AppColors.veryDarkBlue,
//                       leadingImage: Assets.assetsImagesBackwhite,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           DraggableScrollableSheet(
//             initialChildSize: 0.2,
//             minChildSize: 0.1,
//             maxChildSize: 0.8,
//             builder: (BuildContext context, ScrollController scrollController) {
//               return Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       spreadRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   child: Column(
//                     children: [
//                       SizedBox(height: 42),
//                       OrderHistoryItemWidget(),
//                       SizedBox(height: 36),
//                       OrderProgressTrackerWidget(),
//                       SizedBox(height: 30),
//                       CourierInfoCard(),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
