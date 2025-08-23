import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        horizontal: isDesktop ? 100 : (isTablet ? 50 : 12),
        vertical: isDesktop ? 100 : (isTablet ? 80 : 40),
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
          // Section Icon
          FadeInDown(
            duration: const Duration(milliseconds: 700),
            child: CircleAvatar(
              radius: isDesktop ? 38 : 30,
              backgroundColor: AppTheme.primaryColor.withOpacity(0.12),
              child: Icon(Icons.mail_outline,
                  size: isDesktop ? 38 : 30, color: AppTheme.primaryColor),
            ),
          ),
          const SizedBox(height: 18),
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'Get In Touch',
              style:
                  AppTheme.headingStyle.copyWith(fontSize: isDesktop ? 48 : 36),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 18),
          FadeInDown(
            duration: const Duration(milliseconds: 1200),
            child: Text(
              'I\'m always open to discussing new opportunities and exciting projects.',
              style: AppTheme.bodyStyle.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          // Responsive layout
          if (isDesktop || isTablet)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Contact Form
                Expanded(
                  flex: 3,
                  child: _buildContactForm(enhanced: true, isMobile: false),
                ),
                Container(
                  width: 1,
                  height: 340,
                  margin: const EdgeInsets.symmetric(horizontal: 36),
                  color: AppTheme.primaryColor.withOpacity(0.10),
                ),
                // Contact Info
                Expanded(
                  flex: 2,
                  child: _buildContactInfo(enhanced: true),
                ),
              ],
            )
          else
            Column(
              children: [
                _buildContactForm(enhanced: true, isMobile: true),
                const SizedBox(height: 36),
                Divider(
                  color: AppTheme.primaryColor.withOpacity(0.10),
                  thickness: 1,
                ),
                const SizedBox(height: 36),
                _buildContactInfo(enhanced: true),
              ],
            ),
          const SizedBox(height: 60),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildContactInfo({bool enhanced = false}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500), // match form width
      padding: EdgeInsets.symmetric(
        horizontal: enhanced ? 24 : 0,
        vertical: enhanced ? 24 : 0,
      ),
      decoration: enhanced
          ? BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(24),
              border:
                  Border.all(color: AppTheme.primaryColor.withOpacity(0.08)),
              boxShadow: AppTheme.cardShadow,
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline, color: AppTheme.primaryColor, size: 26),
              const SizedBox(width: 10),
              Text(
                'Contact Information',
                style: AppTheme.subHeadingStyle.copyWith(fontSize: 22),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildContactItem(
            icon: Icons.email,
            label: 'Email',
            value: AppConstants.email,
            enhanced: enhanced,
          ),
          const SizedBox(height: 18),
          _buildContactItem(
            icon: Icons.phone,
            label: 'Phone',
            value: AppConstants.phone,
            enhanced: enhanced,
          ),
          const SizedBox(height: 18),
          _buildContactItem(
            icon: Icons.location_on,
            label: 'Location',
            value: AppConstants.location,
            enhanced: enhanced,
          ),
          if (enhanced) ...[
            const SizedBox(height: 28),
            Divider(
                color: AppTheme.primaryColor.withOpacity(0.10), thickness: 1),
            const SizedBox(height: 18),
            Text('Social Links',
                style: AppTheme.bodyStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.globe,
                      color: AppTheme.primaryColor),
                  tooltip: 'Portfolio',
                  onPressed: () => _launchURL(AppConstants.portfolioUrl),
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.github, color: Colors.black),
                  tooltip: 'GitHub',
                  onPressed: () => _launchURL(AppConstants.githubUrl),
                ),
                IconButton(
                  icon:
                      Icon(FontAwesomeIcons.linkedin, color: Colors.blue[700]),
                  tooltip: 'LinkedIn',
                  onPressed: () => _launchURL(AppConstants.linkedinUrl),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    bool enhanced = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.primaryColor, size: enhanced ? 22 : 18),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: AppTheme.bodyStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: enhanced ? 15 : 13)),
            const SizedBox(height: 2),
            Text(value,
                style: AppTheme.bodyStyle.copyWith(
                    fontSize: enhanced ? 15 : 13,
                    color: AppTheme.textSecondary)),
          ],
        ),
      ],
    );
  }

  Widget _buildContactForm({bool enhanced = false, bool isMobile = false}) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1400),
      child: Container(
        constraints:
            const BoxConstraints(maxWidth: 500), // match info card width
        padding: EdgeInsets.symmetric(
          horizontal: enhanced ? (isMobile ? 12 : 32) : 30,
          vertical: enhanced ? 32 : 30,
        ),
        decoration: BoxDecoration(
          gradient: AppTheme.cardGradient,
          borderRadius: BorderRadius.circular(24),
          border: enhanced
              ? Border.all(
                  color: AppTheme.primaryColor.withOpacity(0.10), width: 2)
              : null,
          boxShadow: AppTheme.cardShadow,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.edit_note, color: AppTheme.primaryColor, size: 28),
                  const SizedBox(width: 10),
                  Text(
                    'Send me a message',
                    style: AppTheme.subHeadingStyle.copyWith(fontSize: 24),
                  ),
                ],
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
              _buildTextField(
                controller: _emailController,
                label: 'Your Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
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
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ElevatedButton.icon(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send, size: 22),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Text('Send Message',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // match fields
                      ),
                      shadowColor: AppTheme.primaryColor.withOpacity(0.18),
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
    final fieldBg = Colors.white.withOpacity(0.08);
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10.0), // more vertical space for clarity
      child: Focus(
        child: Builder(
          builder: (context) {
            final isFocused = Focus.of(context).hasFocus;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              decoration: BoxDecoration(
                color: fieldBg,
                borderRadius: BorderRadius.circular(
                    18), // slightly less for better blending
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isFocused ? 0.10 : 0.06),
                    blurRadius: isFocused ? 16 : 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: isFocused
                      ? AppTheme.primaryColor.withOpacity(0.45)
                      : Colors.white.withOpacity(0.10),
                  width:
                      isFocused ? 1.5 : 1.0, // thinner border for modern look
                ),
              ),
              child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                maxLines: maxLines,
                validator: validator,
                style: AppTheme.bodyStyle
                    .copyWith(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                  labelText: label,
                  labelStyle: AppTheme.bodyStyle.copyWith(
                      color: Colors.white.withOpacity(0.93),
                      fontWeight: FontWeight.w600),
                  prefixIcon:
                      Icon(icon, color: AppTheme.primaryColor, size: 22),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: AppTheme.primaryColor.withOpacity(0.45),
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.10),
                      width: 1.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Colors.red.withOpacity(0.7),
                      width: 1.2,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                  filled: true,
                  fillColor: fieldBg,
                ),
              ),
            );
          },
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
