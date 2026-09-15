import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';
import 'section_head.dart';

/// قسم آلية الالتحاق: أربع خطوات مرقّمة بترتيب فعلي (تسلسل حقيقي، لذا يستخدم الترقيم).
class ProcessSection extends StatelessWidget {
  final bool isMobile;
  const ProcessSection({super.key, required this.isMobile});

  static const steps = [
    (
      '01',
      'اختر البرنامج',
      'تصفّح البرامج المتاحة، واقرأ محتوى كل مسار ومتطلباته قبل التسجيل.',
    ),
    (
      '02',
      'مقابلة تقييم قصيرة',
      'مكالمة عشرين دقيقة لفهم مستواك الحالي وأهدافك من التدريب.',
    ),
    (
      '03',
      'تثبيت مكانك',
      'إتمام التسجيل وحجز مقعدك ضمن المجموعة قبل بدء الدفعة.',
    ),
    (
      '04',
      'بدء التدريب',
      'أول جلسة مباشرة مع المجموعة والمدرب، وخطة أسبوعية واضحة.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cols = isMobile ? 1 : 4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHead(
          title: 'آلية الالتحاق ببرنامج تدريبي',
          subtitle:
              'أربع خطوات واضحة، من التسجيل الأول حتى بداية أول جلسة تدريب.',
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: steps.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            mainAxisExtent: 150,
          ),
          itemBuilder: (context, i) {
            final s = steps[i];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.$1,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: AppColors.line,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  s.$2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  s.$3,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 12.5,
                    height: 1.5,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
