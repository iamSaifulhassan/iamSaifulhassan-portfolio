import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/themes/app_theme.dart';
import '../../core/constants/app_constants.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 600 && size.width <= 1024;

    return Container(
      height: size.height,
      decoration: const BoxDecoration(
        gradient: AppTheme.primaryGradient,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 100 : (isTablet ? 50 : 20),
          vertical: 50,
        ),
        child: isDesktop
            ? _buildDesktopLayout(context)
            : _buildMobileLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildTextContent(context, isDesktop: true),
        ),
        const SizedBox(width: 50),
        Expanded(
          child: _buildImageContent(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImageContent(),
        const SizedBox(height: 40),
        _buildTextContent(context, isDesktop: false),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, {required bool isDesktop}) {
    return Column(
      crossAxisAlignment:
          isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: Text(
            'Hello, I\'m',
            style: AppTheme.bodyStyle.copyWith(
              fontSize: isDesktop ? 24 : 18,
              color: Colors.white70,
            ),
          ),
        ),
        const SizedBox(height: 10),
        FadeInDown(
          duration: const Duration(milliseconds: 1000),
          child: Text(
            AppConstants.developerName,
            style: AppTheme.headingStyle.copyWith(
              fontSize: isDesktop ? 64 : 48,
              color: Colors.white,
            ),
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            AppConstants.tagline,
            style: AppTheme.subHeadingStyle.copyWith(
              fontSize: isDesktop ? 28 : 20,
              color: Colors.white70,
            ),
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            mainAxisAlignment:
                isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              _buildActionButton(
                'Download CV',
                Icons.download,
                () => _launchURL(AppConstants.cvUrl),
                isPrimary: true,
              ),
              const SizedBox(width: 20),
              _buildActionButton(
                'View Work',
                Icons.work,
                () => _scrollToProjects(context),
                isPrimary: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: _buildSocialButtons(),
        ),
      ],
    );
  }

  Widget _buildImageContent() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1000),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),        child: ClipOval(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.primaryColor.withOpacity(0.8),
                  AppTheme.secondaryColor.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(
              Icons.person,
              size: 150,
              color: Colors.white70,            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    String text,
    IconData icon,
    VoidCallback onPressed, {
    required bool isPrimary,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.white : Colors.transparent,
        foregroundColor: isPrimary ? AppTheme.primaryColor : Colors.white,
        side:
            isPrimary ? null : const BorderSide(color: Colors.white, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
            Icons.email, () => _launchURL('mailto:${AppConstants.email}')),
        const SizedBox(width: 20),
        _buildSocialButton(Icons.code, () => _launchURL(AppConstants.github)),
        const SizedBox(width: 20),
        _buildSocialButton(Icons.work, () => _launchURL(AppConstants.linkedIn)),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 30),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.1),
        padding: const EdgeInsets.all(15),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _scrollToProjects(BuildContext context) {
    // This would need to be implemented with a callback to the parent
    // For now, we'll just scroll down a bit
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}
