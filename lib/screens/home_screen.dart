import 'package:flutter/material.dart';
import 'package:traning/theme/app_color.dart';
import 'package:traning/widget/content_container.dart';
import 'package:traning/widget/cta_banner_section.dart';
import 'package:traning/widget/footer_section.dart';
import 'package:traning/widget/header_section.dart';
import 'package:traning/widget/hero_section.dart';
import 'package:traning/widget/instructors_section.dart';
import 'package:traning/widget/process_section.dart';
import 'package:traning/widget/programs_section.dart';
import 'package:traning/widget/testimonial_section.dart';
import 'package:traning/widget/why_us_section.dart';

/// شاشة صفحة الهبوط الرئيسية — تجمّع كل الأقسام بترتيبها،
/// وتحدّد التخطيط المتجاوب (جوال/سطح مكتب) عبر LayoutBuilder.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool menuOpen = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < AppMetrics.mobileBreak;

        return Scaffold(
          backgroundColor: AppColors.cream,
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderSection(
                  isMobile: isMobile,
                  menuOpen: menuOpen,
                  onBurgerTap: () => setState(() => menuOpen = !menuOpen),
                ),
                HeroSection(isMobile: isMobile),
                SectionWrap(child: ProgramsSection(isMobile: isMobile)),
                WhyUsSection(isMobile: isMobile),
                SectionWrap(child: ProcessSection(isMobile: isMobile)),
                SectionWrap(child: InstructorsSection(isMobile: isMobile)),
                SectionWrap(child: TestimonialSection(isMobile: isMobile)),
                SectionWrap(child: CtaBannerSection(isMobile: isMobile)),
                FooterSection(isMobile: isMobile),
              ],
            ),
          ),
        );
      },
    );
  }
}
