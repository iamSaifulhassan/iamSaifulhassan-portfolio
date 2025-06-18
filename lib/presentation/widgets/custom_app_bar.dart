import 'package:flutter/material.dart';
import '../../core/themes/app_theme.dart';

class CustomAppBar extends StatelessWidget {
  final Function(GlobalKey) onNavigate;
  final GlobalKey heroKey;
  final GlobalKey aboutKey;
  final GlobalKey experienceKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey educationKey;
  final GlobalKey contactKey;

  const CustomAppBar({
    super.key,
    required this.onNavigate,
    required this.heroKey,
    required this.aboutKey,
    required this.experienceKey,
    required this.skillsKey,
    required this.projectsKey,
    required this.educationKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: AppTheme.backgroundColor.withOpacity(0.95),
      elevation: 0,
      title: Text(
        'Portfolio',
        style: AppTheme.subHeadingStyle.copyWith(fontSize: 20),
      ),
      actions: [
        if (MediaQuery.of(context).size.width > 800) ...[
          _buildNavButton('Home', () => onNavigate(heroKey)),
          _buildNavButton('About', () => onNavigate(aboutKey)),
          _buildNavButton('Experience', () => onNavigate(experienceKey)),
          _buildNavButton('Skills', () => onNavigate(skillsKey)),
          _buildNavButton('Projects', () => onNavigate(projectsKey)),
          _buildNavButton('Education', () => onNavigate(educationKey)),
          _buildNavButton('Contact', () => onNavigate(contactKey)),
        ] else ...[
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
            onSelected: (value) {
              switch (value) {
                case 'Home':
                  onNavigate(heroKey);
                  break;
                case 'About':
                  onNavigate(aboutKey);
                  break;
                case 'Experience':
                  onNavigate(experienceKey);
                  break;
                case 'Skills':
                  onNavigate(skillsKey);
                  break;
                case 'Projects':
                  onNavigate(projectsKey);
                  break;
                case 'Education':
                  onNavigate(educationKey);
                  break;
                case 'Contact':
                  onNavigate(contactKey);
                  break;
              }
            },
            itemBuilder: (context) => [
              _buildPopupMenuItem('Home'),
              _buildPopupMenuItem('About'),
              _buildPopupMenuItem('Experience'),
              _buildPopupMenuItem('Skills'),
              _buildPopupMenuItem('Projects'),
              _buildPopupMenuItem('Education'),
              _buildPopupMenuItem('Contact'),
            ],
          ),
        ],
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildNavButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String text) {
    return PopupMenuItem<String>(
      value: text,
      child: Text(text),
    );
  }
}
