import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/auth_screen.dart';

/// Ponto de entrada do aplicativo MangaTracker.
///
/// Aplica o tema dark mode premium e configura a barra de status do sistema
/// para combinar com a estética do app.
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Configura a barra de status para se integrar ao dark mode
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppTheme.cardGraphite,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MangaTrackerApp());
}

class MangaTrackerApp extends StatelessWidget {
  const MangaTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MangaTracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const AuthScreen(),
    );
  }
}
