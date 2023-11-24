// Importaciones de paquetes y archivos necesarios
import 'package:delivery_app/src/models/users.dart';
import 'package:delivery_app/src/pages/home/home_page.dart';
import 'package:delivery_app/src/pages/login/login_page.dart';
import 'package:delivery_app/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

User userSession = User.fromJson(GetStorage().read('user')??{});
// Punto de entrada de la aplicación
void main() async{
  await GetStorage.init();
  // Ejecuta la aplicación Flutter
  runApp(const MyApp());
}

// Clase principal de la aplicación, que hereda de StatefulWidget
class MyApp extends StatefulWidget {
  // Constructor de la clase
  const MyApp({super.key});

  // Método que crea y devuelve el estado de la aplicación
  @override
  State<MyApp> createState() => _MyAppState();
}

// Clase que representa el estado de la aplicación
class _MyAppState extends State<MyApp> {
  // Método que se llama cuando se inicializa el estado
  @override
  void initState() {
    super.initState();
    // Aquí podrías realizar acciones de inicialización si es necesario
  }

  // Método que construye la interfaz de usuario de la aplicación
  @override
  Widget build(BuildContext context) {
    print('Usuario id: ${userSession.email}');
    // Utiliza GetMaterialApp de GetX para gestionar la navegación y rutas
    return GetMaterialApp(
      // Título de la aplicación
      title: 'Delivery App',
      debugShowCheckedModeBanner: false,
      // Ruta inicial de la aplicación
      initialRoute: userSession.id != null ? '/home':'/',
      // Configuración de las páginas y rutas
      getPages: [
        GetPage(name: '/', page: () => LoginPage()), 
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage())
      ],

      theme: ThemeData(
        primaryColor: Colors.amber,
        colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.amber, 
        onPrimary: Colors.grey, 
        secondary: Colors.amberAccent, 
        onSecondary: Colors.amberAccent, 
        error: Colors.grey, 
        onError: Colors.grey, 
        background: Colors.grey,
        onBackground: Colors.grey, 
        surface: Colors.grey,
        onSurface: Colors.grey)
      ),

      // Clave del navegador, proporcionada por GetX
      navigatorKey: Get.key,
    );
  }
}
