import 'package:flutter/material.dart'; // Importa el paquete Flutter que proporciona las herramientas necesarias para crear la interfaz de usuario.

// Importa el modelo de datos que contiene la información de los partidos próximos.
import '../Model/up_coming_model.dart'; 

// Importa las constantes, incluyendo los colores definidos en otro archivo.
import 'package:futbol_app/constants.dart';

// Define la clase UpComingMatches que es un widget sin estado (StatelessWidget) 
// que muestra la información de un partido próximo.
class UpComingMatches extends StatelessWidget {
  const UpComingMatches({
    super.key,
    required this.upMatch, // El partido próximo que se pasará a este widget. Es requerido.
  });

  final UpcomingMatch upMatch; // Se define una propiedad llamada upMatch de tipo UpcomingMatch que contiene la información del partido.

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Detecta gestos de interacción (como tap). Permite que el widget responda a toques.
      child: Stack( // Stack permite apilar widgets encima de otros.
        children: [
          Container( // Contenedor principal del widget, con estilo y márgenes.
            margin: const EdgeInsets.only(top: 5, bottom: 5), // Márgenes superior e inferior para separar el contenedor de otros widgets.
            width: double.infinity, // El contenedor ocupa todo el ancho disponible.
            padding: const EdgeInsets.symmetric( // Agrega relleno simétrico en los lados y verticalmente.
              horizontal: 10,
              vertical: 15,
            ),
            decoration: BoxDecoration( // Define la decoración del contenedor, incluyendo bordes, color de fondo y sombra.
              borderRadius: BorderRadius.circular(25), // Redondea las esquinas del contenedor.
              color: Colors.white, // Color de fondo del contenedor.
              boxShadow: [ // Añade una sombra para dar un efecto de profundidad.
                BoxShadow(
                  offset: const Offset(0, -5), // Desplaza la sombra hacia arriba.
                  color: upMatch.isFavorite ? kprimaryColor : Colors.black12, // Si el partido es favorito, usa el color primario, sino, sombra gris.
                ),
              ],
            ),
            child: Row( // Organiza los widgets dentro de una fila.
              children: [
                Text( // Muestra el título del equipo local.
                  upMatch.homeTitle, 
                  style: TextStyle(
                    fontSize: 16.5, // Tamaño de la fuente para el título.
                    letterSpacing: -1, // Espaciado entre las letras.
                    fontWeight: FontWeight.bold, // Define el grosor de la fuente.
                    color: Colors.grey.shade700, // Color del texto del equipo local (gris).
                  ),
                ),
                const Spacer(), // Espaciado flexible entre los widgets de la fila.
                Column( // Crea una columna para mostrar el logo y el texto "Home".
                  children: [
                    Image.asset( // Muestra el logo del equipo local.
                      upMatch.homeLogo,
                      height: 45, // Tamaño del logo.
                      width: 45, // Tamaño del logo.
                    ),
                    const Text(
                      "Home", // Texto "Home" debajo del logo.
                      style: TextStyle(fontSize: 11, letterSpacing: -1),
                    ),
                  ],
                ),
                const SizedBox(width: 10), // Añade espacio entre los elementos.
                Column( // Crea una columna para mostrar la hora y la fecha del partido.
                  children: [
                    Text(
                      upMatch.time, // Muestra la hora del partido.
                      style: const TextStyle(
                        fontSize: 18,
                        letterSpacing: -1,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Color negro para la hora.
                      ),
                    ),
                    Text(
                      upMatch.date, // Muestra la fecha del partido.
                      style: const TextStyle(
                        fontSize: 12, // Tamaño más pequeño para la fecha.
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 10), // Añade espacio entre los elementos.
                Column( // Crea una columna para mostrar el logo y el texto "Away".
                  children: [
                    Image.asset( // Muestra el logo del equipo visitante.
                      upMatch.awayLogo,
                      height: 45, // Tamaño del logo.
                      width: 45, // Tamaño del logo.
                    ),
                    const Text(
                      "Away", // Texto "Away" debajo del logo.
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                ),
                const Spacer(), // Espaciado flexible entre los widgets de la fila.
                Text( // Muestra el título del equipo visitante.
                  upMatch.awayTitle,
                  style: TextStyle(
                    fontSize: 16.5,
                    letterSpacing: -1,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700, // Color gris para el equipo visitante.
                  ),
                ),
              ],
            ),
          ),
          Positioned( // Posiciona el icono de estrella en la parte superior izquierda.
              top: 12,
              left: 12,
              child: Icon( // Icono de estrella para indicar si el partido es favorito.
                Icons.star,
                color: upMatch.isFavorite ? kprimaryColor : Colors.white, // Si es favorito, el icono es de color primario, sino blanco.
              ))
        ],
      ),
    );
  }
}
