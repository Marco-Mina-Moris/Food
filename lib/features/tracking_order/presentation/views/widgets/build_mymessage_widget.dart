


import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

Widget BuildMyMessage(String text, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  text,
                  style: AppTextStyle.sen400Style14.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 245, 155, 95),
              ),
            ],
          ),
        ],
      ),
    );
  }
