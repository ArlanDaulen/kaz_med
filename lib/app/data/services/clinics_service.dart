import 'package:http/http.dart' as http;

class ClinicsService {
  String baseUrl = 'http://7208-46-34-146-223.ngrok.io/';
  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> getAllMedCenter() async {
    return http.get(
      Uri.parse('${baseUrl}med-service/medCenter/public/all'),
      headers: headers,
    );
  }

  Future<http.Response> searchMedCenterMyName(String name) async {
    return http.get(
      Uri.parse('${baseUrl}med-service/medCenter/public/medCenterName/$name'),
      headers: headers,
    );
  }
}
