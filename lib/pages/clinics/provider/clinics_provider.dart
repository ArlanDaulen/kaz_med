import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kaz_med/app/data/models/medical_center_model.dart';
import 'package:kaz_med/app/data/services/clinics_service.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/pages/clinics/ui/clinics_filter_page.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:http/http.dart' as http;

class ClinicsProvider extends BaseBloc {
  TextEditingController searchController = TextEditingController();
  Size? size;
  List<bool> sectionsToggles = List.generate(4, (index) => true);
  MedicalCenterModel? medCenters;
  ClinicsService _service = ClinicsService();

  init(context) async {
    setLoading(true);
    size = MediaQuery.of(context).size;
    await getAllMedCenter();
    setLoading(false);
  }

  toFilters(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ClinicsFilters(),
      ),
    );
  }

  toggleSections(int index) {
    sectionsToggles[index] = !sectionsToggles[index];
    notifyListeners();
  }

  // List<String> clinics = [
  //   AppSvgImages.clinic_1,
  //   AppSvgImages.clinic_2,
  //   AppSvgImages.clinic_3,
  //   AppSvgImages.clinic_4,
  // ];

  getAllMedCenter() async {
    http.Response response = await _service.getAllMedCenter();
    if (response.statusCode == 200) {
      log('Succesfull clinics');
      medCenters = MedicalCenterModel.fromJson(json.decode(response.body)[0]);
      notifyListeners();
    } else {
      log('Error: ${response.statusCode}');
    }
  }

  // Не понял для чего 123asd
  // Exmaple: localhost:8762/med-service/medCenter/public/medCenterName/123asd
  searchByName() async {
    setIsSendRequest(true);
    var response =
        await _service.searchMedCenterMyName(searchController.text);
    if (response.statusCode == 200) {
      log('Searched Succefully');
      medCenters = json.decode(response.body).isNotEmpty
          ? MedicalCenterModel.fromJson(json.decode(response.body)[0])
          : medCenters;
      notifyListeners();
    }
    setIsSendRequest(false);
  }

  List<String> clinics = [
    AppPngImages.clinic_1,
    AppPngImages.clinic_2,
    AppPngImages.clinic_3,
    AppPngImages.clinic_4,
  ];
}
