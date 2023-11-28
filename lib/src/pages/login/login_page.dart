import 'package:delivery_app/src/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';//imrm

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});
  LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: _textDontHaveAccout(),
      ),
      body: Stack(
        //pocicionar elementos uno encima de otro
        children: [
          _backgroundCover(context),
          _boxForm(context),
          Column(
            //pocicionar elementos uno debajo de otro
            children: [
              _imageCover(),
              _textAppName(),
            ],
          )
        ],
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.42,
        color: Colors.amber);
  }

  Widget _textAppName() {
    return const Text(
      'Delivery MYSQL',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.33, left: 50, right: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
          ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(),
            // _textDontHaveAccout()
          ],
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
  return  Container(
  margin: EdgeInsets.symmetric(horizontal: 40),
  child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
        hintText: 'Correo Electronico', 
        prefixIcon: Icon(Icons.mail)),
        )
    );
  }

  Widget _textFieldPassword() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: const TextField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration:
              InputDecoration(
              hintText: 'Contraseña',
              prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
         margin: EdgeInsets.only(top: 40, bottom: 45),

      child: Text(
            'Ingresa Esta Informacion',
            // darle estilos al texto
            style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),
          ),
    );
    
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: ()=> con.login(),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15)
          ),
          child: Text(
            'LOGIN',
            style: TextStyle(
            color: Colors.black),
          )),
    );
  }

  Widget _textDontHaveAccout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No Tienes Cuenta?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,

          ),
        ),
        SizedBox(width: 7),
           GestureDetector(
            onTap: () => con.goToRegisterPage(),
             child: Text(
                     'registrate aqui',
              style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              fontSize: 17,
                     ),
                   ),
           ),
      ],
    );
  }

  Widget _imageCover() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 15),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/img/delivery.png',
          width: double.infinity,
          height: 130,
        ),
      ),
    );
  }
}
