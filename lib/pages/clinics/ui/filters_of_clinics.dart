import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/clinics/provider/filters_of_clinics_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class FiltersOfClinics extends StatelessWidget {
  const FiltersOfClinics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<FiltersOfClinicsProvider>(
      model: FiltersOfClinicsProvider(),
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
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.filterTexts.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                text: model.filterTexts[index],
                              ),
                            ],
                          );
                        },
                      ),
                      DefaultText(
                        text: "Schedule",
                        isCenter: false,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      UIHelper.verticalSpace(15),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(40),
                          vertical: getProportionateScreenHeight(5),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
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
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(40),
                          vertical: getProportionateScreenHeight(5),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
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
            onTap: (() {}),
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
