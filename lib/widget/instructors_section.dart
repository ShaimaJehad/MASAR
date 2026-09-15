import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';
import 'section_head.dart';

/// قسم يعرض المدربين الرئيسيين بصورة رمزية واسم وتخصص.
class InstructorsSection extends StatelessWidget {
  final bool isMobile;
  const InstructorsSection({super.key, required this.isMobile});

  static const people = [
    ('ليان أبو غزالة', 'مطوّرة واجهات أمامية'),
    ('عمر الحوراني', 'مصمم تجربة مستخدم'),
    ('سارة دويكات', 'مطوّرة تطبيقات Flutter'),
  ];

  @override
  Widget build(BuildContext context) {
    final row = Wrap(
      spacing: 40,
      runSpacing: 32,
      alignment: WrapAlignment.center,
      children: people.map((p) {
        return SizedBox(
          width: isMobile ? double.infinity : 300,
          child: Column(
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColors.sage, AppColors.ink],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                p.$1,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: AppColors.ink,
                ),
              ),
              Text(
                p.$2,
                style: const TextStyle(
                  color: AppColors.sage,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.5,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHead(
          title: 'يدرّبك أشخاص يعملون في المجال فعلياً',
          subtitle:
              'كل مدرب في مسار يمارس عمله في شركة أو مشروع حقيقي إلى جانب التدريب.',
        ),
        Center(child: row),
      ],
    );
  }
}
