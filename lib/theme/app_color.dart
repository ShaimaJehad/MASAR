import 'package:flutter/material.dart';

/// نظام الألوان الموحّد لتطبيق "مسار" — مركز التدريب.
class AppColors {
  AppColors._();

  static const ink = Color(0xFF14213D);
  static const inkSoft = Color(0xFF1F2E52);
  static const amber = Color(0xFFE3A857);
  static const amberDeep = Color(0xFFC98C36);
  static const sage = Color(0xFF6E8B74);
  static const cream = Color(0xFFF7F4EF);
  static const paper = Colors.white;
  static const charcoal = Color(0xFF2B2B28);
  static const muted = Color(0xFF6B6862);
  static const line = Color(0xFFE3DFD5);
}

/// نقاط الكسر والقياسات المستخدمة في التخطيط المتجاوب.
class AppMetrics {
  AppMetrics._();

  static const double mobileBreak = 900;
  static const double maxContent = 1180;
}
