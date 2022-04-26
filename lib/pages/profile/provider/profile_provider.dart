import 'package:kaz_med/base/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/pages/profile/ui/about.dart';
import 'package:kaz_med/pages/profile/ui/appointments.dart';

class ProfileProvider extends BaseBloc {
  toAbout(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AboutPage()));
  }

  toAppointments(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AppointmentsPage()));
  }
}
