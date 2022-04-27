import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeService {
  String baseUrl = 'http://7208-46-34-146-223.ngrok.io/';
  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> getAllDoctors() {
    return http.get(
      Uri.parse(
        '${baseUrl}med-service/doctor/public/all',
      ),
      headers: headers,
    );
  }

  // 500 wtf?
  Future<http.Response> filterWithTERFD(
      String distanceStart,
      String distanceEnd,
      String ratingStart,
      String ratingEnd,
      String feesStart,
      String feesEnd,
      String experienceStart,
      String experienceEnd,
      String time) {
    return http.get(
      Uri.parse(
        '${baseUrl}med-service/doctor/public/filter/100/1000/3/5/1000/10000/8/20/12:30',
      ),
      headers: headers,
    );
  }

   Future<http.Response> searchDoctorByName(String name) {
    return http.get(
      Uri.parse(
        '${baseUrl}med-service/doctor/public/search/$name',
      ),
      headers: headers,
    );
  }
}
