import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramaniya_mobile/core/theme/app_theme.dart';
import 'package:ramaniya_mobile/screens/landing_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Pre-load all three brand fonts before first frame.
  await GoogleFonts.pendingFonts([
    GoogleFonts.inter(),
    GoogleFonts.fraunces(),
    GoogleFonts.newsreader(),
  ]);
  runApp(const RamaniyaApp());
}

class RamaniyaApp extends StatelessWidget {
  const RamaniyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ramaniya',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LandingScreen(),
    );
  }
}
