import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';
import 'section_head.dart';

/// نموذج بيانات بسيط يمثّل برنامجاً تدريبياً واحداً.
class ProgramData {
  final String icon;
  final String title;
  final String desc;
  final String duration;
  final String level;

  const ProgramData(
    this.icon,
    this.title,
    this.desc,
    this.duration,
    this.level,
  );
}

/// قسم شبكة البرامج التدريبية، بعمود واحد على الجوال وثلاثة أعمدة على الشاشات الكبيرة.
class ProgramsSection extends StatelessWidget {
  final bool isMobile;
  const ProgramsSection({super.key, required this.isMobile});

  static const items = [
    ProgramData(
      '💻',
      'تطوير الويب والواجهات الأمامية',
      'بناء صفحات ومواقع متجاوبة باستخدام HTML وCSS وجافاسكربت، مع مقدمة في أطر العمل الحديثة.',
      '10 أسابيع',
      'مبتدئ إلى متوسط',
    ),
    ProgramData(
      '🎨',
      'تصميم تجربة وواجهة المستخدم',
      'من البحث حول المستخدم إلى النماذج القابلة للتطبيق، وصولاً إلى تسليم تصميم جاهز للتطوير.',
      '8 أسابيع',
      'مبتدئ',
    ),
    ProgramData(
      '📱',
      'تطوير تطبيقات الجوال بفلاتر',
      'بناء تطبيق جوال كامل بلغة Dart وإطار Flutter، بواجهة واحدة تعمل على أندرويد و iOS.',
      '12 أسبوعاً',
      'متوسط',
    ),
    ProgramData(
      '📊',
      'التسويق الرقمي والمحتوى',
      'استراتيجيات الإعلانات الممولة، تحليل البيانات، وبناء محتوى يحقق نتائج قابلة للقياس.',
      '6 أسابيع',
      'مبتدئ',
    ),
    ProgramData(
      '🗄️',
      'إدارة قواعد البيانات والخوادم',
      'تصميم قواعد بيانات علائقية، وإدارة خوادم تطبيقات جاهزة للإنتاج الفعلي.',
      '9 أسابيع',
      'متوسط',
    ),
    ProgramData(
      '🤝',
      'إدارة المشاريع التقنية',
      'تخطيط وتنفيذ مشاريع برمجية باستخدام منهجيات Agile وأدوات التتبع الحديثة.',
      '7 أسابيع',
      'متوسط إلى متقدم',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cols = isMobile ? 1 : 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHead(
          title: 'برامج مصمَّمة على احتياج سوق العمل',
          subtitle:
              'كل برنامج يجمع بين أساس نظري مركّز، وتطبيق عملي مباشر على مشاريع حقيقية.',
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            mainAxisExtent: 240,
          ),
          itemBuilder: (context, i) => ProgramCard(data: items[i]),
        ),
      ],
    );
  }
}

/// بطاقة عرض برنامج تدريبي واحد.
class ProgramCard extends StatelessWidget {
  final ProgramData data;
  const ProgramCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.paper,
        border: Border.all(color: AppColors.line),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(data.icon, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 16),
          Text(
            data.title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              data.desc,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
          const Divider(color: AppColors.line),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.duration,
                style: const TextStyle(color: AppColors.muted, fontSize: 12),
              ),
              Text(
                data.level,
                style: const TextStyle(color: AppColors.muted, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
