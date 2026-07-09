import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';
import 'presentation/pages/portfolio_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final env = await rootBundle.loadString('.env');
    debugPrint(env); // Temporary test

    await dotenv.load(fileName: '.env');
    debugPrint("Loaded .env successfully");
  } catch (e, st) {
    debugPrint("Error loading .env: $e");
    debugPrintStack(stackTrace: st);
  }

  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saiful Hassan',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioPage(),
    );
  }
}
