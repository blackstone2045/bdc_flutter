import 'package:get/get.dart';

class LanguageController extends GetxController {
  final selectedLanguage = "Use device language".obs;

  final List<String> languages = [
    "Use device language",
    "English",
    // "Español",
    // "Italiano",
    // "Deutsch",
    // "中文（简体）",
  ];

  void setLanguage(String language) {
    selectedLanguage.value = language;
  }
}
