import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;
  final Color color;
  final double size;

  const SocialButton({
    super.key,
    required this.assetPath,
    required this.color,
    this.size = 60, // default size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
        child: Image.asset(
          assetPath,
          // width: size * 0.5,
          // height: size * 0.5,
          fit: BoxFit.contain,
          color: Colors.white,
        ),
      ),
    );
  }
}
