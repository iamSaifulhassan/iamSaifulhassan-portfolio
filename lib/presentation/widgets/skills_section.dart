import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/themes/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 600 && size.width <= 1024;
    final isMobile = size.width <= 600;

    // Responsive paddings and vertical spacing
    final horizontalPadding = isDesktop ? 100.0 : (isTablet ? 40.0 : 12.0);
    final verticalPadding = isDesktop ? 80.0 : (isTablet ? 60.0 : 32.0);
    final sectionSpacing = isDesktop ? 60.0 : (isTablet ? 40.0 : 24.0);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: const BoxDecoration(
        color: AppTheme.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About text section
          FadeInLeft(
            duration: const Duration(milliseconds: 800),
            child: Container(
              padding: EdgeInsets.only(bottom: sectionSpacing),
              child: Text(
                '''I'm passionate about solving complex problems and creating user-friendly applications that make a difference. With a strong background in Flutter and backend technologies, I'm always eager to learn new technologies and take on challenging projects.''',
                style: AppTheme.bodyStyle.copyWith(
                  fontSize: isDesktop ? 16 : (isTablet ? 15 : 13),
                  height: 1.6,
                ),
              ),
            ),
          ),

          // Responsive layout
          LayoutBuilder(
            builder: (context, constraints) {
              if (isDesktop) {
                return _buildDesktopLayout(
                    sectionSpacing, constraints.maxWidth);
              } else {
                return _buildMobileLayout(
                    isMobile, sectionSpacing, constraints.maxWidth);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(double sectionSpacing, double maxWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Technologies I Work With
        Expanded(
          flex: 3,
          child: _buildTechnologiesGrid(maxWidth: maxWidth * 0.55),
        ),
        SizedBox(width: sectionSpacing),
        // Right side - Skills & Technologies pills
        Expanded(
          flex: 2,
          child: _buildSkillsPills(maxWidth: maxWidth * 0.35),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
      bool isMobile, double sectionSpacing, double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSkillsPills(maxWidth: maxWidth),
        SizedBox(height: sectionSpacing),
        _buildTechnologiesGrid(maxWidth: maxWidth),
      ],
    );
  }

  Widget _buildTechnologiesGrid({double? maxWidth}) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technologies I Work With',
            style: AppTheme.subHeadingStyle.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = maxWidth ?? constraints.maxWidth;
              // Responsive pill width
              final pillMaxWidth = width < 400 ? width * 0.95 : 220.0;
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _getTechnologies()
                    .map((tech) => _buildTechPill(tech['name']!, pillMaxWidth))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsPills({double? maxWidth}) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills & Technologies',
            style: AppTheme.subHeadingStyle.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = maxWidth ?? constraints.maxWidth;
              final pillMaxWidth = width < 400 ? width * 0.95 : 180.0;
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _getSkillsList()
                    .map((skill) => _buildSkillPill(skill, pillMaxWidth))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  IconData _getIconForTechOrSkill(String name) {
    switch (name.toLowerCase()) {
      case 'flutter':
        return FontAwesomeIcons.flutter;
      case 'dart':
        return FontAwesomeIcons.code;
      case 'firebase':
        return FontAwesomeIcons.fire;
      case 'bloc':
        return FontAwesomeIcons.cubes;
      case 'java':
        return FontAwesomeIcons.java;
      case 'git':
        return FontAwesomeIcons.gitAlt;
      case 'sql':
        return FontAwesomeIcons.database;
      case 'laravel':
        return FontAwesomeIcons.laravel;
      case 'figma':
        return FontAwesomeIcons.figma;
      case 'android studio':
        return FontAwesomeIcons.android;
      case 'vs code':
        return FontAwesomeIcons.code;
      case 'prototyping':
        return FontAwesomeIcons.draftingCompass;
      case 'ui/ux design':
        return FontAwesomeIcons.paintBrush;
      case 'rest apis':
        return FontAwesomeIcons.server;
      default:
        return FontAwesomeIcons.star;
    }
  }

  IconData _getMaterialIconForSkill(String name) {
    switch (name.toLowerCase()) {
      case 'flutter':
        return FontAwesomeIcons.flutter;
      case 'dart':
        return FontAwesomeIcons.dartLang;
      case 'firebase':
        return FontAwesomeIcons.fire;
      case 'bloc':
        return FontAwesomeIcons.cubes;
      case 'java':
        return FontAwesomeIcons.java;
      case 'git':
        return FontAwesomeIcons.gitAlt;
      case 'sql':
        return FontAwesomeIcons.database;
      case 'laravel':
        return FontAwesomeIcons.laravel;
      case 'figma':
        return FontAwesomeIcons.figma;
      case 'prototyping':
        return FontAwesomeIcons.draftingCompass;
      case 'ui/ux design':
        return FontAwesomeIcons.paintBrush;
      case 'rest apis':
        return FontAwesomeIcons.server;
      default:
        return FontAwesomeIcons.star;
    }
  }

  Widget _buildTechPill(String techName, double maxWidth) {
    final icon = _getIconForTechOrSkill(techName);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: _getTechColor(techName),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: _getTechColor(techName).withOpacity(0.18),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: maxWidth < 120 ? 14 : 18,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                techName,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.bodyStyle.copyWith(
                  fontSize: maxWidth < 120 ? 12 : 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillPill(String skill, double maxWidth) {
    final skillIcon = _getMaterialIconForSkill(skill);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              skillIcon,
              size: maxWidth < 100 ? 12 : 16,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 7),
            Flexible(
              child: Text(
                skill,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.bodyStyle.copyWith(
                  fontSize: maxWidth < 100 ? 11 : 14,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Returns the official brand color for each technology
  Color _getTechColor(String techName) {
    switch (techName.toLowerCase()) {
      case 'flutter':
        return const Color(0xFF02569B); // Flutter blue
      case 'dart':
        return const Color(0xFF0175C2); // Dart blue
      case 'firebase':
        return const Color(0xFFFFCA28); // Firebase yellow
      case 'bloc':
        return const Color(0xFF40B4C4); // Bloc cyan
      case 'git':
        return const Color(0xFFF05033); // Git orange
      case 'figma':
        return const Color(0xFFF24E1E); // Figma orange
      case 'java':
        return const Color(0xFF007396); // Java blue
      case 'sql':
        return const Color(0xFF00618A); // MySQL blue
      case 'laravel':
        return const Color(0xFFFF2D20); // Laravel red
      case 'android studio':
        return const Color(0xFF3DDC84); // Android green
      case 'vs code':
        return const Color(0xFF007ACC); // VS Code blue
      default:
        return AppTheme.primaryColor;
    }
  }

  // Returns the official brand color for each skill
  Color _getSkillColor(String skill) {
    switch (skill.toLowerCase()) {
      case 'flutter':
        return const Color(0xFF02569B);
      case 'dart':
        return const Color(0xFF0175C2);
      case 'bloc':
        return const Color(0xFF40B4C4);
      case 'firebase':
        return const Color(0xFFFFCA28);
      case 'java':
        return const Color(0xFF007396);
      case 'git':
        return const Color(0xFFF05033);
      case 'sql':
        return const Color(0xFF00618A);
      case 'laravel':
        return const Color(0xFFFF2D20);
      case 'figma':
        return const Color(0xFFF24E1E);
      case 'prototyping':
        return const Color(0xFF8E24AA); // Purple
      case 'ui/ux design':
        return const Color(0xFF2962FF); // Blue
      case 'rest apis':
        return const Color(0xFF43A047); // Green
      default:
        return AppTheme.primaryColor;
    }
  }

  List<Map<String, String>> _getTechnologies() {
    return [
      {
        'name': 'Flutter',
        'iconUrl':
            'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
      },
      {
        'name': 'Dart',
        'iconUrl':
            'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg',
      },
      {
        'name': 'Firebase',
        'iconUrl':
            'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg',
      },
      {
        'name': 'Bloc',
        'iconUrl': 'https://bloclibrary.dev/_astro/bloc-logo-small.svg',
      },
      {
        'name': 'Java',
        'iconUrl':
            'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg',
      },
      {
        'name': 'Git',
        'iconUrl':
            'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg',
      },
      {
        'name': 'SQL',
        'iconUrl':
            'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg',
      },
      {
        'name': 'Figma',
        'iconUrl':
            'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/figma/figma-original.svg',
      },
      {
        'name': 'Laravel',
        'iconUrl':
            'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/laravel/laravel-plain.svg',
      },
      {
        'name': 'Android Studio',
        'iconUrl':
            'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/androidstudio/androidstudio-original.svg',
      },
      {
        'name': 'VS Code',
        'iconUrl':
            'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg',
      },
    ];
  }

  List<String> _getSkillsList() {
    return [
      'Flutter',
      'Dart',
      'Bloc',
      'Firebase',
      'Java',
      'Git',
      'SQL',
      'Laravel',
      'Figma',
      'Prototyping',
      'UI/UX Design',
      'REST APIs',
    ];
  }
}
