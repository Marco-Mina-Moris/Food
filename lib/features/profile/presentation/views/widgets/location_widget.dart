
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.grey[300],
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Move to edit location',
                  style: TextStyle(color: Colors.black),
                ),
                Icon(
                  Icons.location_pin,
                  color: Colors.orange,
                  size: 40,
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 14,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(Assets.assetsImagesArrowBackground),
                SvgPicture.asset(Assets.assetsImagesBackwhite),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
