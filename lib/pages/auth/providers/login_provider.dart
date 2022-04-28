import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kaz_med/app/data/services/auth_service.dart';
import 'package:kaz_med/app/main/user_data.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/core/freezed/network_error.dart';
import 'package:kaz_med/core/freezed/result.dart';
import 'package:kaz_med/pages/index/ui/index.dart';
import 'package:kaz_med/shared/size_config.dart';

import '../../../app/main/navigator_state.dart';
import '../../../shared/utils.dart';

class LoginProvider extends BaseBloc {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Result<dynamic, NetworkError>? loginData;
  AuthService _authService = AuthService();
  UserData _userData = UserData();

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    setLoading(false);
  }

  verificate(context) async {
    setLoading(true);
    try {
      var response = await _authService.login(
          emailController.text, passwordController.text);
      if (response.statusCode == 200) {
        _userData.setToken(response.headers.values.toList()[3].substring(7));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => IndexPage(),
            ),
            (route) => false);
      } else {
        log(response.statusCode.toString());
        setLoading(false);
        return showDialogCustom(
          context: GlobalVariable.navState.currentContext!,
          barrierDismissible: true,
          backgroundColor: Colors.black26,
          title: 'Error',
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Center(
              child: Text(
                "Invalid inputs",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      setLoading(false);
      return showDialogCustom(
        context: GlobalVariable.navState.currentContext!,
        barrierDismissible: true,
        backgroundColor: Colors.black26,
        title: 'Error',
        child: Container(
          padding: const EdgeInsets.all(20),
          child: const Center(
            child: Text(
              "Something went wrong!",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
    notifyListeners();
  }
}
