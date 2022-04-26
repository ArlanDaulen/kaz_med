import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_provider.dart';
import 'package:kaz_med/pages/profile/provider/appointments_provider.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_text.dart';
import 'package:kaz_med/widgets/loading_view.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AppointmentsProvider>(
      model: AppointmentsProvider(),
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
                      text: 'My appointments',
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
              );
      },
    );
  }
}
