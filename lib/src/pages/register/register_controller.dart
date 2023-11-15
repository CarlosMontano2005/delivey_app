import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '';

class RegisterController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void register(){
    String email = emailController.text.trim();
    String password = confirmPasswordController.text;
    String confirmPassword = passwordController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;

    print('Email ${email}');
    print('Password ${password}');

    if(isValidForm(email, name, lastname, phone, password, confirmPassword)){
      Get.snackbar('Formulario valido', 'Estas listo para enviar la peticion http');
    }
  }
  bool isValidForm(
    String email,
    String name,
    String lastname,
    String phone,
    String password,
    String confirmPassword,
  ){
    if(email.isEmpty){
      Get.snackbar('Formulario No Valido', 'Debes de ingresar un email');
    }
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario No Valido', 'El email no es valido');
    }

    if(name.isEmpty){
      Get.snackbar('Formulario No Valido', 'Debes de ingresar tu nombre');
    }

     if(lastname.isEmpty){
      Get.snackbar('Formulario No Valido', 'Debes de ingresar tu apellido');
    }
     if(phone.isEmpty){
      Get.snackbar('Formulario No Valido', 'Debes de ingresar tu telefono');
    }
    if(password.isEmpty){
      Get.snackbar('Formulario No Valido', 'Debes de ingresar el password');
    }

    if(password != confirmPassword){
      Get.snackbar('Formulario No Valido', 'Los password no coinciden');
    }

    return true;
  }
}