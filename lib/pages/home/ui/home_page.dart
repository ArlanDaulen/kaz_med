import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/home/provider/home_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/widgets/default_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<HomeProvider>(
      onReady: (p0) => p0.init(context),
      model: HomeProvider(),
      builder: (context, model, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(25),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 1,
                    ),
                    DefaultText(
                      text: 'Consultation',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    const Icon(
                      CupertinoIcons.search,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
