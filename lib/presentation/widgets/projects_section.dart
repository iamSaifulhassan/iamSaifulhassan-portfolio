import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/themes/app_theme.dart';
import '../../data/repositories/portfolio_repository.dart';
import '../../data/models/project.dart';
import 'responsive_helper.dart';
import 'project_detail_popup.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String selectedCategory = 'All';
  List<String> categories = [
    'All',
    'Mobile App',
    'Web App',
    'Desktop App',
    'Design',
    'AI'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = ResponsiveHelper.isDesktop(width);
    final isTablet = ResponsiveHelper.isTablet(width);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100.0 : (isTablet ? 40.0 : 20.0),
        vertical: AppTheme.spacingXXL,
      ),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'Featured Projects',
              style:
                  AppTheme.headingStyle.copyWith(fontSize: isDesktop ? 48 : 36),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            delay: const Duration(milliseconds: 100),
            child: Container(
              width: 100,
              height: 4,
              decoration: const BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ),
          const SizedBox(height: AppTheme.spacingXL),
          _buildCategoryFilter(),
          const SizedBox(height: 60),
          _buildProjectsGrid(isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: categories.map((category) {
          final isSelected = selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  gradient: isSelected ? AppTheme.primaryGradient : null,
                  color: isSelected ? null : AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : AppTheme.primaryColor.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  category,
                  style: AppTheme.bodyStyle.copyWith(
                    color: isSelected ? Colors.white : AppTheme.textSecondary,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProjectsGrid(bool isDesktop, bool isTablet) {
    if (isDesktop) {
      return _buildDesktopGrid();
    } else if (isTablet) {
      return _buildTabletGrid();
    } else {
      return _buildMobileGrid();
    }
  }

  Widget _buildDesktopGrid() {
    final projects = _getFilteredProjects();
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      delay: const Duration(milliseconds: 300),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: 1.5, // Wide immersive cards for desktop
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return _ImmersiveProjectCard(
              project: projects[index], index: index, isMobile: false);
        },
      ),
    );
  }

  Widget _buildTabletGrid() {
    final projects = _getFilteredProjects();
    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 300),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.0, // Square-ish immersive cards for tablet
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return _ImmersiveProjectCard(
              project: projects[index], index: index, isMobile: false);
        },
      ),
    );
  }

  Widget _buildMobileGrid() {
    final projects = _getFilteredProjects();
    final size = MediaQuery.of(context).size;
    // Mobile: 1 column, slightly taller to show more image
    final mobileAspectRatio = size.width / 400;

    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 300),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: mobileAspectRatio,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return _ImmersiveProjectCard(
              project: projects[index], index: index, isMobile: true);
        },
      ),
    );
  }

  List<Project> _getFilteredProjects() {
    final projects = PortfolioRepository.getProjects();
    if (selectedCategory == 'All') {
      return projects;
    }
    return projects
        .where((project) => project.category == selectedCategory)
        .toList();
  }
}

class _ImmersiveProjectCard extends StatefulWidget {
  final Project project;
  final int index;
  final bool isMobile;

  const _ImmersiveProjectCard({
    required this.project,
    required this.index,
    required this.isMobile,
  });

  @override
  State<_ImmersiveProjectCard> createState() => _ImmersiveProjectCardState();
}

class _ImmersiveProjectCardState extends State<_ImmersiveProjectCard> {
  bool isHovered = false;

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  void _openProjectDetails() {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      builder: (context) => ProjectDetailPopup(project: widget.project),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: FadeInUp(
        duration: const Duration(milliseconds: 800),
        delay: Duration(milliseconds: widget.index * 100),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    )
                  ]
                : AppTheme.cardShadow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background Image with Zoom Effect
                AnimatedScale(
                  scale: isHovered ? 1.05 : 1.0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutCubic,
                  child: widget.project.imageUrl != null
                      ? Image.asset(
                          widget.project.imageUrl!,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: AppTheme.cardColor,
                          child: Center(
                            child: Icon(
                              Icons.laptop_mac,
                              size: 80,
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                        ),
                ),

                // Gradient Overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.95),
                      ],
                      stops: const [0.0, 0.4, 0.8, 1.0],
                    ),
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Featured Badge
                      if (widget.project.isFeatured)
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.accentColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 12,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Featured',
                                style: AppTheme.bodyStyle.copyWith(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                      // Title
                      Text(
                        widget.project.title,
                        style: AppTheme.headingStyle.copyWith(
                          fontSize: widget.isMobile ? 24 : 28,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 8),

                      // Description
                      Text(
                        widget.project.description,
                        style: AppTheme.bodyStyle.copyWith(
                          fontSize: widget.isMobile ? 12 : 14,
                          color: Colors.white.withOpacity(0.8),
                          height: 1.4,
                        ),
                        maxLines: widget.isMobile ? 2 : 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 16),

                      // Tech Stack
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            widget.project.technologies.take(3).map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: Text(
                              tech,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 20),

                      // Action Buttons
                      Row(
                        children: [
                          // Download button (shown if downloadUrl exists)
                          if (widget.project.downloadUrl != null)
                            Expanded(
                              child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  gradient: AppTheme.primaryGradient,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.primaryColor
                                          .withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () =>
                                      _launchURL(widget.project.downloadUrl!),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Download',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (widget.project.downloadUrl != null)
                            const SizedBox(width: 12),
                          // Read More button (always shown)
                          Expanded(
                            child: Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: TextButton(
                                onPressed: _openProjectDetails,
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Read More',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
