// Input field at bottom
  import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/core/utils/app_assets.dart';
import 'package:food/core/utils/app_text_style.dart';

Widget BuildInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 223, 232, 240),
        borderRadius: BorderRadius.circular(12),
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Write something...",
                hintStyle: AppTextStyle.sen400Style12.copyWith(
                  color: Color(0xffABABAB),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(child: SvgPicture.asset(Assets.assetsImagesSendicon)),
        ],
      ),
    );
  }

