import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../core/themes/app_theme.dart';
import '../../data/models/project.dart';
import 'responsive_helper.dart';

class ProjectDetailPopup extends StatefulWidget {
  final Project project;

  const ProjectDetailPopup({
    super.key,
    required this.project,
  });

  @override
  State<ProjectDetailPopup> createState() => _ProjectDetailPopupState();
}

class _ProjectDetailPopupState extends State<ProjectDetailPopup> {
  late PageController _pageController;
  int _currentPage = 0;
  YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Initialize YouTube controller if video ID exists
    if (widget.project.youtubeVideoId != null &&
        widget.project.youtubeVideoId!.isNotEmpty) {
      _youtubeController = YoutubePlayerController(
        initialVideoId: widget.project.youtubeVideoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          hideControls: false,
          controlsVisibleAtStart: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _youtubeController?.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = ResponsiveHelper.isDesktop(width);
    final isTablet = ResponsiveHelper.isTablet(width);

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Backdrop blur effect
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),

          // Full-screen popup content
          Center(
            child: SlideInUp(
              duration: const Duration(milliseconds: 400),
              child: Container(
                width: isDesktop
                    ? width * 0.7
                    : (isTablet ? width * 0.85 : width * 0.95),
                height: MediaQuery.of(context).size.height * 0.9,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    children: [
                      // Header with close button
                      _buildHeader(),

                      // Scrollable content
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(
                              isDesktop ? 40 : (isTablet ? 30 : 20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Screenshot gallery
                              if (widget.project.screenshots.isNotEmpty)
                                _buildScreenshotGallery(),

                              if (widget.project.screenshots.isNotEmpty)
                                const SizedBox(height: 30),

                              // YouTube video player
                              if (_youtubeController != null)
                                _buildYouTubePlayer(),

                              if (_youtubeController != null)
                                const SizedBox(height: 30),

                              // Description
                              _buildDescriptionSection(),

                              const SizedBox(height: 30),

                              // Features
                              if (widget.project.features.isNotEmpty)
                                _buildFeaturesSection(),

                              if (widget.project.features.isNotEmpty)
                                const SizedBox(height: 30),

                              // Technologies
                              _buildTechnologiesSection(),

                              const SizedBox(height: 40),

                              // Download button
                              if (widget.project.downloadUrl != null)
                                _buildDownloadButton(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryColor.withOpacity(0.9),
            AppTheme.accentColor.withOpacity(0.85),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (widget.project.isFeatured)
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.accentColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Featured',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.project.category,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  widget.project.title,
                  style: AppTheme.headingStyle.copyWith(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreenshotGallery() {
    // Build full list: thumbnail first, then screenshots
    final allImages = <String>[
      if (widget.project.imageUrl != null) widget.project.imageUrl!,
      ...widget.project.screenshots,
    ];

    if (allImages.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Screenshots',
          style: AppTheme.headingStyle.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 320,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Image display
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  allImages[_currentPage],
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 320,
                ),
              ),
              // Left arrow
              if (_currentPage > 0)
                Positioned(
                  left: 8,
                  child: GestureDetector(
                    onTap: () => setState(() => _currentPage--),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ),
              // Right arrow
              if (_currentPage < allImages.length - 1)
                Positioned(
                  right: 8,
                  child: GestureDetector(
                    onTap: () => setState(() => _currentPage++),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Page indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            allImages.length,
            (index) => GestureDetector(
              onTap: () => setState(() => _currentPage = index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  gradient:
                      _currentPage == index ? AppTheme.primaryGradient : null,
                  color: _currentPage == index
                      ? null
                      : AppTheme.textSecondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildYouTubePlayer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project Demo',
          style: AppTheme.headingStyle.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: YoutubePlayer(
            controller: _youtubeController!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: AppTheme.primaryColor,
            progressColors: const ProgressBarColors(
              playedColor: AppTheme.primaryColor,
              handleColor: AppTheme.accentColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About This Project',
          style: AppTheme.headingStyle.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 12),
        Text(
          widget.project.longDescription.isNotEmpty
              ? widget.project.longDescription
              : widget.project.description,
          style: AppTheme.bodyStyle.copyWith(
            fontSize: 16,
            height: 1.6,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Features',
          style: AppTheme.headingStyle.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 12),
        ...widget.project.features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6, right: 12),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      feature,
                      style: AppTheme.bodyStyle.copyWith(
                        fontSize: 15,
                        height: 1.5,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildTechnologiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Technologies Used',
          style: AppTheme.headingStyle.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: widget.project.technologies.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.primaryColor.withOpacity(0.3),
                ),
              ),
              child: Text(
                tech,
                style: AppTheme.bodyStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDownloadButton() {
    final url = widget.project.downloadUrl!;
    final isGitHub = url.contains('github.com');
    final isFigma = url.contains('figma.com');

    final IconData icon = isGitHub
        ? Icons.code
        : isFigma
            ? Icons.design_services
            : Icons.download;

    final String label = isGitHub
        ? 'View on GitHub'
        : isFigma
            ? 'View on Figma'
            : 'Download App';

    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () => _launchURL(url),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        icon: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
