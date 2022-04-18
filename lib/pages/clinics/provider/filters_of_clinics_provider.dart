import 'package:kaz_med/base/base_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ClinicsFiltersProvider extends BaseBloc {
  SfRangeValues distanceValues = SfRangeValues(200, 7000);
  SfRangeValues ratingValues = SfRangeValues(1, 5);
  SfRangeValues priceValues = SfRangeValues(2000, 20000);

  
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

}
