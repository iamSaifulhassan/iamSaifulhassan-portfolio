import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/themes/app_theme.dart';

class EducationCertificationSection extends StatelessWidget {
  const EducationCertificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1024;
        final isTablet =
            constraints.maxWidth > 600 && constraints.maxWidth <= 1024;
        final horizontalPadding = isDesktop ? 100.0 : (isTablet ? 50.0 : 10.0);
        final verticalPadding = isDesktop ? 100.0 : (isTablet ? 60.0 : 30.0);
        final headingFontSize = isDesktop ? 48.0 : (isTablet ? 40.0 : 28.0);
        final subHeadingFontSize = isDesktop ? 32.0 : (isTablet ? 28.0 : 22.0);

        return Container(
          color: AppTheme.surfaceColor,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'Education & Certifications',
                  style: AppTheme.headingStyle.copyWith(
                    fontSize: headingFontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              FadeInDown(
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  width: isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0),
                  height: 4,
                  decoration: const BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ),
              SizedBox(height: isDesktop ? 60 : (isTablet ? 40 : 20)),
              isDesktop
                  ? _buildDesktopLayout(subHeadingFontSize)
                  : _buildMobileLayout(subHeadingFontSize),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(double subHeadingFontSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildEducationSection(subHeadingFontSize)),
        const SizedBox(width: 50),
        Expanded(child: _buildCertificationSection(subHeadingFontSize)),
      ],
    );
  }

  Widget _buildMobileLayout(double subHeadingFontSize) {
    return Column(
      children: [
        _buildEducationSection(subHeadingFontSize),
        const SizedBox(height: 30),
        _buildCertificationSection(subHeadingFontSize),
      ],
    );
  }

  Widget _buildEducationSection(double subHeadingFontSize) {
    final educations = [
      {
        'degree': 'Bachelor of Science in Software Engineering',
        'institution': 'Comsats University Islamabad, Wah Campus',
        'duration': '2022 - Present',
        'gpa': 'CGPA: 3.64/4.00',
        'description':
            'Specialized in Software Engineering and Mobile Application Development',
        'achievements': [
          'Dean\'s List (3 semesters)',
          'Final Year Project: Flutter E-commerce App',
          'Programming Contest Participant',
        ],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInLeft(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Education',
            style: AppTheme.subHeadingStyle.copyWith(
              fontSize: subHeadingFontSize,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 30),
        ...educations.asMap().entries.map((entry) {
          final index = entry.key;
          final education = entry.value;
          final isLast = index == educations.length - 1;
          return FadeInLeft(
            duration: Duration(milliseconds: 1400 + (index * 200)),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Timeline dot and line
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
                  // Education card
                  Expanded(
                    child: _buildEducationCard(education),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildCertificationSection(double subHeadingFontSize) {
    final certifications = [
      {
        'title': 'IBM Certified Flutter Developer',
        'issuer': 'IBM',
        'date': 'June 2024- Present',
        'credentialId': 'Ongoing',
        'url': 'https://developers.google.com/certification/flutter',
        'skills': [
          'Flutter',
          'Dart',
          'Mobile Development',
          'State Management',
          'Firebase'
        ],
      },
      {
        'title': 'Database for Developers: Foundations',
        'issuer': 'Oracle Corporation',
        'date': 'May 2023',
        'credentialId': '571065',
        'url':
            'https://drive.google.com/file/d/1k0JdU-Xo6rSvsQa40AJpoKipWV_VwVil/view?usp=drive_link',
        'skills': ['Oracle', 'Databases', 'CRUD Operations', 'SQL'],
      },
      {
        'title': 'Database for Developers: Next Level',
        'issuer': 'Oracle Corporation',
        'date': 'June 2024 - Present',
        'credentialId': '571065',
        'url':
            'https://drive.google.com/file/d/17o3JekT2jZrT7F_ggY3j_3pnkgJn06kK/view?usp=drive_link',
        'skills': [
          'Structured Databases',
          'Normalization',
          'Transaction Management',
          'Recovery & Backup'
        ],
      },
      {
        'title': 'Amazon Cloud Practitioner (AWS)',
        'issuer': 'Amazon Web Services',
        'date': 'August 2025',
        'credentialId': 'AWS-CP-123456',
        'url': 'https://www.aws.training/Certification',
        'skills': [
          'AWS Cloud',
          'Cloud Computing',
          'Security',
          'Billing & Pricing',
          'Cloud Architecture'
        ],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Certifications',
          style: AppTheme.subHeadingStyle.copyWith(
            fontSize: subHeadingFontSize,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 30),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: Column(
            key: ValueKey(certifications.length),
            children: certifications
                .map((certification) => _buildCertificationCard(certification))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationCard(Map<String, dynamic> education) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  education['degree'],
                  style: AppTheme.subHeadingStyle.copyWith(
                    fontSize: 20,
                    color: AppTheme.primaryColor,
                  ),
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
                  education['duration'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            education['institution'],
            style: AppTheme.bodyStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            education['gpa'],
            style: AppTheme.bodyStyle.copyWith(
              fontSize: 14,
              color: AppTheme.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            education['description'],
            style: AppTheme.bodyStyle.copyWith(
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Achievements:',
                style: AppTheme.bodyStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              ...education['achievements'].map<Widget>((achievement) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          achievement,
                          style: AppTheme.bodyStyle.copyWith(
                            fontSize: 14,
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
    );
  }

  Widget _buildCertificationCard(Map<String, dynamic> certification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  certification['title'],
                  style: AppTheme.bodyStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _launchURL(certification['url']),
                child: const Icon(
                  Icons.open_in_new,
                  size: 20,
                  color: AppTheme.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                certification['issuer'],
                style: AppTheme.bodyStyle.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                certification['date'],
                style: AppTheme.bodyStyle.copyWith(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'ID: ${certification['credentialId']}',
            style: AppTheme.bodyStyle.copyWith(
              fontSize: 12,
              fontFamily: 'monospace',
              color: AppTheme.textHint,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: certification['skills'].map<Widget>((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
