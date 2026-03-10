import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../core/themes/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../pages/portfolio_page.dart'; // Import for ScrollToSectionNotification
import 'responsive_helper.dart';

// Add this import only for web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    final isDesktop = ResponsiveHelper.isDesktop(width);
    final isTablet = ResponsiveHelper.isTablet(width);
    final isMobile = ResponsiveHelper.isMobile(width);
    final smallMobile = width < 400;

    // Make height responsive to avoid overflow on small screens
    final containerHeight = smallMobile ? null : size.height;

    return Container(
      constraints: BoxConstraints(
        minHeight: size.height, // Ensure it takes at least full screen height
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.backgroundColor,
            AppTheme.surfaceColor,
            AppTheme.backgroundColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 120 : (isTablet ? 60 : 24),
          vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
        ),
        child: isDesktop
            ? _buildDesktopLayout(context)
            : _buildMobileLayout(context, isMobile),
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

  Widget _buildMobileLayout(BuildContext context, bool isMobile) {
    final size = MediaQuery.of(context).size;
    final smallMobile = size.width < 400;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImageContent(isMobile: smallMobile ? true : isMobile),
        SizedBox(height: smallMobile ? 20 : (isMobile ? 30 : 40)),
        _buildTextContent(context, isDesktop: false, isMobile: isMobile),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context,
      {required bool isDesktop, bool isMobile = false}) {
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
              fontSize: isDesktop ? 24 : (isMobile ? 16 : 20),
              color: Colors.white70,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 100),
          child: Text(
            AppConstants.developerName,
            style: AppTheme.headingStyle.copyWith(
              fontSize: isDesktop ? 64 : (isMobile ? 36 : 48),
              color: Colors.white,
            ),
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 200),
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
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 300),
          child: Row(
            mainAxisAlignment:
                isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              _buildActionButton(
                'Download CV',
                Icons.download,
                () => _downloadCV(context),
                isPrimary: true,
              ),
              const SizedBox(width: 20),
              _buildActionButton(
                'View Work',
                Icons.work,
                () {
                  ScrollToSectionNotification('projects').dispatch(context);
                },
                isPrimary: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 400),
          child: _buildSocialButtons(),
        ),
      ],
    );
  }

  Widget _buildImageContent({bool isMobile = false}) {
    final double imageSize = isMobile ? 240.0 : 320.0;
    final double borderWidth = isMobile ? 5.0 : 7.0;
    final double photoSize = imageSize - (borderWidth * 2);

    return FadeInRight(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 200),
      child: Container(
        width: imageSize,
        height: imageSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF00BCD4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1E88E5).withOpacity(0.5),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Container(
          width: photoSize,
          height: photoSize,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(
            'assets/images/profileimg.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E88E5), Color(0xFF00BCD4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(Icons.person, size: 120, color: Colors.white),
            ),
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
        foregroundColor: isPrimary ? AppTheme.backgroundColor : Colors.white,
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
          Icons.email,
          () {
            const email = AppConstants.email;
            final subject = Uri.encodeComponent('Contact from Portfolio');
            final body = Uri.encodeComponent(
                'Hi Saiful,\n\nI would like to get in touch with you.');
            final mailtoUrl = 'mailto:$email?subject=$subject&body=$body';
            if (kIsWeb) {
              // Use both location.assign and location.href for maximum compatibility
              try {
                html.window.location.assign(mailtoUrl);
              } catch (e) {
                html.window.location.href = mailtoUrl;
              }
            } else {
              _launchURL(mailtoUrl);
            }
          },
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
            FontAwesomeIcons.github, () => _launchURL(AppConstants.github)),
        const SizedBox(width: 20),
        _buildSocialButton(
            FontAwesomeIcons.linkedin, () => _launchURL(AppConstants.linkedIn)),
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

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    final bool isEmail = url.startsWith('mailto:');

    if (kIsWeb) {
      // Web-specific handling
      try {
        // Open in new tab for web links, direct for email
        if (isEmail) {
          html.window.location.href = url;
        } else {
          html.window.open(url, '_blank');
        }
      } catch (e) {
        try {
          // Fallback to location.href
          html.window.location.href = url;
        } catch (e) {
          debugPrint('Failed to launch URL on web: $e');
        }
      }
    } else {
      // Mobile and desktop
      try {
        if (await canLaunchUrl(uri)) {
          await launchUrl(
            uri,
            // Use platformDefault for email links for better email client integration
            mode: isEmail
                ? LaunchMode.platformDefault
                : LaunchMode.externalApplication,
          );
        } else {
          debugPrint('Cannot launch this URL: $url');
        }
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    }
  }

  void _downloadCV(BuildContext context) async {
    const cvAsset = AppConstants.cvUrl;
    if (kIsWeb) {
      // For web, trigger browser download
      html.AnchorElement(href: cvAsset)
        ..setAttribute('download', 'saifulhassan_cv.pdf')
        ..click();
    } else if (Theme.of(context).platform == TargetPlatform.android ||
        Theme.of(context).platform == TargetPlatform.iOS) {
      // On mobile, show PDF using a viewer package (not implemented here)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Opening CV... (PDF viewer not implemented)')),
      );
      // You can use a package like open_file or pdfx for real implementation
    } else {
      // On desktop, open the PDF asset (not implemented)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Download not supported on this platform.')),
      );
    }
  }
}
