import 'package:flutter/material.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/features/tracking_order/presentation/views/widgets/courier_onfo_card.dart';
import 'package:food/features/tracking_order/presentation/views/widgets/order_history_item_widget.dart';
import 'package:food/features/tracking_order/presentation/views/widgets/order_progress_tracker_widget.dart';

class TrackingOrderView extends StatelessWidget {
  const TrackingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFD0D9E1),
            child: SafeArea(
              child: Column(
                children: [
                  // Back Button and Title
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomAppBarWidget(
                      title: AppStrings.trackOrder,
                      trailing: SizedBox(),
                      backColor: AppColors.veryDarkBlue,
                      leadingImage: Assets.assetsImagesBackwhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.1,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      SizedBox(height: 42),
                      OrderHistoryItemWidget(),
                      SizedBox(height: 36),
                      OrderProgressTrackerWidget(),
                      SizedBox(height: 30),
                      CourierInfoCard(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
