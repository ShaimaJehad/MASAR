import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';

/// بطاقة شهادة متدربة سابقة، بتخطيط أفقي على الشاشات الكبيرة وعمودي على الجوال.
///
/// ملاحظة تصميم: تعمّدنا استخدام LayoutBuilder وعرض محسوب بدل Expanded/Flexible
/// هون، لأن Expanded يحتاج الأب يوفّر قيد ارتفاع أو عرض محدود على نفس المحور،
/// وإذا انلفّت الصفحة بالكامل بأكثر من طبقة تمرير/التفاف، بينكسر بخطأ
/// "incoming height constraints are unbounded". العرض الصريح آمن دائماً.
class TestimonialSection extends StatelessWidget {
  final bool isMobile;
  const TestimonialSection({super.key, required this.isMobile});

  static const _quoteText =
      'التحقت ببرنامج تطوير الواجهات وأنا لا أعرف شيئاً عن البرمجة، وبعد عشرة أسابيع '
      'كان لدي مشروع كامل عرضته في مقابلات العمل، وحصلت على وظيفتي الأولى خلال شهر من التخرج.';

  @override
  Widget build(BuildContext context) {
    const mark = Text(
      '"',
      style: TextStyle(
        fontSize: 56,
        color: AppColors.amber,
        fontWeight: FontWeight.w800,
      ),
    );

    const quoteBody = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _quoteText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
            height: 1.5,
          ),
        ),
        SizedBox(height: 14),
        Text(
          '— متدربة سابقة، برنامج تطوير الويب والواجهات الأمامية',
          style: TextStyle(color: AppColors.muted, fontSize: 13),
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(14),
      ),
      child: isMobile
          ? const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [mark, SizedBox(height: 12), quoteBody],
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                const markWidth = 40.0;
                const gap = 24.0;
                final quoteWidth = constraints.maxWidth - markWidth - gap;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: markWidth, child: mark),
                    const SizedBox(width: gap),
                    SizedBox(width: quoteWidth, child: quoteBody),
                  ],
                );
              },
            ),
    );
  }
}
