import '../environment/environment.dart';
import 'package:delivery_app/src/models/response_api.dart';
import 'package:delivery_app/src/models/users.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  String url = Environment.API_URL + 'api/users';

  Future<Response> create(User user) async {
    // Realiza una solicitud POST al servidor
    Response response = await post(
      // '$url/create',
      '${Environment.API_URL}/api/users/create',
      user.toJson(), // Convierte el objeto User a formato JSON
      headers: {
        'Content-Type':
            'application/json', // Establece el tipo de contenido como JSON
      },
    );
    // Espera hasta que el servidor responda y luego retorna la respuesta
    return response;
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post(
        // '$url/login',
        '${Environment.API_URL}/api/users/login',
        {
          'email': email,
          'password': password
        },
        headers: {
          'Content-Type': 'application/json'
        }); //ESPERAR HASTA QUE EL SERVIDOR NOS RETONE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}
