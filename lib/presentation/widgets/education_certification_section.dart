import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../core/themes/app_theme.dart';
import '../../data/repositories/portfolio_repository.dart';
import 'responsive_helper.dart';
import 'education_card.dart';
import 'certification_card.dart';

class EducationCertificationSection extends StatelessWidget {
  const EducationCertificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isDesktop = ResponsiveHelper.isDesktop(width);
        final isTablet = ResponsiveHelper.isTablet(width);
        final horizontalPadding = isDesktop ? 100.0 : (isTablet ? 50.0 : 20.0);
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
                duration: const Duration(milliseconds: 800),
                delay: const Duration(milliseconds: 100),
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
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildEducationSection(subHeadingFontSize)),
            const SizedBox(width: 50),
            Expanded(child: _buildCertificationSection(subHeadingFontSize)),
          ],
        ),
        const SizedBox(height: 60),
        _buildSimulatedJobsSection(subHeadingFontSize),
      ],
    );
  }

  Widget _buildMobileLayout(double subHeadingFontSize) {
    return Column(
      children: [
        _buildEducationSection(subHeadingFontSize),
        const SizedBox(height: 30),
        _buildCertificationSection(subHeadingFontSize),
        const SizedBox(height: 40),
        _buildSimulatedJobsSection(subHeadingFontSize),
      ],
    );
  }

  Widget _buildEducationSection(double subHeadingFontSize) {
    final educations = PortfolioRepository.getEducation();

    return FadeInLeft(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: AppTheme.subHeadingStyle.copyWith(
              fontSize: subHeadingFontSize,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 30),
          ...educations.asMap().entries.map((entry) {
            final index = entry.key;
            final education = entry.value;
            final isLast = index == educations.length - 1;
            return FadeInLeft(
              duration: const Duration(milliseconds: 800),
              delay: Duration(milliseconds: 300 + (index * 100)),
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
                      child: EducationCard(education: education),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildCertificationSection(double subHeadingFontSize) {
    // Keeping certifications hardcoded here as they are not in repository yet,
    // or we can move them to repository if preferred.
    // For now, using the list from the original file but cleaner.
    final certifications = [
      {
        'title': 'Flutter Rest Api',
        'issuer': 'Mindluster.com',
        'date': 'August 2025',
        'credentialId': '',
        'url':
            'https://drive.google.com/file/d/192CiFFlMqbHl9V1ykm9Ls0yLbZQ-Rabk/view',
        'skills': [
          'Flutter',
          'Dart',
          'Mobile Development',
          'State Management',
          'Firebase',
          'Api'
        ],
      },
      {
        'title': 'Database for Developers: Foundations',
        'issuer': 'Oracle Corporation',
        'date': 'April 2025',
        'credentialId': '571065',
        'url':
            'https://drive.google.com/file/d/1k0JdU-Xo6rSvsQa40AJpoKipWV_VwVil/view?usp=drive_link',
        'skills': ['Oracle', 'Databases', 'CRUD Operations', 'SQL'],
      },
      {
        'title': 'Database for Developers: Next Level',
        'issuer': 'Oracle Corporation',
        'date': 'Feb 2025',
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
        'credentialId': '',
        'url': 'https://drive.google.com/file/d/YOUR_AWS_CERT_ID/view',
        'skills': [
          'AWS Cloud',
          'Cloud Computing',
          'Security',
          'Billing & Pricing',
          'Cloud Architecture'
        ],
      },
      {
        'title': 'Software Engineering Intern',
        'issuer': 'HackerRank',
        'date': '2025',
        'credentialId': '',
        'url': 'https://www.hackerrank.com/certificates/5d22001c29b2',
        'skills': [
          'Problem Solving',
          'Data Structures',
          'Algorithms',
          'Software Engineering',
        ],
      },
    ];

    return FadeInRight(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 200),
      child: Column(
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
                  .map((certification) =>
                      CertificationCard(certification: certification))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimulatedJobsSection(double subHeadingFontSize) {
    final jobs = [
      {
        'role': 'Software Engineering Job Simulation',
        'company': 'JP Morgan Chase & Co.',
        'period': '2025',
        'type': 'Job Simulation',
        'description':
            'Completed a virtual internship simulation focused on software engineering practices at JP Morgan Chase. Worked on real-world inspired tasks including interface setup, data feeds, and data visualization using industry tools.',
        'skills': [
          'Python',
          'Data Visualization',
          'Financial Data',
          'Interface Development',
          'Perspective Library',
        ],
      },
      {
        'role': 'Software Engineering Job Simulation',
        'company': 'Electronic Arts (EA Sports)',
        'period': '2025',
        'type': 'Job Simulation',
        'description':
            'Participated in EA Sports\' virtual software engineering simulation. Worked on game feature proposals, object-oriented design for game components, and bug reporting — gaining hands-on exposure to game development workflows.',
        'skills': [
          'Object-Oriented Design',
          'C++',
          'Game Development',
          'Feature Design',
          'Bug Reporting',
        ],
      },
    ];

    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Simulated Job Experiences',
            style: AppTheme.subHeadingStyle.copyWith(
              fontSize: subHeadingFontSize,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Virtual job simulations from leading global companies via Forage',
            style: AppTheme.bodyStyle.copyWith(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 700;
              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: jobs
                      .map((job) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: _buildJobCard(job),
                            ),
                          ))
                      .toList(),
                );
              }
              return Column(
                children: jobs
                    .map((job) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _buildJobCard(job),
                        ))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(Map<String, dynamic> job) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  job['type'] as String,
                  style: AppTheme.bodyStyle.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                job['period'] as String,
                style: AppTheme.bodyStyle.copyWith(
                  fontSize: 13,
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            job['role'] as String,
            style: AppTheme.bodyStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            job['company'] as String,
            style: AppTheme.bodyStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            job['description'] as String,
            style: AppTheme.bodyStyle.copyWith(
              fontSize: 13,
              height: 1.6,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (job['skills'] as List<String>)
                .map((skill) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.primaryColor.withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        skill,
                        style: AppTheme.bodyStyle.copyWith(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
