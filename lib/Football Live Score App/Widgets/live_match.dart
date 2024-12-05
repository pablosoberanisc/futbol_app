import 'package:flutter/material.dart'; // Importa el paquete Flutter necesario para crear la interfaz de usuario.

// Importa el modelo de datos que contiene la información de los partidos en vivo.
import '../Model/live_match_model.dart'; 

// Importa las constantes, incluyendo los colores definidos en otro archivo.
import 'package:futbol_app/constants.dart';

// Define la clase LiveMatchData que es un widget sin estado (StatelessWidget) 
// que muestra la información de un partido en vivo.
class LiveMatchData extends StatelessWidget {
  const LiveMatchData({
    super.key,
    required this.live, // El partido en vivo que se pasará a este widget. Es requerido.
  });

  final LiveMatch live; // Se define una propiedad llamada live de tipo LiveMatch que contiene la información del partido en vivo.

  @override
  Widget build(BuildContext context) {
    return Container( // Contenedor principal del widget, con estilo y márgenes.
      height: 230, // Define la altura del contenedor.
      margin: const EdgeInsets.only(right: 20), // Añade un margen derecho de 20 píxeles.
      padding: const EdgeInsets.symmetric( // Añade relleno simétrico en los lados y verticalmente.
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration( // Define la decoración del contenedor, incluyendo color, bordes redondeados y fondo de imagen.
        color: live.color, // Color de fondo que se pasa desde el modelo de datos del partido.
        borderRadius: BorderRadius.circular(35), // Redondea las esquinas del contenedor con un radio de 35 píxeles.
        image: live.backgroundImage, // Añade una imagen de fondo que se pasa desde el modelo de datos.
      ),
      child: Column( // Organiza los widgets verticalmente dentro del contenedor.
        children: [
          Text( // Muestra el nombre del estadio.
            live.stadium, 
            style: TextStyle(
              fontSize: 16, // Tamaño de la fuente para el nombre del estadio.
              fontWeight: FontWeight.w600, // Peso de la fuente (semi negrita).
              color: live.textColors, // Color del texto que se pasa desde el modelo de datos.
              letterSpacing: -1, // Espaciado entre letras.
            ),
          ),
          Text( // Muestra la semana del partido ("Week 13").
            "Week 13", 
            style: TextStyle(
              color: live.textColors, // Color del texto.
              letterSpacing: -1, // Espaciado entre letras.
              fontSize: 11, // Tamaño de la fuente.
            ),
          ),
          const SizedBox(height: 10), // Añade espacio entre los widgets.
          Row( // Organiza los widgets de manera horizontal dentro de una fila.
            crossAxisAlignment: CrossAxisAlignment.start, // Alinea los widgets al inicio de la fila (arriba).
            children: [
              // Columna para el logo y nombre del equipo local
              Column(
                children: [
                  Image.asset( // Muestra el logo del equipo local.
                    live.homeLogo,
                    height: 90, // Tamaño del logo.
                    width: 90, // Tamaño del logo.
                  ),
                  const SizedBox(height: 10), // Añade espacio entre los widgets.
                  Text(
                    live.homeTitle.toUpperCase(), // Muestra el nombre del equipo local en mayúsculas.
                    style: TextStyle(
                      color: live.textColors, // Color del texto del equipo local.
                      fontSize: 16, // Tamaño de la fuente.
                      fontWeight: FontWeight.w500, // Peso de la fuente.
                      letterSpacing: -1, // Espaciado entre letras.
                    ),
                  ),
                  Text( // Muestra el texto "Home" debajo del logo.
                    "Home", 
                    style: TextStyle(
                      fontSize: 13, // Tamaño de la fuente.
                      color: live.textColors, // Color del texto.
                      letterSpacing: -1, // Espaciado entre letras.
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20), // Añade espacio entre las columnas.
              // Columna para la hora y el marcador del partido
              Column(
                children: [
                  const SizedBox(height: 5), // Añade un pequeño espacio antes de la hora.
                  Text(
                    "${live.time}'", // Muestra el tiempo del partido en minutos.
                    style: TextStyle(
                      fontSize: 14, // Tamaño de la fuente.
                      color: live.textColors, // Color del texto.
                    ),
                  ),
                  const SizedBox(height: 5), // Añade un pequeño espacio entre el tiempo y el marcador.
                  Text.rich( // Muestra el marcador con texto enriquecido, permitiendo dos colores diferentes.
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${live.homeGoal} : ", // Marcador del equipo local.
                          style: TextStyle(
                            fontSize: 36, // Tamaño grande para el marcador.
                            fontWeight: FontWeight.bold, // Negrita para el marcador.
                            color: live.onTheWinner ? kprimaryColor : live.textColors, // Si el equipo local está ganando, el marcador es de color primario.
                          ),
                        ),
                        TextSpan(
                          text: live.awayGoal.toString(), // Marcador del equipo visitante.
                          style: TextStyle(
                            fontSize: 36, // Tamaño grande para el marcador.
                            fontWeight: FontWeight.bold, // Negrita para el marcador.
                            color: live.onTheWinner ? live.textColors : kprimaryColor, // Si el equipo visitante está ganando, el marcador es de color primario.
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20), // Añade espacio entre las columnas.
              // Columna para el logo y nombre del equipo visitante
              Column(
                children: [
                  Image.asset( // Muestra el logo del equipo visitante.
                    live.awayLogo,
                    height: 90, // Tamaño del logo.
                    width: 90, // Tamaño del logo.
                  ),
                  const SizedBox(height: 10), // Añade espacio entre los widgets.
                  Text(
                    live.awayTitle.toUpperCase(), // Muestra el nombre del equipo visitante en mayúsculas.
                    style: TextStyle(
                      color: live.textColors, // Color del texto del equipo visitante.
                      fontSize: 16, // Tamaño de la fuente.
                      fontWeight: FontWeight.w500, // Peso de la fuente.
                      letterSpacing: -1, // Espaciado entre letras.
                    ),
                  ),
                  Text( // Muestra el texto "Away" debajo del logo.
                    "Away", 
                    style: TextStyle(
                      fontSize: 13, // Tamaño de la fuente.
                      color: live.textColors, // Color del texto.
                      letterSpacing: -1, // Espaciado entre letras.
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
