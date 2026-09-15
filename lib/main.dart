import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

/// نقطة انطلاق تطبيق "مسار" — مركز التدريب المهني والتقني.
void main() => runApp(const MasarApp());

class MasarApp extends StatelessWidget {
  const MasarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مسار — مركز التدريب',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      // فرض اتجاه الكتابة من اليمين لليسار لكامل التطبيق
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F4EF),
        fontFamily:
            'Cairo', // أضف خطوط Almarai/Cairo داخل assets/fonts لمطابقة كاملة
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
