import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:plantiq_landingpage2/provider/theme_provider.dart'; // 👈 importa tu provider

class Navbar extends StatelessWidget {
  final VoidCallback onToggleLanguage;
  final Function(String) onNavigate;
  final Locale currentLocale;

  const Navbar({
    super.key,
    required this.onToggleLanguage,
    required this.onNavigate,
    required this.currentLocale,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: colors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Image.asset(
            'assets/images/Logo_blanco.png',
            height: 60,
          ),

          // Menú simplificado
          Row(
            children: [
              _menuItem(_t("descargas"), () => onNavigate("descargas")),
              _menuItem(_t("contactos"), () => onNavigate("contactos")),
              _menuItem(_t("acerca"), () => onNavigate("acerca")),
            ],
          ),

          // Botones de acciones
          Row(
            children: [
              IconButton(
                onPressed: onToggleLanguage,
                icon: const Icon(Icons.language, color: Colors.white),
              ),
              IconButton(
                onPressed: themeProvider.toggleTheme,
                icon: Icon(
                  isDark ? Icons.wb_sunny : Icons.dark_mode,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Diccionario para traducciones simplificadas para navbar
  String _t(String key) {
    final es = {
      "descargas": "Descargas",
      "contactos": "Contactos",
      "acerca": "Acerca de",
    };

    final en = {
      "descargas": "Downloads",
      "contactos": "Contacts",
      "acerca": "About",
    };

    return currentLocale.languageCode == "es" ? es[key]! : en[key]!;
  }
}
