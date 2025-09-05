import 'package:flutter/material.dart';
import 'package:food/features/my_orders/presentation/views/widgets/custom_ongoing_item_card.dart';

class BuildOngoingTab extends StatelessWidget {
  const BuildOngoingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(children: [CustomOngingItemCard(), SizedBox(height: 24)]);
      },
    );
  }
}
