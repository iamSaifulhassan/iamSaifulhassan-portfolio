import '../models/project.dart';
import '../models/skill.dart';
import '../models/experience.dart';
import '../models/education.dart';

class PortfolioRepository {
  // Sample Projects Data
  static List<Project> getProjects() {
    return [
      Project(
        title: 'E-Commerce Mobile App',
        description:
            'A complete e-commerce mobile application built with Flutter, featuring user authentication, product catalog, shopping cart, and payment integration.',
        technologies: ['Flutter', 'Dart', 'Firebase', 'Stripe API', 'Provider'],
        category: 'Mobile App',
        isFeatured: true,
        githubUrl: 'https://github.com/yourusername/ecommerce-app',
        liveUrl:
            'https://play.google.com/store/apps/details?id=com.example.ecommerce',
      ),
      Project(
        title: 'Task Management Dashboard',
        description:
            'A responsive web dashboard for task management with real-time updates, team collaboration features, and analytics.',
        technologies: ['Flutter Web', 'Firebase', 'Chart.js', 'WebSocket'],
        category: 'Web App',
        isFeatured: true,
        githubUrl: 'https://github.com/yourusername/task-dashboard',
        liveUrl: 'https://task-dashboard-demo.web.app',
      ),
      Project(
        title: 'Weather Forecast App',
        description:
            'A beautiful weather application with location-based forecasts, interactive maps, and detailed weather analytics.',
        technologies: [
          'Flutter',
          'OpenWeather API',
          'Google Maps',
          'Bloc Pattern'
        ],
        category: 'Mobile App',
        githubUrl: 'https://github.com/yourusername/weather-app',
      ),
      Project(
        title: 'Book Reading App',
        description:
            'A mobile application for book lovers to discover, read, and share their favorite books.',
        technologies: ['Flutter', 'Firebase', 'Provider', 'Google Books API'],
        category: 'Mobile App',
        githubUrl: 'https://github.com/iamsaifulhassan/book-reading-app',
      ),
      Project(
        title: 'Portfolio Website',
        description:
            'A responsive portfolio website built with Flutter Web showcasing projects and skills.',
        technologies: ['Flutter Web', 'Responsive Design', 'Animations'],
        category: 'Web App',
        githubUrl: 'https://github.com/iamsaifulhassan/iamsaifulhassan_portfolio',
        liveUrl: 'https://yourportfolio.web.app',
      ),
      Project(
        title: 'Social Media App',
        description:
            'Instagram-like social media app with photo sharing, stories, and real-time feed updates.',
        technologies: ['Flutter', 'Firebase', 'Cloud Storage', 'Push Notifications'],
        category: 'Mobile App',
        isFeatured: true,
        githubUrl: 'https://github.com/yourusername/social-app',
      ),
      Project(
        title: 'Expense Tracker',
        description:
            'Personal finance management app with budget tracking, expense categorization, and financial insights.',
        technologies: ['Flutter', 'SQLite', 'Charts', 'Biometric Auth'],
        category: 'Mobile App',
        githubUrl: 'https://github.com/yourusername/expense-tracker',      ),
    ];
  }

  // Sample Skills Data
  static List<Skill> getSkills() {
    return [
      // Frontend & Mobile (from your screenshots)
      Skill(
        name: 'Flutter',
        iconPath: 'assets/icons/flutter.png',
        proficiency: 0.9,
        category: 'Frontend',
        description: 'Cross-platform mobile development',
      ),
      Skill(
        name: 'Dart',
        iconPath: 'assets/icons/dart.png',
        proficiency: 0.9,
        category: 'Language',
        description: 'Primary programming language for Flutter',
      ),
      Skill(
        name: 'Firebase',
        iconPath: 'assets/icons/firebase.png',
        proficiency: 0.85,
        category: 'Backend',
        description: 'Backend as a Service platform',
      ),
      Skill(
        name: 'Bloc',
        iconPath: 'assets/icons/bloc.png',
        proficiency: 0.8,
        category: 'Frontend',
        description: 'State management for Flutter',
      ),
      
      // Backend & Languages
      Skill(
        name: 'Java',
        iconPath: 'assets/icons/java.png',
        proficiency: 0.75,
        category: 'Language',
        description: 'Object-oriented programming language',
      ),
      Skill(
        name: 'Laravel',
        iconPath: 'assets/icons/laravel.png',
        proficiency: 0.7,
        category: 'Backend',
        description: 'PHP web application framework',
      ),
      Skill(
        name: 'SQL',
        iconPath: 'assets/icons/sql.png',
        proficiency: 0.8,
        category: 'Database',
        description: 'Database query language',
      ),
      
      // Tools & Design
      Skill(
        name: 'Git',
        iconPath: 'assets/icons/git.png',
        proficiency: 0.85,
        category: 'Tool',
        description: 'Version control system',
      ),
      Skill(
        name: 'Figma',
        iconPath: 'assets/icons/figma.png',
        proficiency: 0.75,
        category: 'Design',
        description: 'UI/UX design and prototyping',
      ),
      Skill(
        name: 'Prototyping',
        iconPath: 'assets/icons/prototype.png',
        proficiency: 0.7,
        category: 'Design',
        description: 'Creating interactive prototypes',
      ),
      Skill(
        name: 'UI/UX Design',
        iconPath: 'assets/icons/design.png',
        proficiency: 0.75,
        category: 'Design',
        description: 'User interface and experience design',
      ),
      
      // Development Tools
      Skill(
        name: 'Android Studio',
        iconPath: 'assets/icons/android_studio.png',
        proficiency: 0.8,
        category: 'Tool',
        description: 'Android development IDE',
      ),
      Skill(
        name: 'VS Code',
        iconPath: 'assets/icons/vscode.png',
        proficiency: 0.9,
        category: 'Tool',
        description: 'Code editor and IDE',
      ),
      
      // APIs
      Skill(
        name: 'REST APIs',
        iconPath: 'assets/icons/api.png',
        proficiency: 0.85,
        category: 'Backend',
        description: 'API integration and development',
      ),
    ];
  }

  // Sample Experience Data
  static List<Experience> getExperience() {
    return [
      Experience(
        company: 'Tech Solutions Ltd.',
        position: 'Senior Flutter Developer',
        duration: '2022 - Present',
        description:
            'Leading mobile app development projects and mentoring junior developers.',
        achievements: [
          'Developed 5+ mobile applications with 100K+ downloads',
          'Improved app performance by 40% through optimization',
          'Led a team of 3 developers on major projects',
          'Implemented CI/CD pipeline reducing deployment time by 60%',
        ],
      ),
      Experience(
        company: 'StartUp Inc.',
        position: 'Flutter Developer',
        duration: '2021 - 2022',
        description:
            'Developed cross-platform mobile applications for various clients.',
        achievements: [
          'Built 10+ mobile applications from scratch',
          'Integrated multiple third-party APIs and payment gateways',
          'Collaborated with design team to implement pixel-perfect UIs',
          'Maintained 98% crash-free rate across all applications',
        ],
      ),
      Experience(
        company: 'Freelance',
        position: 'Mobile App Developer',
        duration: '2020 - 2021',
        description:
            'Provided mobile app development services to small and medium businesses.',
        achievements: [
          'Completed 15+ freelance projects successfully',
          'Achieved 5-star rating on multiple platforms',
          'Delivered projects 20% ahead of schedule on average',
          'Built long-term relationships with repeat clients',
        ],
      ),
    ];
  }

  // Sample Education Data
  static List<Education> getEducation() {
    return [
      Education(
        institution: 'University of Technology',
        degree: 'Bachelor of Science',
        field: 'Computer Science',
        duration: '2018 - 2022',
        grade: 'CGPA: 3.8/4.0',
        description:
            'Specialized in mobile application development and software engineering.',
      ),
      Education(
        institution: 'Online Learning Platform',
        degree: 'Certification',
        field: 'Flutter Development',
        duration: '2020',
        description:
            'Comprehensive Flutter development course with hands-on projects.',
      ),
    ];
  }
}
