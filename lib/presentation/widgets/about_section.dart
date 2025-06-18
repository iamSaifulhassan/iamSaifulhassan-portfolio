import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../core/themes/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../../data/repositories/portfolio_repository.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'About Me',
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
          isDesktop
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
          const SizedBox(height: 80),
          _buildStatsSection(isDesktop),
          const SizedBox(height: 80),
          _buildExperienceSection(isDesktop),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildAboutContent(),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: _buildSkillsOverview(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildAboutContent(),
        const SizedBox(height: 40),
        _buildSkillsOverview(),
      ],
    );
  }

  Widget _buildAboutContent() {
    return FadeInLeft(
      duration: const Duration(milliseconds: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.aboutMe,
            style: AppTheme.bodyStyle.copyWith(fontSize: 18, height: 1.8),
          ),
          const SizedBox(height: 30),
          Text(
            'When I\'m not coding, you can find me exploring new technologies, contributing to open-source projects, or sharing my knowledge through technical blogs and community talks.',
            style: AppTheme.bodyStyle.copyWith(fontSize: 16, height: 1.8),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildInfoChip('📍 ${AppConstants.location}'),
              _buildInfoChip('💼 ${AppConstants.experience}'),
              _buildInfoChip('✉️ Available for work'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsOverview() {
    final skills = PortfolioRepository.getSkills().take(6).toList();

    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Skills',
            style: AppTheme.subHeadingStyle.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 30),
          ...skills
              .map((skill) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              skill.name,
                              style: AppTheme.bodyStyle.copyWith(fontSize: 16),
                            ),
                            Text(
                              '${(skill.proficiency * 100).toInt()}%',
                              style: AppTheme.bodyStyle.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: skill.proficiency,
                          backgroundColor: AppTheme.surfaceColor,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppTheme.primaryColor),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: AppTheme.bodyStyle.copyWith(fontSize: 14),
      ),
    );
  }

  Widget _buildStatsSection(bool isDesktop) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1400),
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          gradient: AppTheme.cardGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppTheme.cardShadow,
        ),
        child: isDesktop
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _buildStatItems(),
              )
            : Column(
                children: _buildStatItems()
                    .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: item,
                        ))
                    .toList(),
              ),
      ),
    );
  }

  List<Widget> _buildStatItems() {
    return [
      _buildStatItem('Projects Completed', AppConstants.projectsCompleted),
      _buildStatItem('Happy Clients', AppConstants.happyClients),
      _buildStatItem('Years Experience', AppConstants.experience),
      _buildStatItem('Technologies', '15+'),
    ];
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: AppTheme.headingStyle.copyWith(
            fontSize: 36,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTheme.bodyStyle.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildExperienceSection(bool isDesktop) {
    final experiences = PortfolioRepository.getExperience();

    return FadeInUp(
      duration: const Duration(milliseconds: 1600),
      child: Column(
        children: [
          Text(
            'Professional Experience',
            style: AppTheme.subHeadingStyle.copyWith(fontSize: 32),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ...experiences
              .map((experience) => Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: AppTheme.cardShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    experience.position,
                                    style: AppTheme.subHeadingStyle
                                        .copyWith(fontSize: 20),
                                  ),
                                  Text(
                                    experience.company,
                                    style: AppTheme.bodyStyle.copyWith(
                                      color: AppTheme.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                experience.duration,
                                style: AppTheme.bodyStyle.copyWith(
                                  color: AppTheme.primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          experience.description,
                          style: AppTheme.bodyStyle.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        ...experience.achievements
                            .map((achievement) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        color: AppTheme.primaryColor,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          achievement,
                                          style: AppTheme.bodyStyle
                                              .copyWith(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
