import 'package:kaz_med/app/main/user_data.dart';
import 'package:http/http.dart' as http;

class SpecialityService {
  final String baseUrl = 'https://ff52-46-34-146-223.ngrok.io/';
  final UserData _userData = UserData();
    final headers = {'Content-Type': 'application/json'};

  Future<http.Response> getAllSpecialities() async {
    return http.get(
      Uri.parse('${baseUrl}med-service/specialty/all'),
      headers: headers,
    );
  }
}
