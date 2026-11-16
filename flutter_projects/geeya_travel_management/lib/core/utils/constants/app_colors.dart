import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Screen background
  // Figma "color/yellow/13"
  static const Color background = Color(0xFF2A2F11);
  // Discover screen background "Primary/screen background"
  static const Color discoverBackground = Color(0xFF2B2F16);
  // Surface Colors
  static const Color surface = Color(0xFF1F240C); // Inputs, chips, social buttons, search bar
  static const Color surfaceDark = Color(0xFF232811); // Bottom nav bar fill "color/yellow/11"
  static const Color toggleBg = Color(0xFF20230E); // Grid/list toggle container
  static const Color creamCard = Color(0xFFDCD5C4); // bg/cream-card
  static const Color bottomSheetBgColor = Color(0xFFF0EBDF); // bg/cream-card

  // Accent / Primary
  static const Color primary = Color(0xFFC9B2E6); // color/violet/80
  static const Color onPrimary = Color(0xFF2A2340); // color/blue/19
  static const Color secondary = Color(0xFF5AA333); // color/blue/19
  static const Color deepPrimary = Color(0xFF7A5C9E); // color/blue/19

  // Text Colors
  static const Color textPrimary = Color(0xFFF3EDE4); // text/primary
  static const Color textSecondary = Color(0xFFF3EDE4); // text/primary
  static const Color textWhite = Color(0xFFFFFFFF); // text/primary
  static const Color textBlack = Color(0xFF000000); // text/primary
  static const Color textHeading = Color(0xFFEEEBE6); // Secundary Button color
  static const Color textSubtitle = Color(0xFFC5D1D8); // Subtitles, eyebrow text
  static const Color textOnCream = Color(0xFF2A2F11); // text/dark
  static const Color lavenderText = Color(0xFFD8CCEB); // Small country tags
  static const Color textPlaceholder = Color(0xFF74756D); // Text/Text
  static const Color textMuted = Color(0xFFA3A18C); // text/muted
  static const Color textHelper = Color(0xFF8D8F79); // Don't have an account?
  static const Color textInactive = Color(0xFF6E695C); // Text/Muted
  static const Color sectionLabel = Color(0xFF8B9A7E); // FILTERS, DESTINATIONS
  static const Color socialText = Color(0xFFD8DAD0); // color/yellow/84
  static const Color dividerText = Color(0xFF50523B); // "or" divider text
  static const Color smallBar = Color(0xFFDCD5C4); // "or" divider text

  // Borders
  static const Color borderDefault = Color(0xFF3A3E27); // Primary/Stock
  static const Color borderSocial = Color(0xFF464D3C);
  static const Color borderSubtle = Color(0x24FFFFFF); // 14% white

  // Utility
  static const Color warning = Color(0xFF8A4A3A); // Functional/Warning
  static const Color primaryDark = Color(0xFFDED9D0);
  static const Color success = Color(0xFF4CAF50);
  static const Color greenLighterShade = Color(0xFF8BAE7C);
  static const Color error = Color(0xFFF44336);
  static const Color brawnRed = Color(0xFFC97B5C);

  // Shadow
  static const Color shadowColor = Color(0x660D1D1D); // 40% opacity of #0D1D1D
}
