# Saiful Hassan - Portfolio

A professional portfolio website built with Flutter for web deployment on GitHub Pages.

## 🚀 Features

- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Modern UI**: Clean and professional design with smooth animations
- **Hero Section**: Eye-catching introduction with profile image and call-to-action buttons
- **About Section**: Personal introduction and overview
- **Experience Section**: Professional work timeline with achievements
- **Skills Section**: Technical skills and expertise showcase
- **Projects Section**: Featured projects with live demos and source code links
- **Education & Certifications**: Academic background and professional certifications
- **Contact Section**: Multiple ways to get in touch

## 🛠️ Tech Stack

- **Framework**: Flutter (Web)
- **Language**: Dart
- **Fonts**: Google Fonts (Poppins)
- **Icons**: Font Awesome Flutter
- **Animations**: Animate Do
- **Deployment**: GitHub Pages
- **CI/CD**: GitHub Actions

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.19.0 or later)
- Dart SDK
- Web browser for testing

### Installation

1. Clone the repository:
```bash
git clone https://github.com/iamsaifulhassan/iamsaifulhassan_portfolio.git
cd iamsaifulhassan_portfolio
```

2. Install dependencies:
```bash
flutter pub get
```

3. Enable Flutter web:
```bash
flutter config --enable-web
```

4. Run the development server:
```bash
flutter run -d web-server --web-port 8080
```

### Building for Production

```bash
flutter build web --base-href "/iamsaifulhassan_portfolio/"
```

## 🌐 Deployment to GitHub Pages

This portfolio is configured for automatic deployment to GitHub Pages using GitHub Actions.

### Setup Instructions:

1. **Update** personal information in `lib/core/constants/app_constants.dart`
2. **Replace** profile image in `assets/images/profile.jpg`
3. **Update** CV URL in constants (use Google Drive or similar for hosting)
4. **Enable** GitHub Pages in repository settings
5. **Push** changes to main branch to trigger deployment

## 📞 Contact

Update your contact information in the constants file and customize as needed.

---

**Note**: Remember to update all personal information, links, and assets before deploying your portfolio!
