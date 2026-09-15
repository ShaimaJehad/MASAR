import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';

/// عنوان قسم موحّد (عنوان رئيسي + وصف قصير)، مع دعم النمط الفاتح على خلفية داكنة.
class SectionHead extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool light;

  const SectionHead({
    super.key,
    required this.title,
    required this.subtitle,
    this.light = false,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor = light ? Colors.white : AppColors.ink;
    final subColor = light ? const Color(0xFFB9C2DA) : AppColors.muted;

    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 15.5, color: subColor, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}
