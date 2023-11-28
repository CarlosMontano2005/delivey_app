// import 'package:flutter/material.dart';
import 'package:delivery_app/src/models/response_api.dart';
import 'package:delivery_app/src/models/users.dart';
import 'package:delivery_app/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  User user = User.fromJson(GetStorage().read('user')??{});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserProvider userProvider = UserProvider();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() async{
    String email = emailController.text.trim();
    String password = emailController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if (isValidForm(email, password)) {
      // Get.snackbar('Formulario valio', 'Estas listo para enviar la peticion http');
      ResponseApi responseApi = await userProvider.login(email, password);

      print('Response Api: ${responseApi.toJson()}');

      if(responseApi.success == true){
        
        GetStorage().write('user', responseApi.data);
        getToHomePage();
      }
      else{
        Get.snackbar('Login Fallido', responseApi.messege ?? '');
      }
    }
  }

  void getToHomePage(){
    Get.toNamed('/home');
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes de ingresar el imail');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario No Valido', 'El email no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes de ingresar el password');
      return false;
    }

    return true;
  }
}
