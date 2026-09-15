import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';

/// شريط دعوة لإجراء بخلفية متدرجة (كهرمانية)، مع زر حجز.
class CtaBannerSection extends StatelessWidget {
  final bool isMobile;
  const CtaBannerSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    const title = Expanded(
      child: Text(
        'الدفعة القادمة تبدأ خلال أسبوعين، والمقاعد محدودة',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: AppColors.ink,
        ),
      ),
    );
    final button = ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.ink,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: const Text(
        'احجز مقعدك الآن',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.amber, AppColors.amberDeep],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: isMobile
          ? Column(
              children: [
                const Align(alignment: Alignment.centerRight, child: title),
                const SizedBox(height: 20),
                button,
              ],
            )
          : Row(children: [title, const SizedBox(width: 20), button]),
    );
  }
}
