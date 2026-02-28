import '../models/project.dart';
import '../models/skill.dart';
import '../models/experience.dart';
import '../models/education.dart';

class PortfolioRepository {
  // Portfolio Stats
  static const int projectsCompleted = 10;
  static const int skillsLearned = 15;

  // Certifications with logos and links
  static List<Map<String, String>> getCertifications() {
    return [
      {
        'name': 'Amazon AWS',
        'icon': 'FontAwesomeIcons.aws',
        'certificateUrl':
            'https://drive.google.com/file/d/YOUR_AWS_CERT_ID/view', // Replace with your certificate link
      },
      {
        'name': 'Oracle',
        'icon': 'FontAwesomeIcons.oracle',
        'certificateUrl':
            'https://drive.google.com/file/d/YOUR_ORACLE_CERT_ID/view',
      },
      {
        'name': 'Mindluster',
        'icon': 'Icons.school',
        'certificateUrl':
            'https://drive.google.com/file/d/YOUR_MINDLUSTER_CERT_ID/view',
      },
      {
        'name': 'Hackerrank',
        'icon': 'FontAwesomeIcons.hackerrank',
        'certificateUrl':
            'https://www.hackerrank.com/certificates/5d22001c29b2',
      },
      {
        'name': 'JP Morgan',
        'icon': 'FontAwesomeIcons.building',
        'certificateUrl':
            'https://drive.google.com/file/d/YOUR_JPMORGAN_CERT_ID/view',
      },
      {
        'name': 'EA Sports',
        'icon': 'FontAwesomeIcons.gamepad',
        'certificateUrl':
            'https://drive.google.com/file/d/YOUR_EA_CERT_ID/view',
      },
    ];
  }

  // Sample Projects Data
  static List<Project> getProjects() {
    return [
      // ── 1. BookRead ──────────────────────────────────────────────────────
      Project(
        title: 'BookRead - PDF Reading App',
        description:
            'Cross-platform PDF reading app with digital library management, reading progress tracking, TTS, and Firebase cloud sync.',
        longDescription:
            'BookRead is a feature-rich PDF reading platform built with Flutter & Firebase, following BLoC architecture across 12 screens.\n\n'
            'Authentication\n'
            'Firebase Auth with email/password and Google Sign-In, secure session management, and real-time profile sync with Firebase Storage.\n\n'
            'Library Management\n'
            'Four categorized collections — Downloads, Favorites, To-Read, and Completed — with reading statistics and achievement badges.\n\n'
            'Reading Experience\n'
            'Syncfusion PDF Viewer with pinch zoom, bookmarks, and page thumbnails. Auto-saves progress and supports daily streak tracking.\n\n'
            'Text-to-Speech\n'
            'Full TTS support with play/pause, speed controls, and voice selection. Background audio support.\n\n'
            'Offline & Sync\n'
            'Offline-first with local storage (SharedPreferences). Firebase Firestore for real-time multi-device sync.',
        technologies: [
          'Flutter',
          'Dart',
          'Firebase Auth',
          'Cloud Firestore',
          'Firebase Storage',
          'BLoC',
          'Syncfusion PDF',
          'Flutter TTS',
          'Google Sign-In',
          'SharedPreferences',
          'Material Design 3',
        ],
        features: [
          'Email/password & Google Sign-In via Firebase Auth',
          'Library categories: Downloads, Favorites, To-Read, Completed',
          'High-performance Syncfusion PDF viewer with zoom & bookmarks',
          'Text-to-Speech with speed controls and voice selection',
          'Auto-save reading position with resume support',
          'Daily reading streak tracking & achievement badges',
          'Offline-first with real-time Firestore multi-device sync',
          'Light/dark mode and customizable reading settings',
          'Book sharing via email, social media & messaging',
          'Cross-platform: Android, iOS, Web, Windows, macOS, Linux',
        ],
        category: 'Mobile App',
        isFeatured: true,
        imageUrl: 'assets/images/projects/book.png',
        screenshots: [],
        youtubeVideoId: null,
        downloadUrl: 'https://github.com/iamSaifulhassan/bookreadapp',
      ),

      // ── 2. HistoMeet ─────────────────────────────────────────────────────
      Project(
        title: 'HistoMeet - AI Historical Chat Platform',
        description:
            'A Figma UI/UX project from my HCI course — design for an app where you can chat with AI versions of historical figures like Einstein, Napoleon, and more.',
        longDescription:
            'This was a semester project for my Human-Computer Interaction (HCI) course. The idea came from wanting to make history less passive — what if you could just talk to the people who made it?\n\n'
            'What We Designed\n'
            'A mobile app where users can chat with AI representations of historical figures, browse personalities by century (16th–20th), and even hypothetically video call them. We also designed an authentication flow, referral/credit system, and account settings.\n\n'
            'How We Built It\n'
            'The whole thing was done in Figma — wireframes, high-fidelity screens, and a fully interactive prototype. We used Figma\'s collaboration feature to work on it as a team in real time, which was a great experience for design handoff and version control.\n\n'
            'HCI Principles We Applied\n'
            "We intentionally applied course concepts throughout: Hick's Law to limit choices per screen, Fitts's Law for touch target sizing, and consistent visual feedback so users always know what's happening. Accessibility — contrast, font size, tap targets — was a priority from day one.",
        technologies: [
          'Figma',
          'UI/UX Design',
          'Prototyping',
          'HCI',
          'Interaction Design',
          'Collaborative Design',
        ],
        features: [
          'AI-powered chat interface with historical personalities',
          'Hypothetical video call flow design',
          'Century-based personality browsing (16th–20th)',
          'Credit & referral reward system UI',
          'Secure authentication flow screens',
          "HCI principles: Hick's Law, Fitts's Law, Consistency & Feedback",
          'Built collaboratively using Figma real-time collaboration',
          'Full interactive prototype with navigation flows',
        ],
        category: 'Design',
        isFeatured: true,
        imageUrl: 'assets/images/projects/histomeet.png',
        screenshots: [],
        youtubeVideoId: null,
        downloadUrl:
            'https://www.figma.com/design/87zDGjMBjTJzTdQpZbrDdl/HCI-Project?node-id=0-1&p=f&t=khfH897JfDxTaTeg-0',
      ),

      // ── 3. University Portal ──────────────────────────────────────────────
      Project(
        title: 'University Portal',
        description:
            'Java desktop application with dual Teacher/Student portals for course management, marks entry, enrollment, and academic report generation.',
        longDescription:
            'A desktop academic management system built with Java Swing/AWT and SQL, providing role-based access for teachers and students.\n\n'
            'Teacher Portal\n'
            'Full course CRUD — register, update, and delete courses. Enter and update student marks across assessment types (assignments, quizzes, midterms, finals).\n\n'
            'Student Portal\n'
            'View enrolled courses, real-time grades, semester-wise performance, and GPA. Auto-calculated from teacher-entered marks.\n\n'
            'Reports & Analytics\n'
            'Student performance reports, course-wide grade distributions, transcript generation, and complete academic records.\n\n'
            'Security\n'
            'Role-based access control (RBAC), password protection, SQL injection prevention via prepared statements, and session management.',
        technologies: [
          'Java',
          'Java Swing/AWT',
          'SQL',
          'MySQL/SQLite',
          'JDBC',
          'OOP',
          'RBAC',
        ],
        features: [
          'Dual role system: Teacher and Student portals',
          'Secure login with role-based access control (RBAC)',
          'Course CRUD: register, update, delete, and assign courses',
          'Student enrollment management per course',
          'Marks entry across multiple assessment categories',
          'Auto GPA calculation from entered grades',
          'Academic reports: transcripts and grade distributions',
          'SQL injection prevention with prepared statements',
          'JDBC-based data layer with transaction support',
          'Cross-platform: Windows, macOS, Linux (Java)',
        ],
        category: 'Desktop App',
        isFeatured: false,
        imageUrl: 'assets/images/projects/ecommerce.png',
        screenshots: [],
        youtubeVideoId: null,
        downloadUrl:
            'https://github.com/iamSaifulhassan/University_portal-main',
      ),

      // ── 3. E-Commerce App ────────────────────────────────────────────────
      Project(
        title: 'E-Commerce Application',
        description:
            'Full-featured Flutter e-commerce app with Supabase backend, Clean Architecture, BLoC state management, and Cloudinary image hosting.',
        longDescription:
            'A production-ready e-commerce app built using Flutter with Clean Architecture principles, separating Domain, Data, and Presentation layers.\n\n'
            'Authentication & Profiles\n'
            'Supabase Auth with email/password login, secure RLS policies, automatic profile creation via database triggers, and avatar support.\n\n'
            'Product Catalog\n'
            'Category-based product browsing with search, filtering, and Cloudinary-hosted images. Full stock and price management.\n\n'
            'Shopping Cart\n'
            'Persistent per-user cart with real-time total calculation. Unique constraint prevents duplicate items. Quantity updates & removal.\n\n'
            'Architecture\n'
            'Clean Architecture with BLoC, GetIt for dependency injection, Freezed for immutable models, and Either pattern for error handling.\n\n'
            'Security\n'
            'Row-Level Security (RLS) on all tables, environment variables via flutter_dotenv, and JDBC prepared statements.',
        technologies: [
          'Flutter',
          'Dart',
          'Supabase',
          'PostgreSQL',
          'BLoC',
          'Clean Architecture',
          'GetIt',
          'Freezed',
          'Cloudinary',
          'go_router',
          'dartz',
          'flutter_dotenv',
        ],
        features: [
          'Supabase Auth with email/password and RLS data protection',
          'Automatic profile creation via PostgreSQL database triggers',
          'Category-based product browsing with search & filters',
          'Cloudinary image hosting with cached_network_image',
          'Persistent shopping cart with real-time total calculation',
          'Clean Architecture: Domain, Data & Presentation layers',
          'BLoC state management with Freezed immutable models',
          'GetIt dependency injection & Either error handling',
          'Declarative routing with go_router',
          'Cross-platform: Android, iOS, Web, Linux, macOS, Windows',
        ],
        category: 'Mobile App',
        isFeatured: true,
        imageUrl: 'assets/images/projects/ecommerce.png',
        screenshots: [],
        youtubeVideoId: null,
        downloadUrl: 'https://github.com/iamSaifulhassan/ecommerceapp',
      ),

      // ── 4. Smart Task Manager ─────────────────────────────────────────────
      Project(
        title: 'Smart Task Manager',
        description:
            'Flutter task management app with offline-first SQLite storage, Firebase cloud sync, Riverpod state management, and smart filtering.',
        longDescription:
            'A Clean Architecture Flutter app for comprehensive task management that works fully offline and syncs to Firebase when connected.\n\n'
            'Task Management\n'
            'Full CRUD — create tasks with title, description, priority, and deadline. Track status (Pending/Completed) with timestamps.\n\n'
            'Offline-First Sync\n'
            'SQLite for local persistence. Smart sync engine detects connectivity and automatically syncs to Cloud Firestore, with conflict resolution.\n\n'
            'Smart Filtering\n'
            'Filter by Priority (High/Medium/Low), Status, or Deadline (Overdue/Today/Upcoming). Sort by date, deadline, priority, or title.\n\n'
            'Architecture\n'
            'Clean Architecture with Domain, Data, and Presentation layers. Riverpod for state management, GetIt for DI, and Either pattern for errors.',
        technologies: [
          'Flutter',
          'Dart',
          'Firebase Auth',
          'Cloud Firestore',
          'SQLite (sqflite)',
          'Riverpod',
          'Clean Architecture',
          'GetIt',
          'dartz',
          'connectivity_plus',
          'Dio',
        ],
        features: [
          'Firebase email/password authentication',
          'Full task CRUD with title, description, priority & deadline',
          'Offline-first with SQLite local database',
          'Auto-sync to Cloud Firestore with conflict resolution',
          'Filter by priority, status, and deadline',
          'Sort by date, deadline, priority, or title',
          'Riverpod state management with StateNotifier',
          'Clean Architecture: Domain, Data & Presentation layers',
          'Either pattern for functional error handling',
          'Cross-platform: Android, iOS, Web',
        ],
        category: 'Mobile App',
        isFeatured: true,
        imageUrl: 'assets/images/projects/task.png',
        screenshots: [],
        youtubeVideoId: null,
        downloadUrl: 'https://github.com/iamSaifulhassan/SmartTaskmanager',
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
        company: 'CodeAlpha',
        position: 'Mobile Application Developer Intern',
        duration: 'Jul 2025 – Aug 2025',
        description:
            'Virtual internship at CodeAlpha (Lucknow, India — Remote) focused on mobile application development, UI development, and REST API integration under defined technical constraints.',
        achievements: [
          'Completed structured application-building tasks focused on UI development and REST API integration',
          'Developed 4 modular applications under defined technical constraints and submission deadlines',
          'Strengthened understanding of client-server communication patterns and maintainable mobile architecture',
        ],
      ),
      Experience(
        company: 'Swedish College of Engineering and Technology',
        position: 'Data Entry Operator',
        duration: 'Nov 2020 – Feb 2021',
        description:
            'Worked in the Examination Branch at Swedish College, Wah Cantt, ensuring the integrity and confidentiality of student academic records.',
        achievements: [
          'Ensured integrity and confidentiality of student academic records in the Examination Branch',
          'Validated physical data against digital entries to minimize errors in the institutional database',
          'Maintained accurate and organized records to support administrative operations',
        ],
      ),
    ];
  }

  // Sample Education Data
  static List<Education> getEducation() {
    return [
      Education(
        institution: 'Comsats University Islamabad, Wah Campus',
        degree: 'Bachelor of Science in Software Engineering',
        field: 'Software Engineering',
        duration: '2022 - Present',
        grade: 'CGPA: 3.55/4.00',
        description:
            'Specialized in Software Engineering and Mobile Application Development',
      ),
    ];
  }
}
