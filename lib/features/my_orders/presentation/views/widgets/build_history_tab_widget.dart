import 'package:flutter/material.dart';
import 'package:food/features/my_orders/presentation/views/widgets/custom_history_item_card.dart';

class BuildHistoryTab extends StatelessWidget {
  const BuildHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(
          children: [CustomHistoryItemCard(), const SizedBox(height: 24)],
        );
      },
    );
  }
}
