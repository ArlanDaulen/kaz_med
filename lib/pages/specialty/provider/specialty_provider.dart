import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';

class SpecialtyProvider extends BaseBloc {
  TextEditingController searchController = TextEditingController();

  List<String> specialties = [
    'Specialty 1',
    'Specialty 2',
    'Specialty 3',
    'Specialty 4',
    'Specialty 5',
    'Specialty 6',
    'Specialty 7',
    'Specialty 8',
    'Specialty 9',
    'Specialty 10',
  ];
}
