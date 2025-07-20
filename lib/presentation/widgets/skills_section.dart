import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../core/themes/app_theme.dart';
import '../../data/repositories/portfolio_repository.dart';
import '../../data/models/skill.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 600 && size.width <= 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : (isTablet ? 50 : 20),
        vertical: 100,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.backgroundColor, AppTheme.surfaceColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'Skills & Technologies',
              style:
                  AppTheme.headingStyle.copyWith(fontSize: isDesktop ? 48 : 36),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          FadeInDown(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              width: 100,
              height: 4,
              decoration: const BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ),
          const SizedBox(height: 60),
          _buildSkillsGrid(isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(bool isDesktop, bool isTablet) {
    final skills = PortfolioRepository.getSkills();
    final crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);

    return FadeInUp(
      duration: const Duration(milliseconds: 1200),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: 1.2,
        ),
        itemCount: skills.length,
        itemBuilder: (context, index) {
          return _buildSkillCard(skills[index], index);
        },
      ),
    );
  }

  Widget _buildSkillCard(Skill skill, int index) {
    return FadeInUp(
      duration: Duration(milliseconds: 1200 + (index * 100)),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: AppTheme.cardGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppTheme.cardShadow,
          border: Border.all(
            color: AppTheme.primaryColor.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Skill Icon (placeholder for now)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                _getSkillIcon(skill.name),
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              skill.name,
              style: AppTheme.subHeadingStyle.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              skill.category,
              style: AppTheme.bodyStyle.copyWith(
                fontSize: 14,
                color: AppTheme.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              skill.description,              style: AppTheme.bodyStyle.copyWith(fontSize: 13),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getSkillIcon(String skillName) {
    switch (skillName.toLowerCase()) {
      case 'flutter':
        return Icons.phone_android;
      case 'dart':
        return Icons.code;
      case 'firebase':
        return Icons.cloud;
      case 'git':
        return Icons.source;
      case 'rest api':
        return Icons.api;
      case 'ui/ux design':
        return Icons.design_services;
      default:
        return Icons.star;
    }
  }
}
