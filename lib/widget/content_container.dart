import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';

/// حاوية تحدّ عرض المحتوى بحد أقصى وتتوسّطه أفقياً (مكافئ لـ max-width + margin:auto).
class ContentContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const ContentContainer({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: AppMetrics.maxContent),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
        child: child,
      ),
    );
  }
}

/// غلاف موحّد لأقسام الصفحة ذات الخلفية الفاتحة (مسافات علوية/سفلية ثابتة).
class SectionWrap extends StatelessWidget {
  final Widget child;
  const SectionWrap({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
      child: child,
    );
  }
}
