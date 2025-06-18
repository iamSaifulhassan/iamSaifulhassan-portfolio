import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../core/themes/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
              'Work Experience',
              style: AppTheme.headingStyle.copyWith(
                fontSize: isDesktop ? 48 : 36,
              ),
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
          _buildTimelineView(isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildTimelineView(bool isDesktop, bool isTablet) {
    final experiences = [
      {
        'title': 'Senior Flutter Developer',
        'company': 'TechCorp Solutions',
        'duration': '2023 - Present',
        'description':
            'Leading mobile app development team, architecting scalable Flutter applications, and mentoring junior developers.',
        'achievements': [
          'Increased app performance by 40%',
          'Led team of 5 developers',
          'Delivered 10+ production apps',
        ],
      },
      {
        'title': 'Flutter Developer',
        'company': 'InnovateTech',
        'duration': '2022 - 2023',
        'description':
            'Developed cross-platform mobile applications using Flutter, integrated REST APIs, and implemented clean architecture.',
        'achievements': [
          'Built 8+ mobile applications',
          'Reduced development time by 30%',
          'Implemented CI/CD pipelines',
        ],
      },
      {
        'title': 'Mobile App Developer',
        'company': 'StartupXYZ',
        'duration': '2021 - 2022',
        'description':
            'Created native Android apps and transitioned to Flutter development. Worked on MVP products and user-centric designs.',
        'achievements': [
          'Launched 3 successful MVPs',
          'Achieved 4.5+ app store ratings',
          'Integrated payment gateways',
        ],
      },
    ];

    return Column(
      children: experiences.asMap().entries.map((entry) {
        final index = entry.key;
        final experience = entry.value;
        return FadeInUp(
          duration: Duration(milliseconds: 1000 + (index * 200)),
          child: _buildExperienceCard(
            experience,
            isDesktop,
            isTablet,
            index,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildExperienceCard(
    Map<String, dynamic> experience,
    bool isDesktop,
    bool isTablet,
    int index,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  shape: BoxShape.circle,
                ),
              ),
              if (index < 2)
                Container(
                  width: 2,
                  height: 100,
                  color: AppTheme.primaryColor.withOpacity(0.3),
                ),
            ],
          ),
          const SizedBox(width: 30),
          // Content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
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
                              experience['title'],
                              style: AppTheme.subHeadingStyle.copyWith(
                                fontSize: isDesktop ? 24 : 20,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              experience['company'],
                              style: AppTheme.bodyStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          experience['duration'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    experience['description'],
                    style: AppTheme.bodyStyle.copyWith(
                      height: 1.6,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Key Achievements:',
                        style: AppTheme.bodyStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...experience['achievements'].map<Widget>((achievement) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                size: 16,
                                color: AppTheme.primaryColor,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  achievement,
                                  style: AppTheme.bodyStyle.copyWith(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
