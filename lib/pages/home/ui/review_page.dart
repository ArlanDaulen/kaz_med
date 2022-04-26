import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/home/provider/review_provider.dart';
import 'package:kaz_med/pages/home/ui/widgets/success_message.dart';
import 'package:kaz_med/widgets/default_button.dart';

import '../../../shared/size_config.dart';
import '../../../shared/theme.dart';
import '../../../widgets/default_text.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ReviewProvider>(
      onReady: (p0) => p0.init(context),
      model: ReviewProvider(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
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
                  text: 'Review',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                centerTitle: true,
                backgroundColor: AppColors.defaultBackgroundColor,
                elevation: 0,
              ),
            ),
            bottomSheet: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(25),
              ),
              child: DefaultButton(
                text: 'Send',
                press: () => showCupertinoDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) => const AlertDialog(
                    insetPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    content: SuccessMessage(),
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(25),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  DefaultText(
                    text: 'Rating',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(7),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Container(
                        padding: const EdgeInsets.all(1.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: SvgPicture.asset(
                          AppSvgImages.star,
                          width: getProportionateScreenWidth(30),
                          color: AppColors.systemBlackColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  DefaultText(
                    text: 'Review',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextField(
                    controller: model.controller,
                    cursorColor: AppColors.systemBlackColor,
                    maxLines: 8,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: AppColors.systemBlackColor,
                        fontSize: getProportionateScreenHeight(14),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
