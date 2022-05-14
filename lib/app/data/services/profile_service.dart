import 'package:kaz_med/app/client/json_api_client.dart';
import 'package:kaz_med/app/data/models/profile_model.dart';
import 'package:kaz_med/core/freezed/network_error.dart';
import 'package:kaz_med/core/freezed/result.dart';
import 'package:kaz_med/core/network/layers/network_executer.dart';

class ProfileService {
  Future<Result<ProfileModel, NetworkError>> getProfileInfo(
      String username) async {
    return NetworkExecuter.execute(
        route: PlaceholderClient.getUser(username),
        responseType: ProfileModel());
  }
}
