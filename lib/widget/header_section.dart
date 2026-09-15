import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';
import 'content_container.dart';

/// شريط التنقّل العلوي، مع قائمة أفقية على الشاشات الكبيرة
/// وقائمة منسدلة (زر همبرغر) على الجوال.
class HeaderSection extends StatelessWidget {
  final bool isMobile;
  final bool menuOpen;
  final VoidCallback onBurgerTap;

  const HeaderSection({
    super.key,
    required this.isMobile,
    required this.menuOpen,
    required this.onBurgerTap,
  });

  static const links = ['البرامج', 'لماذا مسار', 'آلية الالتحاق', 'المدربون'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cream,
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: ContentContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      'مسار',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: AppColors.ink,
                      ),
                    ),
                    Text(
                      '.',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: AppColors.amberDeep,
                      ),
                    ),
                  ],
                ),
                if (!isMobile)
                  Row(
                    children: links
                        .map(
                          (l) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              l,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                if (!isMobile)
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.ink,
                      side: const BorderSide(color: AppColors.ink, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                else
                  IconButton(
                    onPressed: onBurgerTap,
                    icon: const Icon(Icons.menu, color: AppColors.ink),
                  ),
              ],
            ),
            if (isMobile && menuOpen)
              Column(
                children: links
                    .map(
                      (l) => Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: AppColors.line),
                          ),
                        ),
                        child: Text(
                          l,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
