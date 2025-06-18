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
        title: 'Chat Application',
        description:
            'Real-time messaging app with end-to-end encryption, media sharing, and group chat functionality.',
        technologies: ['Flutter', 'Firebase', 'Socket.io', 'Encryption'],
        category: 'Mobile App',
        githubUrl: 'https://github.com/yourusername/chat-app',
      ),
      Project(
        title: 'Portfolio Website',
        description:
            'A responsive portfolio website built with Flutter Web showcasing projects and skills.',
        technologies: ['Flutter Web', 'Responsive Design', 'Animations'],
        category: 'Web App',
        githubUrl: 'https://github.com/yourusername/portfolio',
        liveUrl: 'https://yourportfolio.web.app',
      ),
    ];
  }

  // Sample Skills Data
  static List<Skill> getSkills() {
    return [
      Skill(
        name: 'Flutter',
        iconPath: 'assets/icons/flutter.png',
        proficiency: 0.9,
        category: 'Framework',
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
        proficiency: 0.8,
        category: 'Backend',
        description: 'Backend as a Service platform',
      ),
      Skill(
        name: 'Git',
        iconPath: 'assets/icons/git.png',
        proficiency: 0.8,
        category: 'Tool',
        description: 'Version control system',
      ),
      Skill(
        name: 'REST API',
        iconPath: 'assets/icons/api.png',
        proficiency: 0.85,
        category: 'Backend',
        description: 'API integration and development',
      ),
      Skill(
        name: 'UI/UX Design',
        iconPath: 'assets/icons/design.png',
        proficiency: 0.7,
        category: 'Design',
        description: 'User interface and experience design',
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
