import '../models/project.dart';
import '../models/skill.dart';
import '../models/experience.dart';
import '../models/education.dart';

class PortfolioRepository {
  // Portfolio Stats
  static const int projectsCompleted = 10;
  static const int skillsLearned = 15;

  // Certifications with logos
  static List<Map<String, String>> getCertifications() {
    return [
      {
        'name': 'Amazon AWS',
        'icon': 'FontAwesomeIcons.aws',
      },
      {
        'name': 'Oracle',
        'icon': 'FontAwesomeIcons.oracle',
      },
      {
        'name': 'Mindluster',
        'icon': 'Icons.school',
      },
      {
        'name': 'Hackerrank',
        'icon': 'FontAwesomeIcons.hackerrank',
      },
      {
        'name': 'JP Morgan',
        'icon': 'FontAwesomeIcons.building',
      },
    ];
  }

  // Sample Projects Data
  static List<Project> getProjects() {
    return [
      Project(
        title: 'Flutter E-Commerce App',
        description:
            'A complete e-commerce mobile application with user authentication, product catalog, cart, and payment integration.',
        technologies: ['Flutter', 'Dart', 'Firebase', 'Provider', 'Stripe'],
        category: 'Mobile App',
        isFeatured: true,
        githubUrl: 'https://github.com/iamsaifulhassan/ecommerce-app',
        // liveUrl: 'Add your live demo link here',
      ),
      Project(
        title: 'Book Reading App',
        description:
            'A mobile application for book lovers with reading features, bookmarks, and personalized recommendations.',
        technologies: [
          'Flutter',
          'Dart',
          'Firebase',
          'PDF Viewer',
          'Local Storage'
        ],
        category: 'Mobile App',
        isFeatured: true,
        githubUrl: 'https://github.com/iamsaifulhassan/bookreadapp',
        // liveUrl: 'Add your live demo link here',
      ),
      Project(
        title: 'Portfolio Website',
        description:
            'A responsive portfolio website built with Flutter Web showcasing projects and skills for freelance work.',
        technologies: [
          'Flutter Web',
          'Dart',
          'Responsive Design',
          'Animations'
        ],
        category: 'Web App',
        isFeatured: true,
        githubUrl:
            'https://github.com/iamsaifulhassan/iamsaifulhassan_portfolio',
        // liveUrl: 'Add your live demo link here',
      ),
      Project(
        title: 'Task Management App',
        description:
            'A productivity app for managing daily tasks with categories, reminders, and progress tracking.',
        technologies: [
          'Flutter',
          'Dart',
          'SQLite',
          'Local Notifications',
          'Provider'
        ],
        category: 'Mobile App',
        githubUrl: 'https://github.com/iamsaifulhassan/task-manager',
        // liveUrl: 'Add your live demo link here',
      ),
      Project(
        title: 'Weather Forecast App',
        description:
            'A beautiful weather application with location-based forecasts, weather maps, and detailed analytics.',
        technologies: ['Flutter', 'Dart', 'REST API', 'Geolocation', 'Charts'],
        category: 'Mobile App',
        githubUrl: 'https://github.com/iamsaifulhassan/weather-app',
        // liveUrl: 'Add your live demo link here',
      ),
    ];
  }

  // Sample Skills Data
  static List<Skill> getSkills() {
    return [
      // Frontend & Mobile (from your screenshots)
      Skill(
        name: 'Flutter',
        iconPath: 'assets/icons/flutter.png',
        proficiency: 1.0, // Will not be displayed
        category: 'Frontend',
        description: 'Cross-platform mobile development',
      ),
      Skill(
        name: 'Dart',
        iconPath: 'assets/icons/dart.png',
        proficiency: 1.0,
        category: 'Language',
        description: 'Primary programming language for Flutter',
      ),
      Skill(
        name: 'Firebase',
        iconPath: 'assets/icons/firebase.png',
        proficiency: 1.0,
        category: 'Backend',
        description: 'Backend as a Service platform',
      ),
      Skill(
        name: 'Bloc',
        iconPath: 'assets/icons/bloc.png',
        proficiency: 1.0,
        category: 'State Management',
        description: 'State management for Flutter',
      ),

      // Backend & Languages
      Skill(
        name: 'Java',
        iconPath: 'assets/icons/java.png',
        proficiency: 1.0,
        category: 'Language',
        description: 'Object-oriented programming language',
      ),
      Skill(
        name: 'Laravel',
        iconPath: 'assets/icons/laravel.png',
        proficiency: 1.0,
        category: 'Backend',
        description: 'PHP web application framework',
      ),
      Skill(
        name: 'SQL',
        iconPath: 'assets/icons/sql.png',
        proficiency: 1.0,
        category: 'Database',
        description: 'Database query language',
      ),

      // Tools & Design
      Skill(
        name: 'Git',
        iconPath: 'assets/icons/git.png',
        proficiency: 1.0,
        category: 'Tool',
        description: 'Version control system',
      ),
      Skill(
        name: 'Figma',
        iconPath: 'assets/icons/figma.png',
        proficiency: 1.0,
        category: 'Design',
        description: 'UI/UX design and prototyping',
      ),
      Skill(
        name: 'Prototyping',
        iconPath: 'assets/icons/prototype.png',
        proficiency: 1.0,
        category: 'Design',
        description: 'Creating interactive prototypes',
      ),
      Skill(
        name: 'UI/UX Design',
        iconPath: 'assets/icons/design.png',
        proficiency: 1.0,
        category: 'Design',
        description: 'User interface and experience design',
      ),

      // Development Tools
      Skill(
        name: 'Android Studio',
        iconPath: 'assets/icons/android_studio.png',
        proficiency: 1.0,
        category: 'Tool',
        description: 'Android development IDE',
      ),
      Skill(
        name: 'VS Code',
        iconPath: 'assets/icons/vscode.png',
        proficiency: 1.0,
        category: 'Tool',
        description: 'Code editor and IDE',
      ),

      // APIs
      Skill(
        name: 'REST APIs',
        iconPath: 'assets/icons/api.png',
        proficiency: 1.0,
        category: 'Backend',
        description: 'API integration and development',
      ),
    ];
  }

  // Sample Experience Data
  static List<Experience> getExperience() {
    return [
      Experience(
        company: 'Comsats University Islamabad',
        position: 'Java Developer',
        duration: '2023 - Present',
        description:
            'Built scalable backend systems using Java and MySQL. Focused on Academic projects and internships to enhance skills in software development.',
        achievements: [
          'Developed RESTful APIs for mobile applications',
          'Optimized database queries for performance',
          'Error handling and logging improvements',
        ],
      ),
      Experience(
        company: 'Comsats University Islamabad',
        position: 'Flutter Full Stack Developer',
        duration: '2024 - Present',
        description:
            'Developed cross-platform mobile applications using Flutter to learn and gain experience. Focused on performance optimization with unique features and user experience.',
        achievements: [
          'Built 5+ production-ready apps',
          'Implemented custom Designs and animations',
          'Integrated RESTful APIs and Firebase',
          'Optimized app performance and responsiveness',
          'Learned state management with Provider and Riverpod',
        ],
      ),
    ];
  }

  // Sample Education Data
  static List<Education> getEducation() {
    return [
      Education(
        institution: 'Comsats University Islamabad, Wah Campus',
        degree: 'Bachelor of Science',
        field: 'Software Engineering',
        duration: '2022 - Present',
        grade: 'CGPA: 3.64/4.00',
        description:
            'Specialized in Software Engineering and Mobile Application Development',
      ),
    ];
  }
}
