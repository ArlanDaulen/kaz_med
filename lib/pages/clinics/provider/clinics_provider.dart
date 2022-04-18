import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/pages/clinics/ui/filters_of_clinics.dart';
import 'package:kaz_med/shared/theme.dart';

class ClinicsProvider extends BaseBloc {
  TextEditingController searchController = TextEditingController();
  Size? size;

  init(context) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    setLoading(false);
  }

  toFilters(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FiltersOfClinics()));
  }

  // List<String> clinics = [
  //   AppSvgImages.clinic_1,
  //   AppSvgImages.clinic_2,
  //   AppSvgImages.clinic_3,
  //   AppSvgImages.clinic_4,
  // ];

  List<String> clinics = [
    AppPngImages.clinic_1,
    AppPngImages.clinic_2,
    AppPngImages.clinic_3,
    AppPngImages.clinic_4,
  ];
}
