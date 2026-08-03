import 'package:get/get.dart';

class SurahModel {
  final int number;
  final String englishName;
  final String arabicName;
  final String revelationType; // MAKKI or MADANI

  SurahModel({
    required this.number,
    required this.englishName,
    required this.arabicName,
    required this.revelationType,
  });
}

class HadithBookModel {
  final String name;
  final String arabicName;
  final int hadithCount;
  final bool isAuthentic;

  HadithBookModel({
    required this.name,
    required this.arabicName,
    required this.hadithCount,
    this.isAuthentic = true,
  });
}

class QuranHadithController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;

  final List<SurahModel> surahs = [
    SurahModel(number: 1, englishName: 'Al-Fatiha', arabicName: 'الفاتحة', revelationType: 'MAKKI'),
    SurahModel(number: 2, englishName: 'Al-Baqarah', arabicName: 'البقرة', revelationType: 'MADANI'),
    SurahModel(number: 3, englishName: "Ali 'Imran", arabicName: 'آل عمران', revelationType: 'MADANI'),
    SurahModel(number: 4, englishName: 'An-Nisa', arabicName: 'النساء', revelationType: 'MADANI'),
    SurahModel(number: 5, englishName: "Al-Ma'idah", arabicName: 'المائدة', revelationType: 'MADANI'),
    SurahModel(number: 6, englishName: "Al-An'am", arabicName: 'الأنعام', revelationType: 'MAKKI'),
  ];

  final List<HadithBookModel> hadithBooks = [
    HadithBookModel(name: 'Sahih al-Bukhari', arabicName: 'صحيح البخاري', hadithCount: 7563),
    HadithBookModel(name: 'Sahih Muslim', arabicName: 'صحيح مسلم', hadithCount: 7563),
    HadithBookModel(name: "Jami' at-Tirmidhi", arabicName: 'جامع الترمذي', hadithCount: 3956),
    HadithBookModel(name: "Sunan an-Nasa'i", arabicName: 'سنن النسائي', hadithCount: 5758),
    HadithBookModel(name: 'Sunan Abu Dawood', arabicName: 'سنن أبي داود', hadithCount: 5274),
  ];

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}
