import 'package:flutter/material.dart';
import '../Model/live_match_model.dart'; // Importa el modelo de un partido en vivo
import '../Widgets/live_match_stats.dart'; // Importa el widget para mostrar estadísticas de partidos
import 'package:futbol_app/constants.dart'; // Importa las constantes de la app
import 'package:iconsax/iconsax.dart'; // Importa los íconos de la librería Iconsax

import '../Widgets/live_match_detail.dart'; // Importa el widget de detalles del partido

class MatchDetailScreen extends StatefulWidget {
  final LiveMatch liveMatch; // La clase que contiene los detalles del partido en vivo
  const MatchDetailScreen({super.key, required this.liveMatch}); // Constructor que recibe los detalles del partido

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState(); // Crea el estado del widget
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  // Lista que contiene las etiquetas de las pestañas
  List<Map<String, dynamic>> tabs = [
    {
      "label": "Stats", // "Estadísticas"
    },
    {
      "label": "H2H", // "Cara a cara"
    },
    {
      "label": "Table", // "Tabla"
    },
  ];
  int selectedIndex = 0; // Índice de la pestaña seleccionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: detailBackgroundColor, // Color de fondo del detalle
      appBar: headerParts(context), // AppBar con detalles específicos
      body: SingleChildScrollView( // Permite desplazarse por la pantalla
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 120), // Margen superior
              padding: const EdgeInsets.only(top: 180, right: 20, left: 20), // Espaciado dentro del contenedor
              decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30), // Borde superior redondeado
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300, // Sombra gris
                      blurRadius: 40, // Desenfoque de la sombra
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Alineación central
                    children: List.generate(
                      tabs.length, // Genera una pestaña por cada elemento en la lista "tabs"
                      (index) {
                        final tab = tabs[index]; // Obtiene la información de la pestaña
                        return Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? kprimaryColor // Color principal si la pestaña está seleccionada
                                : detailBackgroundColor, // Fondo predeterminado
                            borderRadius: BorderRadius.circular(10), // Bordes redondeados
                          ),
                          margin: const EdgeInsets.only(right: 10), // Espaciado derecho entre pestañas
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10, // Padding dentro del contenedor de cada pestaña
                          ),
                          child: Text(
                            tab["label"], // Texto de la pestaña
                            style: TextStyle(
                                fontSize: 16, // Tamaño de la fuente
                                fontWeight: FontWeight.bold, // Negrita
                                color: selectedIndex == index
                                    ? Colors.white // Color blanco si está seleccionada
                                    : Colors.grey), // Gris si no está seleccionada
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20), // Espaciado entre el row y los widgets siguientes
                  // Widget para mostrar estadísticas de disparos a puerta
                  LiveMatchStats(
                    homeStats: widget.liveMatch.shotOnTarget, // Estadísticas del equipo local
                    awayStats: widget.liveMatch.shotOnTarget * 2, // Estadísticas del equipo visitante
                    title: "Shots On Target", // Título de la estadística
                    homeValue: widget.liveMatch.shotOnTarget.toDouble() / 10, // Valor del equipo local
                    awayValue: widget.liveMatch.shotOnTarget.toDouble() * 2 / 10, // Valor del equipo visitante
                    isHomeWinner: false, // Indica si el equipo local es el ganador
                  ),
                  // Widget para mostrar estadísticas de goles
                  LiveMatchStats(
                    homeStats: widget.liveMatch.homeGoal, // Goles del equipo local
                    awayStats: widget.liveMatch.awayGoal, // Goles del equipo visitante
                    title: "Goals", // Título de la estadística
                    homeValue: widget.liveMatch.homeGoal.toDouble() / 5, // Valor del equipo local
                    awayValue: widget.liveMatch.awayGoal.toDouble() * 2 / 5, // Valor del equipo visitante
                    isHomeWinner: true, // Indica si el equipo local es el ganador
                  ),
                  // Widget para mostrar estadísticas de posesión
                  LiveMatchStats(
                    homeStats: widget.liveMatch.possession, // Posesión del equipo local
                    awayStats: 100 - widget.liveMatch.possession, // Posesión del equipo visitante
                    title: "Possession", // Título de la estadística
                    homeValue: widget.liveMatch.possession.toDouble() * 1.1 / 100, // Valor del equipo local
                    awayValue: widget.liveMatch.possession.toDouble() / 100, // Valor del equipo visitante
                    isHomeWinner: true, // Indica si el equipo local es el ganador
                  ),
                  // Widget para mostrar estadísticas de tarjetas amarillas
                  LiveMatchStats(
                    homeStats: widget.liveMatch.yelloCard, // Tarjetas amarillas del equipo local
                    awayStats: widget.liveMatch.yelloCard + 1, // Tarjetas amarillas del equipo visitante
                    title: "Yellow Cards", // Título de la estadística
                    homeValue: widget.liveMatch.yelloCard.toDouble() / 10, // Valor del equipo local
                    awayValue: widget.liveMatch.yelloCard.toDouble() * 2 / 10, // Valor del equipo visitante
                    isHomeWinner: false, // Indica si el equipo local es el ganador
                  ),
                  // Widget para mostrar estadísticas de tarjetas rojas
                  LiveMatchStats(
                    homeStats: widget.liveMatch.redCard - 1, // Tarjetas rojas del equipo local
                    awayStats: widget.liveMatch.redCard, // Tarjetas rojas del equipo visitante
                    title: "Red Cards", // Título de la estadística
                    homeValue: widget.liveMatch.redCard.toDouble() / 10, // Valor del equipo local
                    awayValue: widget.liveMatch.redCard.toDouble() * 2 / 10, // Valor del equipo visitante
                    isHomeWinner: false, // Indica si el equipo local es el ganador
                  ),
                  // Widget para mostrar estadísticas de córneres
                  LiveMatchStats(
                    homeStats: widget.liveMatch.corner, // Córneres del equipo local
                    awayStats: widget.liveMatch.corner - 1, // Córneres del equipo visitante
                    title: "Corner Kicks", // Título de la estadística
                    homeValue: widget.liveMatch.redCard.toDouble() / 5, // Valor del equipo local
                    awayValue: widget.liveMatch.redCard.toDouble() / 5, // Valor del equipo visitante
                    isHomeWinner: true, // Indica si el equipo local es el ganador
                  ),
                ],
              ),
            ),
            LiveMatchDetail(widget: widget), // Detalles del partido en vivo
          ],
        ),
      ),
    );
  }

  AppBar headerParts(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // No muestra el ícono de retroceso automáticamente
      centerTitle: true, // Centra el título en la barra de navegación
      backgroundColor: detailBackgroundColor, // Color de fondo de la AppBar
      actions: [
        const SizedBox(width: 20), // Espaciado antes del ícono de retroceso
        Padding(
          padding: const EdgeInsets.all(5),
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(10), // Bordes redondeados en el botón
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // Bordes redondeados en el contenedor
              ),
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navega hacia atrás
                },
                child: const Icon(Iconsax.arrow_square_left), // Ícono de retroceso
              ),
            ),
          ),
        ),
        const Spacer(), // Espaciador entre los elementos
        const Column(
          children: [
            Text(
              "Champions League", // Título del torneo
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600, // Peso de la fuente
                letterSpacing: -1, // Espaciado entre letras
              ),
            ),
            Text(
              "GROUP STAGE", // Fase de grupo
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey, // Color gris para el subtítulo
                letterSpacing: -1, // Espaciado entre letras
              ),
            )
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(10), // Bordes redondeados en el botón
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // Bordes redondeados en el contenedor
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Iconsax.more_square), // Ícono de más opciones
            ),
          ),
        ),
        const SizedBox(width: 20), // Espaciado final
      ],
    );
  }
}
