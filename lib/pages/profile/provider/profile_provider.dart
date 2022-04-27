import 'package:kaz_med/base/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/pages/auth/ui/auth_page.dart';
import 'package:kaz_med/pages/profile/ui/about.dart';
import 'package:kaz_med/pages/profile/ui/analysis.dart';
import 'package:kaz_med/pages/profile/ui/appointments.dart';
import 'package:kaz_med/pages/profile/ui/logout.dart';
import 'package:kaz_med/shared/size_config.dart';

class ProfileProvider extends BaseBloc {
  Size? size;
  // ProfileProvider? provider;

  init(context) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    setLoading(false);
  }

  toAbout(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AboutPage()));
  }

  toAppointments(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AppointmentsPage()));
  }

  toAnalysis(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Analysis()));
  }

  // toLogout(context) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => LogoutWidget(
  //                 profileProvider: provider,
  //               )));
  // };yugjighug

  void exit(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => const AuthPage()), (route) => false);
  }
}
