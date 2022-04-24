import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/home/provider/filters_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_button.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<FiltersProvider>(
      onReady: (p0) => p0.init(context),
      model: FiltersProvider(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              getProportionateScreenHeight(70),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.defaultBackgroundColor,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  CupertinoIcons.back,
                  color: AppColors.systemBlackColor,
                ),
              ),
              centerTitle: true,
              elevation: 0,
              title: DefaultText(
                text: 'Filters',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(12),
              vertical: getProportionateScreenHeight(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    text: 'Reset',
                    textColor: AppColors.primaryColor,
                    color: AppColors.whiteColor,
                    isWithShadow: true,
                    press: () {},
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(16),
                ),
                Expanded(
                  child: DefaultButton(
                    text: 'Apply',
                    // color: AppColors.whiteColor,
                    press: () {},
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(25),
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
                  flex: 2,
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
                  flex: 2,
                  child: SfRangeSlider(
                    min: 1,
                    max: 5,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.greyColor,
                    showLabels: true,
                    interval: 1,
                    values: model.ratingValues,
                    onChanged: (newValues) => model.setRatingValues(newValues),
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
                  flex: 2,
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
                    onChanged: (newValues) => model.setPriceValues(newValues),
                  ),
                ),
                DefaultText(
                  text: 'Year of experience',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),

                // _buildRatingSlider(model),
                Expanded(
                  flex: 2,
                  child: SfRangeSlider(
                    min: 0,
                    max: 20,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.greyColor,
                    showLabels: true,
                    interval: 5,
                    values: model.experienceValues,
                    onChanged: (newValues) =>
                        model.setExperienceValues(newValues),
                  ),
                ),
                DefaultText(
                  text: 'Schedule',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Spacer(),
                        DefaultText(
                          text: 'time',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                        Spacer(),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: getProportionateScreenWidth(120),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadowColor,
                                  offset: const Offset(0, 4),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: DefaultText(
                              text: '12:30',
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildDistanceSlider(FiltersProvider model) {
    return SfRangeSliderTheme(
      data: SfRangeSliderThemeData(
        activeTrackHeight: 3,
        inactiveTrackHeight: 3,
        activeLabelStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: AppColors.greyColor,
          ),
        ),
        inactiveLabelStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: AppColors.greyColor,
          ),
        ),
        tooltipBackgroundColor: AppColors.primaryColor.withOpacity(0),
        tooltipTextStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: getProportionateScreenHeight(12),
            fontWeight: FontWeight.w400,
          ),
        ),
        overlappingTooltipStrokeColor: AppColors.primaryColor.withOpacity(0),
      ),
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
        tooltipTextFormatterCallback: (actualValues, formattedText) {
          return actualValues.round().toString().length <= 3
              ? '${formattedText.substring(0, 3)} m'
              : actualValues.round() == 10000
                  ? '${formattedText.substring(0, 2)} km'
                  : '${formattedText.substring(0, 1)} km';
        },
        shouldAlwaysShowTooltip: true,
        inactiveColor: AppColors.greyColor,
        activeColor: AppColors.primaryColor,
        values: model.distanceValues,
        onChanged: (newValues) => model.setDistanceValues(newValues),
      ),
    );
  }

  _buildRatingSlider(FiltersProvider model) {
    return SfRangeSliderTheme(
      data: SfRangeSliderThemeData(
        activeTrackHeight: 3,
        inactiveTrackHeight: 3,
        activeLabelStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
        inactiveLabelStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: AppColors.greyColor,
          ),
        ),
        overlayRadius: 1,
      ),
      child: SfRangeSlider(
        min: 1,
        max: 5,
        activeColor: AppColors.primaryColor,
        inactiveColor: AppColors.greyColor,
        showLabels: true,
        interval: 1,
        values: model.ratingValues,
        onChanged: (newValues) => model.setRatingValues(newValues),
      ),
    );
  }
}
