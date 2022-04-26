import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:kaz_med/app/data/models/doctor_model.dart';
import 'package:kaz_med/app/data/services/home-service.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/shared/size_config.dart';

class HomeProvider extends BaseBloc {
  List<bool> sectionsToggles = List.generate(4, (index) => true);
  TextEditingController searchController = TextEditingController();
  DoctorModel? doctors;

  init(BuildContext context) async {
    setLoading(true);
    SizeConfig().init(context);
    await getAllDoctors();
    setLoading(false);
    notifyListeners();
  }

  toggleSections(int index) {
    sectionsToggles[index] = !sectionsToggles[index];
    notifyListeners();
  }

  getAllDoctors() async {
    var response = await HomeService().getAllDoctors();
    if (response.statusCode == 200) {
      log('Success!');
      // doctors.add(
      //   DoctorModel.fromJson(
      //     json.decode(response.body),
      //   ),
      // );
      doctors = DoctorModel.fromJson(json.decode(response.body)[0]);
      notifyListeners();
    } else {
      log('Error: ${response.statusCode}');
    }
  }

  searchDoctorByName() async {
    setIsSendRequest(true);
    var response =
        await HomeService().searchDoctorByName(searchController.text);
    if (response.statusCode == 200) {
      log('Searched Succefully');
      doctors = json.decode(response.body).isNotEmpty
          ? DoctorModel.fromJson(json.decode(response.body)[0])
          : doctors;
      notifyListeners();
    }
    setIsSendRequest(false);
  }
}
