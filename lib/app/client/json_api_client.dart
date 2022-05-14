import 'package:kaz_med/app/main/user_data.dart';
import 'package:kaz_med/core/network/interfaces/base_client_generator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'json_api_client_freezed.dart';
part 'json_api_client.freezed.dart';

@freezed
class PlaceholderClient extends BaseClientGenerator with _$PlaceholderClient {
  static final UserData _userData = UserData();
  // Routes
  const PlaceholderClient._() : super();
  const factory PlaceholderClient.login(String name, String password) = _Login;
  const factory PlaceholderClient.getAllDoctors() = _GetAllDoctors;
  const factory PlaceholderClient.getUser(String username) = _GetUser;

  @override
  String get baseURL => 'https://cace-176-64-11-229.eu.ngrok.io/';

  @override
  Future<Map<String, dynamic>> get header async {
    return {
      'Content-Type': 'application/json',
      "Authorization":
          "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhc3lsemhhbm5AZ21haWwuY29tIiwiYXV0aG9yaXRpZXMiOlsiQURNSU4iXSwiaWF0IjoxNjUyMzYyMzE3LCJleHAiOjE2NTIzNjU5MTd9.00Y4UbNJ0eLL2cbBMnppT6TwdoHIAqSoNGkzXeiAS1SMnVX4cDsMG13abIe-ZiETECbVAwjs2N5RWdMSfnvFJA",
      // "Authorization":
      //     "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhc3lsemhhbkBnbWFpbC5jb20iLCJhdXRob3JpdGllcyI6WyJBRE1JTiJdLCJpYXQiOjE2NTIzNjEzMDQsImV4cCI6MTY1MjM2NDkwNH0.UPLyIPcFfz7VUU9dziOwLUz7El6Q_vlBC49GZVx_xwVlJGekiTp4CyenXCOydcX_IuN_Y3Kj233ZxupawiPIww",
    };
  }

  @override
  String get path {
    return when<String>(
      login: (String name, String password) => 'auth-service/auth',
      getAllDoctors: () => 'med-service/doctor/public/all',
      getUser: (String username) =>
          'client-service/customer/private/find/$username',
    );
  }

  @override
  String get method {
    return maybeWhen<String>(
      orElse: () => 'GET',
      login: (String name, String password) => 'POST',
    );
  }

  @override
  dynamic get body {
    return maybeWhen(
        orElse: () {
          return null;
        },
        login: (String name, String password) =>
            {"username": name, "password": password});
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(
      orElse: () => null,
    );
  }
}
