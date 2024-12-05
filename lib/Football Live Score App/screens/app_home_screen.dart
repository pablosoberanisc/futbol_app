import 'package:flutter/material.dart';
import '../Model/live_match_model.dart'; // Importa el modelo de partidos en vivo.
import '../Model/up_coming_model.dart'; // Importa el modelo de partidos futuros.
import '../screens/match_detail_screen.dart'; // Importa la pantalla de detalles del partido.
import 'package:futbol_app/constants.dart'; // Importa las constantes definidas en el proyecto.
import 'package:iconsax/iconsax.dart'; // Importa un paquete de iconos personalizados.

import '../Widgets/live_match.dart'; // Importa el widget de partido en vivo.
import '../Widgets/up_coming_match.dart'; // Importa el widget de partido futuro.

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key}); // Define el widget de la pantalla principal.

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState(); // Crea el estado asociado con el widget.
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco para la pantalla.
      appBar: headerParts(), // Llama a la función para construir la AppBar.
      body: Column(
        children: [
          liveMatchText(), // Muestra el texto "Live Match".
          SizedBox(
            height: 230, // Define la altura del contenedor que tiene los partidos en vivo.
            child: ListView.builder(
              itemCount: liveMatches.length, // Contador de los partidos en vivo.
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20), // Espaciado a la izquierda.
              scrollDirection: Axis.horizontal, // La lista se desplaza horizontalmente.
              itemBuilder: (context, index) {
                final live = liveMatches[index]; // Obtiene el partido en vivo actual.
                return GestureDetector(
                  onTap: () {
                    // Redirige a la pantalla de detalles del partido al hacer clic.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MatchDetailScreen(liveMatch: live),
                      ),
                    );
                  },
                  child: LiveMatchData(live: live), // Muestra los datos del partido en vivo.
                );
              },
            ),
          ),
          // Para mostrar los partidos futuros.
          Padding(
            padding: const EdgeInsets.all(20), // Espaciado alrededor.
            child: Row(
              children: [
                const Text(
                  "Up-Coming Matches", // Título para los partidos futuros.
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    letterSpacing: -1.5,
                    color: Colors.black54,
                  ),
                ),
                const Spacer(), // Espacio entre el texto y el botón.
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: kprimaryColor, // Color del texto del botón.
                  ),
                  onPressed: () {},
                  child: const Text(
                    "See all", // Texto del botón.
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), // Espaciado horizontal.
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(), // Permite el desplazamiento siempre.
                itemCount: upcomingMatches.length, // Contador de los partidos futuros.
                itemBuilder: (context, index) {
                  final upMatch = upcomingMatches[index]; // Obtiene el partido futuro.
                  return UpComingMatches(upMatch: upMatch); // Muestra los datos del partido futuro.
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Función para mostrar el texto de "Live Match" y los detalles del campeonato.
  Padding liveMatchText() {
    return Padding(
      padding: const EdgeInsets.all(20), // Espaciado alrededor.
      child: Row(
        children: [
          const Text(
            "Live Match", // Texto "Live Match".
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.black54,
              letterSpacing: -1.5,
            ),
          ),
          const Spacer(), // Espacio entre el texto y el contenedor.
          Container(
            padding: const EdgeInsets.all(8), // Espaciado interno.
            decoration: BoxDecoration(
              color: Colors.white, // Fondo blanco.
              borderRadius: BorderRadius.circular(20), // Bordes redondeados.
              boxShadow: [
                BoxShadow(
                  blurRadius: 20, // Sombra difusa.
                  color: Colors.black12.withOpacity(0.08), // Color de la sombra.
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/football/pl.png", // Imagen del logo de la liga.
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 3), // Espaciado entre la imagen y el texto.
                const Text(
                  "Premier League", // Texto del campeonato.
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 5), // Espaciado entre el texto y el icono.
                const Icon(Icons.keyboard_arrow_down_outlined), // Ícono de flecha hacia abajo.
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Función que construye la AppBar (barra superior).
  AppBar headerParts() {
    return AppBar(
      backgroundColor: Colors.white, // Fondo blanco para la AppBar.
      actions: [
        const SizedBox(width: 20), // Espaciado antes de los íconos de acción.
        Padding(
          padding: const EdgeInsets.all(5), // Espaciado alrededor del ícono.
          child: Material(
            elevation: 0.2,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8), // Espaciado interno.
              child: const Icon(Iconsax.category), // Ícono de categoría.
            ),
          ),
        ),
        const Spacer(), // Espacio entre los íconos.
        const Row(
          children: [
            Text(
              "S", // Letra "S" en el logo de la aplicación.
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                letterSpacing: -2,
              ),
            ),
            Icon(
              Icons.sports_soccer,
              color: kprimaryColor, // Color del ícono de fútbol.
              size: 25,
            ),
            Text(
              "ccer", // Texto "ccer" en el logo.
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: -2,
              ),
            ),
            Text(
              " Nerds", // Texto "Nerds" en el logo.
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: kprimaryColor,
                letterSpacing: -2,
              ),
            ),
          ],
        ),
        const Spacer(), // Espacio entre el logo y los íconos.
        Padding(
          padding: const EdgeInsets.all(5), // Espaciado alrededor del ícono de notificaciones.
          child: Material(
            elevation: 0.2,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8), // Espaciado interno.
              child: const Stack(
                children: [
                  Icon(Iconsax.notification), // Ícono de notificaciones.
                  Positioned(
                    right: 4,
                    child: CircleAvatar(
                      radius: 4, // Tamaño del círculo indicador de notificaciones.
                      backgroundColor: kprimaryColor, // Color del indicador.
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20), // Espaciado final.
      ],
    );
  }
}
