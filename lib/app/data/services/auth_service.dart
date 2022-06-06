import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // Future<Result<dynamic, NetworkError>> login(
  //     String name, String password) async {
  //   return NetworkExecuter.execute(
  //     route: PlaceholderClient.login(name, password),
  //   );
  // }
<<<<<<< HEAD
  final String baseUrl = 'https://4b02-185-57-73-34.eu.ngrok.io/';
=======
  final String baseUrl = 'https://8c76-46-34-146-223.ngrok.io/';
>>>>>>> 6cc50e77a3d54c7f7cbd8080f9bfadcfedeca56a

  Future<http.Response> login(String name, String password) {
    return http.post(
      Uri.parse(
        '${baseUrl}auth-service/auth',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, String>{"username": name, "password": password},
      ),
    );
  }

  Future<http.Response> register(
      String firstName, String lastName, String email, String password) {
    return http.post(
      Uri.parse(
        '${baseUrl}auth-service/registration/add-customer',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, dynamic>{
          "customerName": firstName,
          "customerSurname": lastName,
          "customerTelNumber": "",
          "email": email,
          "username": firstName,
          "password": password,
          "address": "st. arre",
          "roles": ["ADMIN"]
        },
      ),
    );
  }
}
