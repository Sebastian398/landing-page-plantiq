import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Locale locale;

  const Footer({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    String getCopyrightText() {
      final texts = {
        'es': "© 2025 PlantIQ - Tu Proyecto de Riego Inteligente",
        'en': "© 2025 PlantIQ - Your Smart Irrigation Project",
      };
      return texts[locale.languageCode] ?? texts['es']!;
    }

    return Container(
      color: colors.primary, // usa color primario del tema
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
      child: Center(
        child: Text(
          getCopyrightText(),
          style: TextStyle(
            color: colors.onPrimary.withOpacity(0.7),
            fontSize: 14,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
