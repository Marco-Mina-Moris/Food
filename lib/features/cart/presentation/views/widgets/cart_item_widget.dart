import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_text_style.dart';
import 'package:food/features/cart/presentation/views/widgets/custom_add_remove_quantity_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 117,
            width: 136,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://th.bing.com/th/id/OSK.748012898bc01cf64b5c6e566a693d07?w=200&h=126&c=7&rs=1&qlt=80&o=6&cdv=1&pid=16.1',
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 44,
                      width: 126,
                      child: Text(
                        'pizza calzone european',
                        style: AppTextStyle.sen400Style17.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SvgPicture.asset(Assets.assetsImagesCross),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  '\$64',
                  style: AppTextStyle.sen700Style20.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 17),
                CustomAddAndRemoveQuantityWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
