import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/clinics/provider/filters_of_clinics_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../provider/clinics_provider.dart';

class ClinicsFilters extends StatelessWidget {
  const ClinicsFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ClinicsFiltersProvider>(
      model: ClinicsFiltersProvider(),
      builder: (context, model, child) {
        return model.isLoading
            ? const LoadingView()
            : Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                    getProportionateScreenHeight(70),
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.systemBlackColor,
                      ),
                    ),
                    title: DefaultText(
                      text: 'Filters',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    centerTitle: true,
                    backgroundColor: AppColors.defaultBackgroundColor,
                    elevation: 0,
                  ),
                ),
                bottomSheet: _bottomSheet(context),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenHeight(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'Distance from you',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Expanded(
                        child: SfRangeSlider(
                          min: 100,
                          max: 10000,
                          showLabels: true,
                          enableTooltip: true,
                          labelFormatterCallback: (actualValue, formattedText) {
                            return actualValue.toString().length <= 3
                                ? '$formattedText m'
                                : '${formattedText.substring(0, 2)} km';
                          },
                          tooltipTextFormatterCallback:
                              (actualValues, formattedText) {
                            return actualValues.round().toString().length <= 3
                                ? '${formattedText.substring(0, 3)} m'
                                : actualValues.round() == 10000
                                    ? '${formattedText.substring(0, 2)} km'
                                    : '${formattedText.substring(0, 1)} km';
                          },
                          shouldAlwaysShowTooltip: true,
                          inactiveColor: AppColors.greyColor,
                          activeColor: AppColors.primaryColor,
                          tooltipShape: SfPaddleTooltipShape(),
                          values: model.distanceValues,
                          onChanged: (newValues) =>
                              model.setDistanceValues(newValues),
                        ),
                      ),
                      DefaultText(
                        text: 'Ratings',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      // _buildRatingSlider(model),
                      Expanded(
                        child: SfRangeSlider(
                          min: 1,
                          max: 5,
                          activeColor: AppColors.primaryColor,
                          inactiveColor: AppColors.greyColor,
                          showLabels: true,
                          interval: 1,
                          values: model.ratingValues,
                          onChanged: (newValues) =>
                              model.setRatingValues(newValues),
                        ),
                      ),
                      DefaultText(
                        text: 'Price',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Expanded(
                        child: SfRangeSlider(
                          min: 2000,
                          max: 20000,
                          showLabels: true,
                          enableTooltip: true,
                          labelFormatterCallback: (actualValue, formattedText) {
                            return '${actualValue.toInt()} tg';
                          },
                          tooltipTextFormatterCallback:
                              (actualValues, formattedText) {
                            return '${actualValues.toInt()} tg';
                          },
                          shouldAlwaysShowTooltip: true,
                          inactiveColor: AppColors.greyColor,
                          activeColor: AppColors.primaryColor,
                          values: model.priceValues,
                          tooltipShape: SfPaddleTooltipShape(),
                          onChanged: (newValues) =>
                              model.setPriceValues(newValues),
                        ),
                      ),
                      DefaultText(
                        text: 'Schedule',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: getProportionateScreenWidth(220),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(6),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: DefaultText(
                                text: 'Around the clock',
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            UIHelper.verticalSpace(20),
                            Container(
                              width: getProportionateScreenWidth(220),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(6),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: DefaultText(
                                text: 'Works on weekends',
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
      },
    );
  }

  _bottomSheet(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (() {}),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50),
                vertical: getProportionateScreenHeight(14),
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: DefaultText(
                text: 'Reset',
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50),
                vertical: getProportionateScreenHeight(14),
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DefaultText(
                text: 'Apply',
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
