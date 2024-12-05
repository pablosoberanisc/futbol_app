import 'package:flutter/material.dart'; // Importa el paquete Flutter necesario para crear la interfaz de usuario.
import 'package:futbol_app/constants.dart'; // Importa las constantes definidas en otro archivo, como los colores.

// Define la clase LiveMatchStats, que es un widget sin estado (StatelessWidget) 
// que muestra las estadísticas de un partido en vivo.
class LiveMatchStats extends StatelessWidget {
  final int homeStats, awayStats; // Estadísticas del equipo local y visitante.
  final String title; // El título de la estadística (por ejemplo, goles, posesión, etc.).
  final bool isHomeWinner; // Indica si el equipo local está ganando.
  final double homeValue, awayValue; // Valores que se usarán en la barra de progreso para mostrar las estadísticas de cada equipo.
  
  // Constructor que recibe todos los valores necesarios para mostrar las estadísticas.
  const LiveMatchStats(
      {super.key,
      required this.homeStats,
      required this.awayStats,
      required this.title,
      required this.homeValue,
      required this.awayValue,
      required this.isHomeWinner});

  @override
  Widget build(BuildContext context) {
    return Padding( // Añade un relleno alrededor del widget.
      padding: const EdgeInsets.symmetric(vertical: 14), // Relleno vertical de 14 píxeles.
      child: Column( // Organiza los widgets verticalmente dentro de una columna.
        children: [
          Row( // Organiza los widgets horizontalmente en una fila.
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye el espacio de manera equitativa entre los widgets.
            children: [
              Text( // Muestra las estadísticas del equipo local.
                homeStats.toString(), // Convierte las estadísticas a cadena de texto.
                style: TextStyle(
                  color: isHomeWinner ? kprimaryColor : ksecondryColor, // Usa color primario si el equipo local está ganando, de lo contrario usa el color secundario.
                  fontSize: 16, // Tamaño de la fuente.
                  letterSpacing: -1, // Espaciado entre letras.
                  fontWeight: FontWeight.bold, // Peso de la fuente (negrita).
                ),
              ),
              Text( // Muestra el título de la estadística (por ejemplo, "Goles").
                title,
                style: const TextStyle(
                  fontSize: 16, // Tamaño de la fuente.
                  color: Colors.black, // Color negro para el título.
                ),
              ),
              Text( // Muestra las estadísticas del equipo visitante.
                awayStats.toString(), // Convierte las estadísticas a cadena de texto.
                style: TextStyle(
                  color: !isHomeWinner ? kprimaryColor : ksecondryColor, // Usa color primario si el equipo visitante está ganando, de lo contrario usa el color secundario.
                  fontSize: 16, // Tamaño de la fuente.
                  letterSpacing: -1, // Espaciado entre letras.
                  fontWeight: FontWeight.bold, // Peso de la fuente (negrita).
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Añade un espacio de 10 píxeles entre los widgets.
          Row( // Fila para mostrar las barras de progreso de las estadísticas.
            mainAxisSize: MainAxisSize.max, // Ajusta el tamaño máximo para que los widgets llenen el espacio disponible.
            children: [
              Expanded( // Expande este widget para que ocupe el espacio disponible.
                child: RotatedBox( // Rota la barra de progreso 180 grados.
                  quarterTurns: 2, // Rota la barra de progreso a 180 grados.
                  child: LinearProgressIndicator( // Muestra una barra de progreso lineal.
                    value: homeValue, // Establece el valor de la barra de progreso para el equipo local.
                    minHeight: 10, // Define la altura mínima de la barra de progreso.
                    backgroundColor: Colors.grey.shade200, // Color de fondo de la barra.
                    valueColor: AlwaysStoppedAnimation(
                      isHomeWinner ? kprimaryColor : ksecondryColor, // Color de la barra, depende de si el equipo local está ganando.
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10), // Añade un espacio de 10 píxeles entre las barras de progreso.
              Expanded( // Expande este widget para que ocupe el espacio disponible.
                child: LinearProgressIndicator( // Muestra una barra de progreso lineal.
                  value: awayValue, // Establece el valor de la barra de progreso para el equipo visitante.
                  minHeight: 10, // Define la altura mínima de la barra de progreso.
                  backgroundColor: Colors.grey.shade200, // Color de fondo de la barra.
                  valueColor: AlwaysStoppedAnimation(
                    !isHomeWinner ? kprimaryColor : ksecondryColor, // Color de la barra, depende de si el equipo visitante está ganando.
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
