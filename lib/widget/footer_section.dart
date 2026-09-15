import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';
import 'content_container.dart';

/// تذييل الصفحة: أعمدة روابط تتكدّس عمودياً على الجوال، وسطر حقوق النشر.
class FooterSection extends StatelessWidget {
  final bool isMobile;
  const FooterSection({super.key, required this.isMobile});

  Widget _linkColumn(String title, List<String> lines) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          ...lines.map(
            (l) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                l,
                style: const TextStyle(color: Color(0xFFB9C2DA), fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final columns = [
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'مسار',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'مركز تدريب مهني وتقني يبني مهارات عملية جاهزة لسوق العمل.',
              style: TextStyle(color: Color(0xFFB9C2DA), fontSize: 13),
            ),
          ],
        ),
      ),
      _linkColumn('البرامج', [
        'تطوير الويب',
        'تطبيقات فلاتر',
        'تصميم UX/UI',
        'التسويق الرقمي',
      ]),
      _linkColumn('المركز', [
        'عن مسار',
        'المدربون',
        'قصص النجاح',
        'تواصل معنا',
      ]),
      _linkColumn('تواصل', [
        'نابلس، فلسطين',
        'info@masar-training.example',
        '09-000-0000',
      ]),
    ];

    return Container(
      color: AppColors.ink,
      child: ContentContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        child: Column(
          children: [
            isMobile
                ? Column(
                    children: [
                      for (final c in columns)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 28),
                          child: c,
                        ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: columns,
                  ),
            const Divider(color: Color(0x33FFFFFF), height: 48),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 8,
              children: const [
                Text(
                  '© 2026 مركز مسار للتدريب. جميع الحقوق محفوظة.',
                  style: TextStyle(color: Color(0xFFB9C2DA), fontSize: 12),
                ),
                Text(
                  'الشروط والأحكام · الخصوصية',
                  style: TextStyle(color: Color(0xFFB9C2DA), fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
