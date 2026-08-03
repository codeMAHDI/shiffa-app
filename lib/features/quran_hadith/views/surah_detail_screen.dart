import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../view_models/quran_hadith_controller.dart';
import '../widgets/audio_player_bar.dart';

class SurahDetailScreen extends StatelessWidget {
  const SurahDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SurahModel surah = Get.arguments ?? SurahModel(number: 1, englishName: 'Al-Fatiha', arabicName: 'الفاتحة', revelationType: 'MAKKI');

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Sura ${surah.englishName}',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              children: [
                // Bismillah
                Text(
                  'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: AppColors.primaryGreen,
                    fontFamily: 'Amiri', // Assuming Amiri or standard Arabic font
                    height: 2,
                  ),
                ),
                SizedBox(height: 32.h),

                // Verses with Mock Tajweed Colors
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 26.sp,
                        color: AppColors.black,
                        height: 2.2,
                        fontFamily: 'Amiri',
                      ),
                      children: [
                        const TextSpan(text: 'الْحَمْدُ لِلَّهِ رَبِّ '),
                        TextSpan(text: 'الْعَالَمِينَ', style: TextStyle(color: Colors.red.shade400)), // Tajweed mock
                        const TextSpan(text: ' (1) الرَّحْمَٰنِ الرَّحِيمِ (2) مَالِكِ يَوْمِ الدِّينِ (3) '),
                        TextSpan(text: 'إِيَّاكَ', style: TextStyle(color: Colors.red.shade400)),
                        const TextSpan(text: ' نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ (4) اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ (5) صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَ'),
                        TextSpan(text: 'لَا', style: TextStyle(color: Colors.lightBlue.shade300)),
                        const TextSpan(text: ' الضَّالِّينَ (7) '),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.h),

                // English Translation
                Text(
                  '"[All] praise is [due] to Allah, Lord of the worlds - The Entirely Merciful, the Especially Merciful..."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade700,
                    height: 1.6,
                  ),
                ),
                
                // Extra space for bottom bar
                SizedBox(height: 100.h),
              ],
            ),
          ),

          // Floating Audio Player Bar
          Positioned(
            bottom: 30.h,
            left: 20.w,
            right: 20.w,
            child: const AudioPlayerBar(),
          ),
        ],
      ),
    );
  }
}
