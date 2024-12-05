import 'package:flutter/material.dart'; // Importa el paquete de Flutter que contiene las herramientas para crear interfaces de usuario. Proporciona widgets y herramientas para construir aplicaciones móviles.
import 'Football Live Score App/screens/main_screen.dart'; // Importa la pantalla principal del proyecto desde su ubicación en el directorio de pantallas.

/// Función principal que se ejecuta al inicio de la aplicación.
void main() {
  runApp(const MyApp()); // Llama a runApp para iniciar la aplicación, pasando el widget principal MyApp.
}

/// La clase MyApp es el widget principal que se usará en la aplicación.
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); // Constructor de la clase MyApp, utilizando 'super.key' para pasar la clave a la clase base StatelessWidget.

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false, // Desactiva la bandera de "modo de depuración" que aparece en la esquina superior derecha en modo desarrollo.
      title: 'Football Live Score App', // Establece el título de la aplicación que aparecerá en la barra de tareas o en la vista previa de la aplicación.
      
      theme: ThemeData( // Define el tema visual de la aplicación.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // **Punto clave**: Define el esquema de colores basado en un color semilla (deepPurple) para una paleta coherente en toda la app.
        useMaterial3: true, // **Punto clave**: Activa el uso de Material 3, la última versión de las directrices de diseño de Google para crear interfaces más modernas y atractivas.
      ),
      
      home: const AppMainScreen(), // **Punto clave**: Define la pantalla principal que se mostrará al inicio de la aplicación. Aquí se redirige a AppMainScreen.
    );
  }
}

