
  // Message from Others (Grey bubble, left aligned)
  import 'package:flutter/material.dart';
import 'package:food/core/utils/app_text_style.dart';

Widget BuildOtherMessage(String text, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.grey),
              SizedBox(width: 10),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 199, 231, 246),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(text, style: AppTextStyle.sen400Style14.copyWith()),
              ),
            ],
          ),
        ],
      ),
    );
  }
