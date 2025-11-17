import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/core/common/widget/Custom_button.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/my_cart/presentation/views/widgets/custom_total_widget.dart';
import 'package:food/features/payment/presentation/views/add_new_card_view.dart';
import 'package:food/features/payment/presentation/views/widgets/custom_add_new_button.dart';
import 'package:food/features/payment/presentation/views/widgets/custom_payment_option_widget.dart';
import 'package:food/features/payment/presentation/views/widgets/mastercard_info_card_widget.dart';
import 'package:food/features/payment/presentation/views/widgets/no_master_card_placeholder_widget.dart';

class PaymentView extends StatefulWidget {
  PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBarWidget(
              title: AppStrings.payment,
              trailing: SizedBox(),
              ontapBack: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 31),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomPaymentOptionWidget(
                    methodImage: Assets.assetsImagesCash,
                    method: AppStrings.cash,
                    isSelected: selectedIndex == 0,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  SizedBox(width: 16),
                  CustomPaymentOptionWidget(
                    methodImage: Assets.assetsImagesVisa,
                    method: AppStrings.visa,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    isSelected: selectedIndex == 1,
                  ),
                  SizedBox(width: 16),
                  CustomPaymentOptionWidget(
                    methodImage: Assets.assetsImagesMastercard,
                    method: AppStrings.mastercard,
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    isSelected: selectedIndex == 2,
                  ),
                  SizedBox(width: 16),
                  CustomPaymentOptionWidget(
                    methodImage: Assets.assetsImagesPaypal,
                    method: AppStrings.payPal,
                    isSelected: selectedIndex == 3,
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            NoMasterCardPlaceholderWidget(),
            //MasterCardInfoCard(),
            SizedBox(height: 15),
            CustomAddNewButton(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return AddNewCardView();
                    },
                  ),
                );
              },
            ),
            Spacer(),
            CustomTotalWidget(),
            SizedBox(height: 30),
            CustomButton(text: AppStrings.payConfirm, onPressed: () {}),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
