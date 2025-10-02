import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Para iconos sociales
import 'dart:html' as html; // Import necesario para descarga en Flutter Web

class HeroSection extends StatelessWidget {
  final String section;
  final Locale locale;

  const HeroSection({super.key, required this.section, required this.locale});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getTitle(section),
                  style: TextStyle(
                    color: colors.onPrimary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _getSubtitle(section),
                  style: TextStyle(
                    color: colors.onSurface.withOpacity(0.7),
                    fontSize: 16,
                  ),
                ),
                if (section == "contactos") ...[
                  const SizedBox(height: 20),
                  _buildMediaIcons(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Acción enviar mensaje
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(_getButton(section)),
                  ),
                ],
                if (section == "descargas") ...[
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final String downloadUrl =
                          "https://github.com/Sebastian398/.exe/releases/download/v1.0.0/plantiq.msix";
                      final anchor = html.AnchorElement(href: downloadUrl)
                        ..download = "plantiq.exe"
                        ..style.display = 'none';
                      html.document.body!.append(anchor);
                      anchor.click();
                      anchor.remove();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(_getButton(section)),
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              height: 500,
              decoration: BoxDecoration(
                color: colors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/Foto.png",
                      width: 470,
                      height: 470,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    height: 100,
                    width: 100,
                    top: 70,
                    left: 90,
                    child: _badge(
                      "1+",
                      _t("years_irrigation"),
                      colors.primary,
                      Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 100,
                    child: _badge(
                      "1",
                      _t("active_systems"),
                      Colors.blue.shade700,
                      Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 120,
                    child: _badge(
                      "95%",
                      _t("customer_satisfaction"),
                      Colors.yellow,
                      Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.instagram),
          color: Colors.pinkAccent,
          onPressed: () {
            // Acción para Instagram
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.facebook),
          color: Colors.blue,
          onPressed: () {
            // Acción para Facebook
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.envelope),
          color: Colors.redAccent,
          onPressed: () {
            // Acción para Gmail
          },
        ),
      ],
    );
  }

  String _getTitle(String section) {
    final es = {
      "descargas": "DESCARGAS",
      "contactos": "CONTACTOS",
      "acerca": "ACERCA DE",
    };

    final en = {
      "descargas": "DOWNLOADS",
      "contactos": "CONTACTS",
      "acerca": "ABOUT",
    };

    return locale.languageCode == "es" ? es[section]! : en[section]!;
  }

  String _getSubtitle(String section) {
    final es = {
      "descargas":
          "Descarga nuestra aplicación para controlar tu sistema de riego inteligente. Ajusta horarios de riego, monitorea el consumo de agua. Incluye soporte para sensores IoT.",
      "contactos":
          "Contáctanos para soporte técnico, asesoría o más información sobre nuestro sistema. Estamos en Instagram, Facebook o envíanos un correo para ayudarte.",
      "acerca":
          "Nuestro sistema de riego inteligente está diseñado para optimizar el uso eficiente del agua mediante tecnología IoT avanzada. Monitorea condiciones del suelo y humedad para ajustar automáticamente los programas de riego, asegurando máxima productividad agrícola y sostenibilidad ambiental. Ofrece control remoto desde dispositivos inteligentes, estadisticas detalladas de humedad para prevenir pérdidas o desperdicios.",
    };

    final en = {
      "descargas":
          "Download our app to control your smart irrigation system. Adjust irrigation schedules, monitor water consumption. Includes support for IoT sensors.",
      "contactos":
          "Contact us for technical support, advice, or more information about our system. We're on Instagram, Facebook, or send us an email to help you.",
      "acerca":
          "Our smart irrigation system is designed to optimize efficient water use using advanced IoT technology. It monitors soil conditions and moisture to automatically adjust irrigation schedules, ensuring maximum agricultural productivity and environmental sustainability. It offers remote control from smart devices and detailed moisture statistics to prevent loss or waste.",
    };

    return locale.languageCode == "es" ? es[section]! : en[section]!;
  }

  String _getButton(String section) {
    final es = {
      "descargas": "Descargar",
      "contactos": "Enviar Mensaje",
      "acerca": "",
    };

    final en = {
      "descargas": "Download",
      "contactos": "Send Message",
      "acerca": "About",
    };

    return locale.languageCode == "es" ? es[section]! : en[section]!;
  }

  String _t(String key) {
    final es = {
      "years_irrigation": "Año de Irrigación",
      "active_systems": "Sistema Activo",
      "customer_satisfaction": "Clientes Satisfechos",
    };

    final en = {
      "years_irrigation": "Year Irrigation",
      "active_systems": "Active System",
      "customer_satisfaction": "Satisfied Clients",
    };

    return locale.languageCode == "es" ? es[key]! : en[key]!;
  }

  Widget _badge(String number, String label, Color bg, Color textColor) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
