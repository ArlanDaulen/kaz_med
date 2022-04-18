import 'dart:async';
import 'dart:developer';

import 'package:connectivity/connectivity.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/pages/auth/ui/auth_page.dart';
import 'package:kaz_med/pages/auth/ui/login_page.dart';
import 'package:kaz_med/pages/auth/ui/signup_page.dart';
import 'package:kaz_med/pages/home/ui/home_page.dart';
import 'package:kaz_med/pages/index/ui/index.dart';

import '../../base/base_bloc.dart';
import 'user_data.dart';

class MyAppModel extends BaseBloc {
  final UserData _userData = UserData();
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();
  var _isAuthenticated = false;
  var _isOnboardingSkipped = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isOnboardingSkipped => _isOnboardingSkipped;

  init() async {
    log('init called');

    // localization init
    // await EasyLocalization.ensureInitialized();
    await checkOnboardinIsSkipped();
    await checkAuth();
    var result = await Connectivity().checkConnectivity();
    log('result from init is: $result');
    connectionStatusController.add(result);
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      log('Internet result is: $result');
      connectionStatusController.add(result);
    });
  }

  Future<void> checkOnboardinIsSkipped() async {
    _isOnboardingSkipped = await _userData.getUserOnboardingSkipped();
  }

  Future<void> checkAuth() async {
    String? token = await _userData.getToken();
    log('token from init is $token');
    _isAuthenticated = token != "";
  }

  Widget getHomeScreen() {
<<<<<<< HEAD
    return HomePage();
    // if (isAuthenticated) {
    //   return HomePage();
    // } else {
    //   return const LoginPage();
=======
    // if (isAuthenticated) {
    return const IndexPage();
    // } else {
    //   return const AuthPage();
>>>>>>> 6c39d2995d2dc6a7210b03663494c0a96fcae541
    // }
  }
}
