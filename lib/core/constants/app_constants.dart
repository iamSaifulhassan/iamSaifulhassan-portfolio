import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static const String appName = 'Saiful Hassan Portfolio';
  static const String developerName = 'Saiful Hassan';
  static const String tagline = 'Flutter Developer & Mobile App Developer';
  static const String aboutMe =
      '''I am a passionate Flutter developer with expertise in creating beautiful, 
responsive mobile applications. I love turning ideas into reality through clean, 
efficient code and stunning user interfaces.''';

  // Contact Information
  static const String email = 'saifulhassan708@gmail.com';
  static const String phone = '+92 3269878494';
  static const String linkedIn = 'https://linkedin.com/in/iamsaifulhassan';
  static const String github = 'https://github.com/iamsaifulhassan';
  static const String website = 'https://iamsaifulhassan.github.io';
  // Point to the path emitted into the web build (assets/assets/files/...)
  static const String cvUrl = 'assets/assets/files/saifulhassan_cv.pdf';

  // Social Media
  static const String twitter = 'https://twitter.com/iamsaifulhassan';
  static const String instagram = 'https://instagram.com/iamsaifulhassan';
  static const String facebook = 'https://facebook.com/iamsaifulhassan';

  // Professional Details
  static const String location = 'Islamabad, Pakistan';
  static const String experience = '1+ Years';
  static const String projectsCompleted = '10+';
  static const String paidprojects = '3+';

  // Skills
  static const List<String> skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'REST APIs',
    'State Management',
    'UI/UX Design',
    'Git & GitHub',
    'Mobile Development',
  ];

  // Portfolio URLs
  static const String portfolioUrl = website;
  static const String githubUrl = github;
  static const String linkedinUrl = linkedIn;

  // EmailJS Configuration
  static String get serviceId => dotenv.env['EMAILJS_SERVICE_ID'] ?? '';
  static String get templateId => dotenv.env['EMAILJS_TEMPLATE_ID'] ?? '';
  static String get publicKey => dotenv.env['EMAILJS_PUBLIC_KEY'] ?? '';
}
