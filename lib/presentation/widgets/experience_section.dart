import 'package:flutter/material.dart';
import '../../core/themes/app_theme.dart';
import '../../data/repositories/portfolio_repository.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  // Use PortfolioRepository.getExperience() for unified experience data

  @override
  Widget build(BuildContext context) {
    final experiences = PortfolioRepository.getExperience();
    return Column(
      children: [
        Text(
          'Experience',
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
                const SizedBox(width: 10.0),
                SizedBox(
                  width: 32,
                  child: Column(
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                      ),
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
                const SizedBox(width: 24),
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
                        ...experience.achievements.map((achievement) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
