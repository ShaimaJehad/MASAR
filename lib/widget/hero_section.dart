import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';
import 'content_container.dart';

/// قسم الهيرو: عنوان تعريفي + إحصائيات + بطاقة دورة توضّح موضوع الصفحة.
class HeroSection extends StatelessWidget {
  final bool isMobile;
  const HeroSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final textCol = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'مركز مسار للتدريب المهني والتقني',
          style: TextStyle(
            color: AppColors.sage,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'مهارة حقيقية تبني مسارك المهني، خطوة بخطوة',
          style: TextStyle(
            fontSize: isMobile ? 30 : 42,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'برامج تدريبية عملية في البرمجة، التصميم، والتسويق الرقمي، يقودها مدربون '
          'يعملون في المجال، وتنتهي بمشروع حقيقي تضيفه إلى ملفك المهني.',
          style: TextStyle(fontSize: 16, color: AppColors.muted, height: 1.7),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.amber,
                foregroundColor: AppColors.ink,
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'استعرض البرامج',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.ink,
                side: const BorderSide(color: AppColors.ink, width: 2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'كيف يعمل التسجيل',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Divider(color: AppColors.line),
        const SizedBox(height: 20),
        Wrap(
          spacing: 40,
          runSpacing: 16,
          children: const [
            HeroStat(value: '2400+', label: 'خريج توظّف خلال ستة أشهر'),
            HeroStat(value: '18', label: 'برنامج تدريبي متخصص'),
            HeroStat(value: '94٪', label: 'نسبة إكمال الدورات'),
          ],
        ),
      ],
    );

    const mock = CourseMock();

    return Container(
      color: AppColors.cream,
      child: ContentContainer(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: isMobile ? 40 : 72,
        ),
        // ملاحظة: ما بنستخدم IntrinsicHeight هون — Row بتاخذ ارتفاعها
        // تلقائياً من أطول عنصر داخلها، وهذا كافٍ وأكثر أماناً.
        child: isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [textCol, const SizedBox(height: 40), mock],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 11, child: textCol),
                  const SizedBox(width: 56),
                  Expanded(flex: 9, child: mock),
                ],
              ),
      ),
    );
  }
}

/// بطاقة إحصائية صغيرة (رقم + وصف) تُستخدم أسفل الهيرو.
class HeroStat extends StatelessWidget {
  final String value;
  final String label;
  const HeroStat({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: AppColors.muted, fontSize: 13),
        ),
      ],
    );
  }
}

/// بطاقة تحاكي شاشة تقدّم دورة تدريبية — تجسّد موضوع الصفحة داخل الهيرو.
class CourseMock extends StatelessWidget {
  const CourseMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.ink,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'قيد التقدم',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
              const Text(
                'الأسبوع 5 من 8',
                style: TextStyle(color: Color(0xFFB9C2DA), fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'تطوير واجهات الويب التفاعلية',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'مسار عملي — 8 أسابيع، مشروع تخرج فعلي',
            style: TextStyle(color: Color(0xFFB9C2DA), fontSize: 13),
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'إنجاز المسار',
                style: TextStyle(color: Color(0xFFB9C2DA), fontSize: 12),
              ),
              Text(
                '68٪',
                style: TextStyle(color: Color(0xFFB9C2DA), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.68,
              minHeight: 8,
              backgroundColor: Colors.white.withOpacity(.14),
              valueColor: const AlwaysStoppedAnimation(AppColors.amber),
            ),
          ),
          const SizedBox(height: 20),
          const MockModule(title: 'أساسيات HTML وCSS', done: true),
          const MockModule(title: 'تصميم متجاوب وقوالب', done: true),
          const MockModule(title: 'جافاسكربت وتفاعل الواجهة', done: false),
          const MockModule(title: 'مشروع التخرج والعرض النهائي', done: false),
        ],
      ),
    );
  }
}

/// سطر يمثّل وحدة تدريبية واحدة ضمن بطاقة الدورة (منجزة أو قيد الانتظار).
class MockModule extends StatelessWidget {
  final String title;
  final bool done;
  const MockModule({super.key, required this.title, required this.done});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.06),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: done ? AppColors.sage : Colors.white.withOpacity(.3),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
