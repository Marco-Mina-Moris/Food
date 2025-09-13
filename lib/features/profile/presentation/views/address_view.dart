import 'package:flutter/material.dart';
import 'package:food/core/common/widget/Custom_button.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_strings.dart';
import 'package:food/core/common/widget/custom_app_bar_widget.dart';
import 'package:food/features/profile/presentation/views/add_new_address_view.dart';
import 'package:food/features/profile/presentation/views/widgets/custom_address_list_tile_widget.dart';

class AddressView extends StatelessWidget {
  AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomAppBarWidget(
              title: AppStrings.myAddress,
              trailing: SizedBox(),
            ),
            const SizedBox(height: 24),
            CustomAddressListTileWidget(
              titleText: AppStrings.home,
              subtitleText: "Obour City",
              leadingImage: Assets.assetsImagesHome,
            ),
            const SizedBox(height: 20),
            CustomAddressListTileWidget(
              titleText: AppStrings.work,
              subtitleText: "Benha City",
              leadingImage: Assets.assetsImagesOffice,
            ),
            const Spacer(),
            CustomButton(
              text: AppStrings.addnewaddress,
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return AddNewAddressView();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
