import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/themes/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../../data/repositories/portfolio_repository.dart';

class AboutSection extends StatelessWidget {
  Widget _buildCertWithName(IconData icon, Color color, String name) {
    return Column(
      children: [
        name == 'JP Morgan'
            ? Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/jpmorgan.png',
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                ),
              )
            : name == 'Oracle'
                ? Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/oracle.png',
                      width: 28,
                      height: 28,
                      fit: BoxFit.contain,
                    ),
                  )
                : name == 'Mindluster'
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/Mindluster.png',
                          width: 28,
                          height: 28,
                          fit: BoxFit.contain,
                        ),
                      )
                    : _buildCertIcon(icon, color),
        const SizedBox(height: 4),
        Text(
          name,
          style: AppTheme.bodyStyle.copyWith(fontSize: 13, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildCertIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, size: 28, color: color),
    );
  }

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
          // const SizedBox(height: 80),
          // _buildExperienceSection(isDesktop),
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
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildAboutContent(),
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

  Widget _buildStatsSection(bool isDesktop) {
    return Column(
      children: [
        FadeInUp(
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
        ),
        const SizedBox(height: 24),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Certified by:',
                  style: AppTheme.bodyStyle.copyWith(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildCertWithName(
                    FontAwesomeIcons.aws, const Color(0xFFFF9900), 'AWS'),
                const SizedBox(width: 18),
                _buildCertWithName(FontAwesomeIcons.database,
                    const Color(0xFFF80000), 'Oracle'),
                const SizedBox(width: 18),
                _buildCertWithName(FontAwesomeIcons.hackerrank,
                    const Color(0xFF2EC866), 'Hackerrank'),
                const SizedBox(width: 18),
                _buildCertWithName(FontAwesomeIcons.buildingColumns,
                    const Color(0xFF0071C5), 'JP Morgan'),
                const SizedBox(width: 18),
                _buildCertWithName(
                    Icons.school, const Color(0xFF1E90FF), 'Mindluster'),
              ],
            ),
          ],
        ),
      ],
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
          ...List.generate(experiences.length, (index) {
            final experience = experiences[index];
            final isLast = index == experiences.length - 1;
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Timeline dot and line
                  const SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 32,
                    child: Column(
                      children: [
                        // Dot
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.primaryColor.withOpacity(0.2),
                              width: 4,
                            ),
                          ),
                        ),
                        // Line (except for last item)
                        if (!isLast)
                          Expanded(
                            child: Container(
                              width: 4,
                              color: AppTheme.primaryColor.withOpacity(0.3),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Experience card
                  Expanded(
                    child: Container(
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
                                  )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
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
}
