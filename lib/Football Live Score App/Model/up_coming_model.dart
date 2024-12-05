// Definición de la clase para representar un partido futuro.
class UpcomingMatch {
  final String awayLogo; // Logo del equipo visitante.
  final String awayTitle; // Nombre del equipo visitante.
  final String homeLogo; // Logo del equipo local.
  final String homeTitle; // Nombre del equipo local.
  final String date; // Fecha del partido.
  final String time; // Hora del partido.
  final bool isFavorite; // Indicador de si el partido es favorito.

  // Constructor de la clase UpcomingMatch.
  UpcomingMatch({
    required this.awayLogo, // Requiere el logo del equipo visitante.
    required this.awayTitle, // Requiere el nombre del equipo visitante.
    required this.homeLogo, // Requiere el logo del equipo local.
    required this.homeTitle, // Requiere el nombre del equipo local.
    required this.date, // Requiere la fecha del partido.
    required this.time, // Requiere la hora del partido.
    required this.isFavorite, // Requiere el indicador de favorito.
  });
}

// Lista de partidos futuros, cada uno de tipo UpcomingMatch.
List<UpcomingMatch> upcomingMatches = [
  UpcomingMatch(
    awayLogo: "assets/football/man_united.png", // Logo del equipo visitante (Man United).
    awayTitle: "Man United", // Nombre del equipo visitante.
    homeLogo: "assets/football/liverpool.png", // Logo del equipo local (Liverpool FC).
    homeTitle: "Liverpool FC", // Nombre del equipo local.
    date: "30 Dec", // Fecha del partido.
    time: "06 : 30", // Hora del partido.
    isFavorite: true, // El partido es favorito.
  ),
  UpcomingMatch(
    awayLogo: "assets/football/swansea.png", // Logo del equipo visitante (Tottenham).
    awayTitle: "Tottenham", // Nombre del equipo visitante.
    homeLogo: "assets/football/tottenham.png", // Logo del equipo local (Swansea AFC).
    homeTitle: "Swansea AFC", // Nombre del equipo local.
    date: "30 Dec", // Fecha del partido.
    time: "06 : 30", // Hora del partido.
    isFavorite: false, // El partido no es favorito.
  ),
  UpcomingMatch(
    awayLogo: "assets/football/stoke.png", // Logo del equipo visitante (Stoke City).
    awayTitle: "Stoke City", // Nombre del equipo visitante.
    homeLogo: "assets/football/arsenal.png", // Logo del equipo local (Arsenal).
    homeTitle: "Arsenal", // Nombre del equipo local.
    date: "30 Dec", // Fecha del partido.
    time: "06 : 30", // Hora del partido.
    isFavorite: false, // El partido no es favorito.
  ),
  UpcomingMatch(
    awayLogo: "assets/football/southampton.png", // Logo del equipo visitante (Southampton).
    awayTitle: "Southampton", // Nombre del equipo visitante.
    homeLogo: "assets/football/sunderland.png", // Logo del equipo local (Sunderland).
    homeTitle: "Sunderland", // Nombre del equipo local.
    date: "30 Dec", // Fecha del partido.
    time: "06 : 30", // Hora del partido.
    isFavorite: false, // El partido no es favorito.
  ),
];
