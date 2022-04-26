import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FiltersProvider extends BaseBloc {
  SfRangeValues distanceValues = const SfRangeValues(200.0, 7000.0);
  SfRangeValues ratingValues = const SfRangeValues(1.0, 5.0);
  SfRangeValues priceValues = const SfRangeValues(2000.0, 20000.0);
  SfRangeValues experienceValues = const SfRangeValues(1.0, 10.0);

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    setLoading(false);
  }

  setDistanceValues(dynamic newValues) {
    distanceValues = newValues;
    notifyListeners();
  }

  setRatingValues(SfRangeValues newValues) {
    ratingValues = newValues;
    notifyListeners();
  }

  setPriceValues(SfRangeValues newValues) {
    priceValues = newValues;
    notifyListeners();
  }

  setExperienceValues(SfRangeValues newValues) {
    experienceValues = newValues;
    notifyListeners();
  }
}
