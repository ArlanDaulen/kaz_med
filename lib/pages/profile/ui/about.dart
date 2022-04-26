import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/profile/provider/about_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AboutProvider>(
        model: AboutProvider(),
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
                        text: 'About me',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      centerTitle: true,
                      backgroundColor: AppColors.defaultBackgroundColor,
                      elevation: 0,
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.ellipsis_vertical,
                            color: AppColors.systemBlackColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  body: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                            vertical: getProportionateScreenHeight(7),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 4),
                                color: AppColors.shadowColor,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // SvgPicture.asset(AppSvgImages.avatar),
                              Image.asset(AppPngImages.avatar),
                              UIHelper.horizontalSpace(
                                  getProportionateScreenWidth(15)),
                              DefaultText(
                                text: 'Kenes Aidana',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'Name',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                DefaultText(
                                  text: 'Aidana',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyColor,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'Day of birthday',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                DefaultText(
                                  text: '12.01.2000',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'Day of birthday',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            DefaultText(
                              text: '12.01.2000',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'Email',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                DefaultText(
                                  text: 'example@gmail.com',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyColor,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'Phone number',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                DefaultText(
                                  text: '+7-777-777-77-77',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'Place of living',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            DefaultText(
                              text: 'c. Almaty, st. Abay 56',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor,
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(10),
                      ],
                    ),
                  ),
                );
        });
  }
}
