import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/profile/provider/profile_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_button.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ProfileProvider>(
      model: ProfileProvider(),
      builder: (context, model, child) {
        return model.isLoading
            ? const LoadingView()
            : Scaffold(
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Column(
                    children: [
                      UIHelper.verticalSpace(getProportionateScreenHeight(105)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(AppSvgImages.ic_user),
                          UIHelper.verticalSpace(20),
                          const Text(
                            'Kenes Aidana',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          UIHelper.verticalSpace(
                              getProportionateScreenHeight(12)),
                          const Text(
                            'Almaty, Kazakhstan',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(getProportionateScreenHeight(40)),
                      ListTile(
                        onTap: () {
                          model.toAbout(context);
                        },
                        leading: SvgPicture.asset(
                          AppSvgImages.profile_ic,
                          width: getProportionateScreenWidth(35),
                          height: getProportionateScreenHeight(35),
                        ),
                        title: const Text(
                          'About me',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          model.toAppointments(context);
                        },
                        leading: SvgPicture.asset(
                          AppSvgImages.calendar_ic,
                          width: getProportionateScreenWidth(35),
                          height: getProportionateScreenHeight(35),
                        ),
                        title: const Text(
                          'My appointments',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(
                          AppSvgImages.clipboard_ic,
                          width: getProportionateScreenWidth(35),
                          height: getProportionateScreenHeight(35),
                        ),
                        title: const Text(
                          'Analysis',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(
                          AppSvgImages.clipboard_ic,
                          width: getProportionateScreenWidth(35),
                          height: getProportionateScreenHeight(35),
                        ),
                        title: const Text(
                          'Test results',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(
                          AppSvgImages.language_ic,
                          width: getProportionateScreenWidth(35),
                          height: getProportionateScreenHeight(35),
                        ),
                        title: const Text(
                          'Language',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading:
                            // Icon(Icons.logout),
                            SvgPicture.asset(
                          AppSvgImages.logout,
                          color: AppColors.primaryColor,
                          width: getProportionateScreenWidth(30),
                          height: getProportionateScreenHeight(30),
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
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
