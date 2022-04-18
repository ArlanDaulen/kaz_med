import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FiltersProvider extends BaseBloc {
  SfRangeValues distanceValues = SfRangeValues(200, 7000);
  SfRangeValues ratingValues = SfRangeValues(1, 5);
  SfRangeValues priceValues = SfRangeValues(2000, 20000);
  SfRangeValues experienceValues = SfRangeValues(1, 10);

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
