import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;
  final Color color;
  final double size;
  final VoidCallback? onTap;

  const SocialButton({
    super.key,
    required this.assetPath,
    required this.color,
    this.size = 80, // default size
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        // decoration: BoxDecoration(
        //   shape: BoxShape.circle,
        //   border: Border.all(color: color, width: 2),
        // ),
        child: Center(
          child: Image.asset(
            assetPath,
            width: size * 0.7,
            height: size * 0.7,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
