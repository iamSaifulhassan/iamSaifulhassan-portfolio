import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/themes/app_theme.dart';

class EducationCertificationSection extends StatelessWidget {
  const EducationCertificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 600 && size.width <= 1024;

    return Container(
      color: AppTheme.surfaceColor,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : (isTablet ? 50 : 20),
        vertical: 100,
      ),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'Education & Certifications',
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
          isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildEducationSection()),
        const SizedBox(width: 50),
        Expanded(child: _buildCertificationSection()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildEducationSection(),
        const SizedBox(height: 50),
        _buildCertificationSection(),
      ],
    );
  }

  Widget _buildEducationSection() {
    final educations = [
      {
        'degree': 'Bachelor of Science in Computer Science',
        'institution': 'University of Dhaka',
        'duration': '2018 - 2022',
        'gpa': 'CGPA: 3.75/4.00',
        'description':
            'Specialized in Software Engineering and Mobile Application Development',
        'achievements': [
          'Dean\'s List (3 semesters)',
          'Final Year Project: Flutter E-commerce App',
          'Programming Contest Participant',
        ],
      },
      {
        'degree': 'Higher Secondary Certificate (HSC)',
        'institution': 'Dhaka College',
        'duration': '2016 - 2018',
        'gpa': 'GPA: 5.00/5.00',
        'description': 'Science Group with focus on Mathematics and Physics',
        'achievements': [
          'Board Scholarship Recipient',
          'Mathematics Olympiad Participant',
          'Science Fair Winner',
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
              fontSize: 32,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 30),
        ...educations.asMap().entries.map((entry) {
          final index = entry.key;
          final education = entry.value;
          return FadeInLeft(
            duration: Duration(milliseconds: 1400 + (index * 200)),
            child: _buildEducationCard(education),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildCertificationSection() {
    final certifications = [
      {
        'title': 'Google Flutter Certified Developer',
        'issuer': 'Google',
        'date': 'Dec 2023',
        'credentialId': 'GFC-2023-12345',
        'url': 'https://developers.google.com/certification/flutter',
        'skills': ['Flutter', 'Dart', 'Mobile Development'],
      },
      {
        'title': 'AWS Certified Cloud Practitioner',
        'issuer': 'Amazon Web Services',
        'date': 'Oct 2023',
        'credentialId': 'AWS-CCP-54321',
        'url': 'https://aws.amazon.com/certification/',
        'skills': ['Cloud Computing', 'AWS Services', 'DevOps'],
      },
      {
        'title': 'Complete Flutter Development Bootcamp',
        'issuer': 'Udemy',
        'date': 'Jun 2023',
        'credentialId': 'UC-FLUTTER-2023',
        'url': 'https://udemy.com',
        'skills': ['Flutter', 'Firebase', 'State Management'],
      },
      {
        'title': 'Mobile App Marketing Certification',
        'issuer': 'Facebook Blueprint',
        'date': 'Mar 2023',
        'credentialId': 'FB-MAM-2023',
        'url': 'https://www.facebook.com/business/learn',
        'skills': ['App Marketing', 'User Acquisition', 'Analytics'],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Certifications',
            style: AppTheme.subHeadingStyle.copyWith(
              fontSize: 32,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 30),
        ...certifications.asMap().entries.map((entry) {
          final index = entry.key;
          final certification = entry.value;
          return FadeInRight(
            duration: Duration(milliseconds: 1400 + (index * 150)),
            child: _buildCertificationCard(certification),
          );
        }).toList(),
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
