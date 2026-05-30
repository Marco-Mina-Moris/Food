import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/user/cart/presentation/view_model/cart_cubit.dart';
import 'package:food/features/user/cart/presentation/views/widgets/cart_bottom_section_widget.dart';
import 'package:food/features/user/cart/presentation/views/widgets/cart_item_widget.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomAppBarWidget(
                leadingImage: Assets.assetsImagesBackwhite,
                backColor: AppColors.bluegray,
                title: AppStrings.cart,
                textstyle: AppTextStyle.sen400Style17.copyWith(
                  color: Colors.white,
                ),
                trailing: Text(
                  AppStrings.editItems,
                  style: AppTextStyle.sen400Style14.copyWith(
                    color: AppColors.orange,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.orange,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.orange),
                    );
                  }

                  if (state is CartError) {
                    return Center(
                      child: Text(
                        state.messageError,
                        style: GoogleFonts.sen(color: Colors.red),
                      ),
                    );
                  }

                  if (state is CartLoaded) {
                    final items = state.cartItems;
                    final total = state.totalPrice;

                    if (items.isEmpty) {
                      return _buildEmptyState();
                    }

                    return Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: ListView.separated(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                final idMeal = item['idMeal'] ?? '';
                                final size = item['size'] ?? 'Medium';
                                final quantity = item['quantity'] ?? 1;

                                return CartItemWidget(
                                  key: ValueKey('$idMeal-$size'),
                                  item: item,
                                  onIncrement: () {
                                    context.read<CartCubit>().updateItemQty(
                                          idMeal,
                                          size,
                                          quantity + 1,
                                        );
                                  },
                                  onDecrement: () {
                                    if (quantity > 1) {
                                      context.read<CartCubit>().updateItemQty(
                                            idMeal,
                                            size,
                                            quantity - 1,
                                          );
                                    } else {
                                      context.read<CartCubit>().removeItem(idMeal, size);
                                    }
                                  },
                                  onRemove: () {
                                    context.read<CartCubit>().removeItem(idMeal, size);
                                  },
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(height: 16);
                              },
                            ),
                          ),
                        ),
                        // Adding the CartBottomSection with dynamic total
                        CartBottomSectionWidget(totalPrice: total),
                      ],
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.bluegray,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 55,
                color: AppColors.orange,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Your Cart is Empty',
              style: GoogleFonts.sen(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Browse dishes and add them to your cart. They will appear here when you do!',
              textAlign: TextAlign.center,
              style: GoogleFonts.sen(
                fontSize: 14,
                color: AppColors.lavenderGray,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            MaterialButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              color: AppColors.orange,
              height: 50,
              minWidth: 180,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Browse Food',
                style: GoogleFonts.sen(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
