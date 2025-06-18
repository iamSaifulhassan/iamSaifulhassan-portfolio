import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/themes/app_theme.dart';
import '../../core/constants/app_constants.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.backgroundColor, AppTheme.surfaceColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'Get In Touch',
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
          const SizedBox(height: 20),
          FadeInDown(
            duration: const Duration(milliseconds: 1200),
            child: Text(
              'I\'m always open to discussing new opportunities and exciting projects.',
              style: AppTheme.bodyStyle.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
          const SizedBox(height: 60),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildContactInfo(),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: _buildContactForm(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildContactForm(),
        const SizedBox(height: 40),
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildContactInfo() {
    return FadeInLeft(
      duration: const Duration(milliseconds: 1400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: AppTheme.subHeadingStyle.copyWith(fontSize: 28),
          ),
          const SizedBox(height: 30),
          _buildContactItem(
            Icons.email,
            'Email',
            AppConstants.email,
            () => _launchURL('mailto:${AppConstants.email}'),
          ),
          const SizedBox(height: 20),
          _buildContactItem(
            Icons.phone,
            'Phone',
            AppConstants.phone,
            () => _launchURL('tel:${AppConstants.phone}'),
          ),
          const SizedBox(height: 20),
          _buildContactItem(
            Icons.location_on,
            'Location',
            AppConstants.location,
            null,
          ),
          const SizedBox(height: 40),
          Text(
            'Follow Me',
            style: AppTheme.subHeadingStyle.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildSocialButton(
                Icons.work,
                'LinkedIn',
                () => _launchURL(AppConstants.linkedIn),
              ),
              const SizedBox(width: 15),
              _buildSocialButton(
                Icons.code,
                'GitHub',
                () => _launchURL(AppConstants.github),
              ),
              const SizedBox(width: 15),
              _buildSocialButton(
                Icons.web,
                'Website',
                () => _launchURL(AppConstants.website),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String label,
    String value,
    VoidCallback? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppTheme.primaryColor.withOpacity(0.1),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTheme.bodyStyle.copyWith(
                      fontSize: 14,
                      color: AppTheme.textHint,
                    ),
                  ),
                  Text(
                    value,
                    style: AppTheme.bodyStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              const Icon(
                Icons.arrow_forward_ios,
                color: AppTheme.primaryColor,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryColor.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  Widget _buildContactForm() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1400),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: AppTheme.cardGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send me a message',
                style: AppTheme.subHeadingStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 30),
              _buildTextField(
                controller: _nameController,
                label: 'Your Name',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _emailController,
                label: 'Your Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _messageController,
                label: 'Your Message',
                icon: Icons.message,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                  label: const Text('Send Message'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: AppTheme.bodyStyle.copyWith(fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTheme.bodyStyle.copyWith(color: AppTheme.textHint),
        prefixIcon: Icon(icon, color: AppTheme.primaryColor),
        filled: true,
        fillColor: AppTheme.surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1600),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppTheme.primaryColor.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '© 2024 ${AppConstants.developerName}. All rights reserved.',
              style: AppTheme.bodyStyle.copyWith(
                fontSize: 14,
                color: AppTheme.textHint,
              ),
            ),
            Text(
              'Made with ❤️ using Flutter',
              style: AppTheme.bodyStyle.copyWith(
                fontSize: 14,
                color: AppTheme.textHint,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_formKey.currentState!.validate()) {
      // Construct email body
      final subject = 'Portfolio Contact: ${_nameController.text}';
      final body = '''
Hello ${AppConstants.developerName},

${_messageController.text}

Best regards,
${_nameController.text}
${_emailController.text}
      ''';

      final emailUrl =
          'mailto:${AppConstants.email}?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';

      _launchURL(emailUrl);

      // Clear form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message sent! Your default email client should open.'),
          backgroundColor: AppTheme.primaryColor,
        ),
      );
    }
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}
