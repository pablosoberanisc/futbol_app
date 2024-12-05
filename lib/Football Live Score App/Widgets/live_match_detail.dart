import 'package:flutter/material.dart'; // Importa el paquete Flutter para crear la interfaz de usuario.
import '../screens/match_detail_screen.dart'; // Importa la pantalla de detalles del partido.
import 'package:futbol_app/constants.dart'; // Importa las constantes del proyecto, como los colores.

class LiveMatchDetail extends StatelessWidget {
  const LiveMatchDetail({
    super.key,
    required this.widget,
  });

  final MatchDetailScreen widget; // Recibe el widget MatchDetailScreen como argumento.

  @override
  Widget build(BuildContext context) {
    return Positioned( // Coloca este widget en una posición específica dentro de un Stack.
      top: 25,
      left: 25,
      right: 25,
      child: Container( // Contenedor principal del detalle del partido.
        height: 250, // Altura del contenedor.
        width: double.infinity, // El contenedor ocupa todo el ancho disponible.
        decoration: BoxDecoration( // Aplica un fondo y bordes redondeados al contenedor.
          color: widget.liveMatch.color, // Usa el color del partido en vivo.
          borderRadius: BorderRadius.circular(25), // Bordes redondeados de 25 píxeles.
        ),
        child: Stack( // Utiliza un Stack para apilar widgets uno sobre otro.
          children: [
            Positioned( // Coloca un widget en una posición específica dentro del Stack.
              bottom: -230, // Lo coloca fuera de la parte inferior del contenedor principal.
              child: Transform.rotate( // Rota la imagen para darle un efecto visual.
                angle: 45, // Rota 45 grados.
                child: Opacity( // Aplica opacidad a la imagen para un efecto sutil.
                  opacity: 0.2, // La opacidad de la imagen es del 20%.
                  child: Image.asset( // Muestra una imagen de fútbol.
                    "assets/football/cl.png",
                  ),
                ),
              ),
            ),
            Padding( // Añade relleno alrededor de los widgets dentro del contenedor.
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Column( // Organiza los widgets verticalmente en una columna.
                children: [
                  Text( // Muestra el nombre del estadio del partido.
                    widget.liveMatch.stadium,
                    style: TextStyle(
                      fontSize: 15, // Tamaño de la fuente.
                      color: widget.liveMatch.textColors, // Color del texto basado en el tema del partido.
                      fontWeight: FontWeight.bold, // El texto estará en negrita.
                    ),
                  ),
                  const SizedBox(height: 25), // Espacio entre los widgets.
                  Row( // Organiza los widgets en una fila horizontal.
                    children: [
                      Image.asset( // Muestra el logo del equipo local.
                        widget.liveMatch.homeLogo,
                        width: 90,
                        height: 90,
                      ),
                      const Spacer(), // Deja espacio libre entre los elementos.
                      Column( // Columna para los elementos del centro.
                        children: [
                          Container( // Contenedor para el estado "Live".
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration( // Fondo amarillo para resaltar el texto "Live".
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffFFF4E5),
                            ),
                            child: const Row( // Fila que contiene el ícono y el texto "Live".
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: kprimaryColor, // Color del ícono "Live".
                                  size: 10,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Live", // Texto que indica que el partido está en vivo.
                                  style: TextStyle(
                                    color: kprimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10), // Espacio entre el estado "Live" y el marcador.
                          Text.rich( // Muestra el marcador con los goles de ambos equipos.
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.liveMatch.homeGoal.toString(), // Goles del equipo local.
                                  style: TextStyle(
                                    fontSize: 36, // Tamaño de la fuente.
                                    fontWeight: FontWeight.bold, // Negrita para los goles.
                                    color: widget.liveMatch.onTheWinner
                                        ? kprimaryColor // Color si el equipo local está ganando.
                                        : widget.liveMatch.textColors, // Color si el equipo local no está ganando.
                                  ),
                                ),
                                TextSpan(
                                  text: " : ${widget.liveMatch.awayGoal}", // Goles del equipo visitante.
                                  style: TextStyle(
                                    fontSize: 36, // Tamaño de la fuente.
                                    fontWeight: FontWeight.bold, // Negrita para los goles.
                                    color: widget.liveMatch.onTheWinner
                                        ? widget.liveMatch.textColors // Color si el equipo local está ganando.
                                        : kprimaryColor, // Color si el equipo visitante está ganando.
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(), // Espacio entre los elementos.
                      Image.asset( // Muestra el logo del equipo visitante.
                        widget.liveMatch.awayLogo,
                        width: 90,
                        height: 90,
                      ),
                    ],
                  ),
                  const Spacer(), // Deja espacio en la parte inferior.
                  SizedBox( // Tamaño del contenedor para los indicadores de tiempo.
                    height: 20,
                    child: Stack( // Apila los widgets para el marcador de tiempo.
                      children: [
                        Container( // Fondo blanco para la barra de progreso.
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 15,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        Positioned( // Indicador de la parte del partido que se está jugando.
                          right: 50,
                          left: 0,
                          top: 0,
                          bottom: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kprimaryColor, // Color de la barra de progreso.
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        Positioned( // Texto "ST" para el inicio del partido (Start).
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              "ST", // Indica que el partido está en su inicio (Start).
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned( // Texto "HT" para el medio tiempo (Half Time).
                          top: 0,
                          right: MediaQuery.of(context).size.width / 2 - MediaQuery.of(context).size.width / 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Text(
                              "HT", // Indica el medio tiempo.
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned( // Texto "FT" para el final del partido (Full Time).
                          top: -1,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Text(
                              "FT", // Indica el final del partido (Full Time).
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black12, // Color tenue para el "FT".
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
