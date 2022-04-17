import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';

class IndexProvider extends BaseBloc {
  int bottomIndex = 0;
  final controller = ScrollController();
  List<BottomNavigationBarItem>? items;

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    setItems();
    setLoading(false);
  }

  setItems() {
    items = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.home_ic,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.home_ic,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        label: 'Doctors',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.home_ic,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.home_ic,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        label: 'Clinics',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.search_active_ic,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.search_active_ic,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.chat_ic,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.chat_ic,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        label: 'Chat',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.profile_ic,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.profile_ic,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        label: 'Profile',
      ),
    ];
    notifyListeners();
  }

  bool isFirst = true;
  setBottomIndex(int index, context) {
    bottomIndex = index;
    log('Bottom index: $bottomIndex');
    // if (bottomIndex != 0) {
    //   isFirst ? Navigator.pop(context) : null;
    // }
    bottomIndex != 0 ? isFirst = false : isFirst = true;

    notifyListeners();
  }
}
