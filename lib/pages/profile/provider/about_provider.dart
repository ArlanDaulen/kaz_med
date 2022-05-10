import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/shared/size_config.dart';

class AboutProvider extends BaseBloc {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Size? size;

  init(context) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    nameController.text = 'Aidana';
    surnameController.text = 'Kenes';
    emailController.text = 'kenesaidana@gmail.com';
    notifyListeners();
    setLoading(false);
  }
}
