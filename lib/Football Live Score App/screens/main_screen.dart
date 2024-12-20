import 'package:flutter/material.dart'; // Importa widgets y funcionalidades principales de Flutter.
import 'app_home_screen.dart'; // Importa la pantalla principal de la aplicación.
import 'package:futbol_app/constants.dart'; // Importa constantes definidas en el proyecto.
import 'package:iconsax/iconsax.dart'; // Importa un paquete de iconos personalizados.

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key}); // Define un widget con estado para la pantalla principal.

  @override
  State<AppMainScreen> createState() => _AppMainScreenState(); // Asocia el estado con este widget.
}

class _AppMainScreenState extends State<AppMainScreen> {
  int currentTab = 0; // Controla la pestaña actualmente activa.
  final List<Widget> screens = [ // Lista de pantallas asociadas a cada pestaña.
    const AppHomeScreen(), // Pantalla principal
    const Scaffold(), // Placeholder para futuras pantallas
    const Scaffold(), // Placeholder para futuras pantallas
    const Scaffold(), // Placeholder para futuras pantallas
  ];
  final icons = [ // Lista de iconos para las pestañas.
    Iconsax.home, // Ícono de inicio
    Iconsax.calendar_1, // Ícono de calendario
    Iconsax.chart, // Ícono de gráficos
    Icons.person_outline // Ícono de cuenta
  ];
  final titles = [ // Títulos asociados a las pestañas.
    "Home", // Título de la pestaña de inicio
    "Calendar", // Título de la pestaña de calendario
    "Standing", // Título de la pestaña de clasificación
    "Account", // Título de la pestaña de cuenta
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define la barra de navegación inferior.
      bottomNavigationBar: Container(
        height: 80, // Altura de la barra de navegación.
        padding: const EdgeInsets.only(top: 10), // Espaciado superior.
        decoration: BoxDecoration(
          color: Colors.white, // Fondo blanco.
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.015), // Sombra sutil.
              blurRadius: 8, // Desenfoque de la sombra.
              spreadRadius: 5, // Extensión de la sombra.
            ),
          ],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30), // Bordes redondeados en la parte superior.
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribuye los ítems uniformemente.
          children: List.generate(4, (index) {
            // Genera los ítems de la barra según la cantidad de pestañas.
            return MyBottomNavBarItems(
              title: titles[index], // Título del ítem.
              icon: icons[index], // Icono del ítem.
              isActive: currentTab == index, // Marca el ítem activo.
              onTab: () => setState(() => currentTab = index), // Cambia la pestaña activa.
            );
          }),
        ),
      ),
      body: screens[currentTab], // Muestra la pantalla correspondiente a la pestaña activa.
    );
  }
}

class MyBottomNavBarItems extends StatelessWidget {
  final String title; // Título del ítem.
  final bool isActive; // Determina si el ítem está activo.
  final Function() onTab; // Callback para cambiar la pestaña activa.
  final IconData icon; // Icono del ítem.
  const MyBottomNavBarItems({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTab,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab, // Cambia la pestaña activa al hacer clic.
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100), // Duración de la animación de cambio.
        padding: const EdgeInsets.all(10), // Espaciado interno.
        decoration: BoxDecoration(
          color: isActive ? kprimaryColor : Colors.white, // Color según estado activo.
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20), // Bordes redondeados superiores.
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon, // Muestra el icono correspondiente.
              color: isActive ? Colors.white : Colors.grey.shade400, // Color según estado (activo o inactivo).
            ),
            if (isActive) // Muestra el título solo si está activo.
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white, // Color blanco para el texto del título.
                  fontSize: 14, // Tamaño de la fuente del título.
                ),
              )
          ],
        ),
      ),
    );
  }
}

