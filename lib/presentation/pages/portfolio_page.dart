import 'package:flutter/material.dart';
import '../../core/themes/app_theme.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/education_certification_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/custom_app_bar.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Custom App Bar
          CustomAppBar(
            onNavigate: _scrollToSection,
            heroKey: _heroKey,
            aboutKey: _aboutKey,
            experienceKey: _experienceKey,
            skillsKey: _skillsKey,
            projectsKey: _projectsKey,
            educationKey: _educationKey,
            contactKey: _contactKey,
          ),
          // Content
          SliverList(
            delegate: SliverChildListDelegate([
              HeroSection(key: _heroKey),
              AboutSection(key: _aboutKey),
              ExperienceSection(key: _experienceKey),
              SkillsSection(key: _skillsKey),
              ProjectsSection(key: _projectsKey),
              EducationCertificationSection(key: _educationKey),
              ContactSection(key: _contactKey),
              const SizedBox(height: 50),
            ]),
          ),
        ],
      ),
    );
  }
}
