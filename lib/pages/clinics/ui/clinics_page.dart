import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/clinics/provider/clinics_provider.dart';
import 'package:kaz_med/pages/clinics/ui/clinics_container.dart';
import 'package:kaz_med/pages/clinics/ui/clinics_profile_page.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class ClinicsPage extends StatelessWidget {
  const ClinicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ClinicsProvider>(
      model: ClinicsProvider(),
      onReady: (_) => _.init(context),
      builder: (context, model, child) {
        return model.isLoading
            ? const LoadingView()
            : Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                    getProportionateScreenHeight(70),
                  ),
                  child: AppBar(
                    title: DefaultText(
                      text: 'Clinics',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    centerTitle: true,
                    backgroundColor: AppColors.defaultBackgroundColor,
                    elevation: 0,
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: model.searchController,
                              decoration: InputDecoration(
                                focusColor: AppColors.primaryColor,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    gapPadding: 10),
                                hintText: 'search clinics',
                                hintStyle: const TextStyle(
                                    color: AppColors.systemLightGrayColor),
                                suffixIcon: const Icon(
                                  Icons.search_outlined,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                          UIHelper.horizontalSpace(
                            getProportionateScreenWidth(25),
                          ),
                          InkWell(
                            onTap: () {
                              model.toFilters(context);
                            },
                            child: Container(
                              height: getProportionateScreenHeight(50),
                              width: getProportionateScreenHeight(50),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.primaryColor,
                              ),
                              child: SvgPicture.asset(
                                AppSvgImages.chat_ic,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: 'Top Clinics',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: DefaultText(
                              text: 'View all',
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.only(
                            top: getProportionateScreenHeight(17),
                            bottom: getProportionateScreenHeight(17),
                          ),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: model.clinics.length,
                          separatorBuilder: (_, index) => SizedBox(
                            height: getProportionateScreenHeight(28),
                          ),
                          itemBuilder: (_, index) => GestureDetector(
                              onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ClinicsProfilePage(
                                        image: model.clinics[index],
                                      ),
                                    ),
                                  ),
                              child: ClinicsContainer(
                                  image: model.clinics[index])),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
