import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/tracking_order/presentation/views/widgets/build_input_field_widget.dart';
import 'package:food/features/tracking_order/presentation/views/widgets/build_mymessage_widget.dart';
import 'package:food/features/tracking_order/presentation/views/widgets/build_other_message_widget.dart';

class DeliveryManMessageView extends StatelessWidget {
  const DeliveryManMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBarWidget(
              title: 'Robert Fox',
              trailing: SizedBox(),
              ontapBack: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  BuildMyMessage("Are you coming?", "8:10 pm"),
                  BuildOtherMessage("Hay, Congratulation for order", "8:11 pm"),
                  BuildMyMessage("Hey Where are you now?", "8:11 pm"),
                  BuildOtherMessage("I’m Coming , just wait ...", "8:12 pm"),
                  BuildMyMessage("Hurry Up, Man", "8:12 pm"),
                ],
              ),
            ),
            BuildInputField(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
