import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importa tu ThemeProvider que maneja el estado del tema
import 'package:plantiq_landingpage2/provider/theme_provider.dart';

// Importa tus temas claro y oscuro personalizados
import 'package:plantiq_landingpage2/theme.dart';

// Importa tus widgets principales
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/footer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Landing Page",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Inicializa con la sección "descargas"
  String _currentSection = "descargas";
  Locale _locale = const Locale("es");

  void _navigateTo(String section) {
    setState(() {
      _currentSection = section;
    });
  }

  void _toggleLanguage() {
    setState(() {
      _locale = _locale.languageCode == "es"
          ? const Locale("en")
          : const Locale("es");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Column(
          children: [
            Navbar(
              onToggleLanguage: _toggleLanguage,
              onNavigate: _navigateTo,
              currentLocale: _locale,
            ),
            Expanded(
              child: HeroSection(section: _currentSection, locale: _locale),
            ),
            Footer(locale: _locale), // Añadido Footer al final
          ],
        ),
      ),
    );
  }
}
