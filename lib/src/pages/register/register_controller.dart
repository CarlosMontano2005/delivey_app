import 'package:delivery_app/src/models/users.dart';
import 'package:delivery_app/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UserProvider userProvider = UserProvider();
  
  void register() async {
    // Extracción de la entrada del usuario desde los controladores
    String email = emailController.text.trim();
    String password = confirmPasswordController.text;
    String confirmPassword = passwordController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;

    // Impresión del correo electrónico y la contraseña con fines de depuración
    print('Email ${email}');
    print('Password ${password}');

    // Comprobación de si los datos del formulario son válidos
    if (isValidForm(email, name, lastname, phone, password, confirmPassword)) {
      // Creación de un objeto User con los datos extraídos
      User user = User(
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password,
      );

      // Envío de una solicitud de registro de usuario usando userProvider
      Response response = await userProvider.create(user);
      print('RESPONSE: ${response.body}');

      // Mostrar un Snackbar si el formulario es válido
      Get.snackbar(
        'Formulario válido',
        'Estás listo para enviar la petición http',
      );
    }
  }

  bool isValidForm(
    String email,
    String name,
    String lastname,
    String phone,
    String password,
    String confirmPassword,
  ) {
    if (email.isEmpty) {
      Get.snackbar('Formulario No Valido', 'Debes de ingresar un email');
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario No Valido', 'El email no es valido');
    }

    if (name.isEmpty) {
      Get.snackbar('Formulario No Valido', 'Debes de ingresar tu nombre');
    }

    if (lastname.isEmpty) {
      Get.snackbar('Formulario No Valido', 'Debes de ingresar tu apellido');
    }
    if (phone.isEmpty) {
      Get.snackbar('Formulario No Valido', 'Debes de ingresar tu telefono');
    }
    if (password.isEmpty) {
      Get.snackbar('Formulario No Valido', 'Debes de ingresar el password');
    }

    if (password != confirmPassword) {
      Get.snackbar('Formulario No Valido', 'Los password no coinciden');
    }

    return true;
  }
}
