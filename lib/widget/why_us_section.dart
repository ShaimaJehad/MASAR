import 'package:flutter/material.dart';
import 'content_container.dart';
import 'section_head.dart';
import 'package:traning/theme/app_color.dart';

/// قسم "لماذا مسار" بخلفية داكنة وشبكة مزايا (4 أعمدة على الشاشات الكبيرة، عمود واحد على الجوال).
class WhyUsSection extends StatelessWidget {
  final bool isMobile;
  const WhyUsSection({super.key, required this.isMobile});

  static const items = [
    (
      'مباشر',
      'جلسات حية مع مدربين يعملون فعلياً في الشركات، وليست تسجيلات جاهزة.',
    ),
    (
      'عملي',
      'كل أسبوع ينتهي بتسليم فعلي: صفحة، تصميم، أو جزء من مشروع التخرج.',
    ),
    ('صغير', 'مجموعات لا تتجاوز 15 متدرباً، لضمان متابعة كل شخص على حدة.'),
    (
      'موصول',
      'دعم توظيف بعد التخرج، وربط مباشر بشركاء التوظيف في السوق المحلي.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cols = isMobile ? 1 : 4;
    return Container(
      color: AppColors.ink,
      child: ContentContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHead(
              light: true,
              title: 'ما الذي يميز التدريب في مسار',
              subtitle:
                  'لسنا منصة فيديوهات مسجّلة؛ نحن مساحة تدريب مباشر بمتابعة فردية حتى التوظيف.',
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                mainAxisExtent: 170,
              ),
              itemBuilder: (context, i) => Container(
                color: AppColors.ink,
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[i].$1,
                      style: const TextStyle(
                        color: AppColors.amber,
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      items[i].$2,
                      style: const TextStyle(
                        color: Color(0xFFC7CEE2),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
