import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/profile/provider/analysis_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/shared/ui_helper.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class Analysis extends StatelessWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AnalysisProvider>(
      model: AnalysisProvider(),
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
                      text: 'Analysis',
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
                    horizontal: getProportionateScreenWidth(30),
                    vertical: getProportionateScreenHeight(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'My analysis:',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        isCenter: false,
                      ),
                      UIHelper.verticalSpace(15),
                      _buildPointers(model.analysis, model, context),
                    ],
                  ),
                ),
              );
      },
    );
  }

  _buildPointers(List<String> list, AnalysisProvider provider, context) {
    return Column(
      children: List.generate(
        list.length,
        (index) => Row(
          children: [
            Container(
              width: getProportionateScreenWidth(5),
              height: getProportionateScreenHeight(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.systemBlackColor,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(15),
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                provider.toAnalysisDetail(context);
              },
              child: DefaultText(
                text: list[index],
                isCenter: false,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.greyColor,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
