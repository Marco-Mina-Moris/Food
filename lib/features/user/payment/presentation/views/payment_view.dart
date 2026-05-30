import 'package:flutter/material.dart';
import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/features/user/cart/presentation/views/widgets/custom_total_widget.dart';
import 'package:food/features/user/payment/presentation/views/add_new_card_view.dart';
import 'package:food/features/user/payment/presentation/views/widgets/custom_add_new_button.dart';
import 'package:food/features/user/payment/presentation/views/widgets/custom_payment_option_widget.dart';
import 'package:food/features/user/payment/presentation/views/widgets/no_master_card_placeholder_widget.dart';
import 'package:food/features/user/payment/presentation/views/widgets/mastercard_info_card_widget.dart';
import 'package:food/features/user/payment/presentation/views/congratulation_view.dart';
import 'package:food/core/dialogs/app_toasts.dart';
import 'package:toastification/toastification.dart';
import 'package:food/core/storage_helper/cart_manager.dart';

class PaymentView extends StatefulWidget {
  final double totalPrice;
  const PaymentView({super.key, required this.totalPrice});

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
            const SizedBox(height: 50),
            CustomAppBarWidget(
              title: AppStrings.payment,
              trailing: const SizedBox(),
              ontapBack: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 31),
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
                  const SizedBox(width: 16),
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
                  const SizedBox(width: 16),
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
                  const SizedBox(width: 16),
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
            const SizedBox(height: 25),
            if (selectedIndex == 1 || selectedIndex == 2)
              const MasterCardInfoCard()
            else
              const NoMasterCardPlaceholderWidget(),
            const SizedBox(height: 15),
            CustomAddNewButton(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const AddNewCardView();
                    },
                  ),
                );
              },
            ),
            const Spacer(),
            CustomTotalWidget(totalPrice: widget.totalPrice),
            const SizedBox(height: 30),
            CustomButton(
              text: AppStrings.payConfirm,
              onPressed: () async {
                if (selectedIndex == -1) {
                  AppToast.showToast(
                    context: context,
                    title: "Select Method",
                    description: "Please select a payment method to continue",
                    type: ToastificationType.warning,
                  );
                  return;
                }

                // Clear the cart on successful payment
                await CartManager.clearCart();
                CartManager.updateCartCount();

                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CongratulationView(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
