import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_text_style.dart';

class DeliveryManCallView extends StatelessWidget {
  const DeliveryManCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A5A6A),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF4A5A6A),
                borderRadius: BorderRadius.only(),
              ),
            ),
          ),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFB0BEC5),
                ),
                const SizedBox(height: 12),

                Text(
                  "Robert Fox",
                  style: AppTextStyle.sen700Style20.copyWith(
                    color: AppColors.veryDarkBlue,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Connecting....",
                  style: AppTextStyle.sen400Style16.copyWith(
                    color: Color(0xff979797),
                  ),
                ),

                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // زر الصمت (Mute) - دائرة بيضاء مع أيقونة صمت
                    GestureDetector(
                      onTap: () {
                        // هنا هتضيف الوظيفة للصمت
                        print('Mute tapped');
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.mic_off,
                          size: 30,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    // زر الرد (Answer Call) - دائرة حمراء مع أيقونة الهاتف
                    GestureDetector(
                      onTap: () {
                        // هنا هتضيف الوظيفة للرد على المكالمة
                        print('Answer call');
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.3),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Icon(Icons.call, size: 35, color: Colors.white),
                      ),
                    ),
                    // زر السماعة (Speaker) - دائرة بيضاء مع أيقونة صوت
                    GestureDetector(
                      onTap: () {
                        // هنا هتضيف الوظيفة للسماعة
                        print('Speaker tapped');
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.volume_up_outlined,
                          size: 30,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
