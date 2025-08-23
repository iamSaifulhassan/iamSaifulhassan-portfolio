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
    int tries = 0;
    void tryScroll() {
      BuildContext? context = key.currentContext;
      if (key == _heroKey) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 1200), // smoother
          curve: Curves.easeInOutCubic,
        );
        return;
      }
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 1200), // smoother
          curve: Curves.easeInOutCubic,
          alignment: 0.1,
        );
      } else if (tries < 5) {
        tries++;
        WidgetsBinding.instance.addPostFrameCallback((_) => tryScroll());
      } else {
        // Fallback: jump closer to the section, but not too far, then retry
        double fallbackOffset = 0;
        if (key == _projectsKey) {
          fallbackOffset = _scrollController.position.maxScrollExtent * 0.5;
        } else if (key == _contactKey) {
          fallbackOffset = _scrollController.position.maxScrollExtent * 0.7;
        } else if (key == _educationKey) {
          fallbackOffset = _scrollController.position.maxScrollExtent * 0.6;
        } else if (key == _experienceKey) {
          fallbackOffset = _scrollController.position.maxScrollExtent * 0.3;
        } else if (key == _skillsKey) {
          fallbackOffset = _scrollController.position.maxScrollExtent * 0.2;
        } else if (key == _aboutKey) {
          fallbackOffset = _scrollController.position.maxScrollExtent * 0.1;
        }
        _scrollController
            .animateTo(
          fallbackOffset,
          duration: const Duration(milliseconds: 900), // smoother fallback
          curve: Curves.easeInOutCubic,
        )
            .then((_) {
          tries = 0;
          WidgetsBinding.instance.addPostFrameCallback((_) => tryScroll());
        });
      }
    }

    tryScroll();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollToSectionNotification>(
      onNotification: (notification) {
        if (notification.section == 'projects') {
          _scrollToSection(_projectsKey);
          return true;
        }
        return false;
      },
      child: Scaffold(
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
      ),
    );
  }
}

class ScrollToSectionNotification extends Notification {
  final String section;

  ScrollToSectionNotification(this.section);
}
