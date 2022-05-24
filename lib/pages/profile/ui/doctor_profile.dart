import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaz_med/app/data/models/profile_model.dart';
import 'package:kaz_med/pages/home/ui/widgets/doctors_container.dart';
import 'package:kaz_med/pages/profile/provider/profile_provider.dart';
import 'package:kaz_med/pages/profile/ui/doctor_appointments.dart';
import 'package:kaz_med/shared/size_config.dart';
import 'package:kaz_med/shared/theme.dart';
import 'package:kaz_med/widgets/default_text.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({Key? key, required this.model}) : super(key: key);
  final ProfileProvider model;

  @override
  Widget build(BuildContext context) {
    final profile = model.profileModel;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(22),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              DoctorsCard(profile: profile),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              DefaultText(
                text: 'About',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              DefaultText(
                text:
                    'Akhmetova Aygerim was born and raised in Kazakhstan, and completed her medical degree at the Kazakh National Medical University  . She is fully trained in all aspects of cardiology and a founding member of Blitz & Hertz.',
                fontWeight: FontWeight.w400,
                isCenter: false,
                fontSize: 12,
                color: Colors.grey,
                isMaxLinesEq2: false,
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              const Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              DefaultText(
                text: 'Qualifications',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              ...List.generate(
                3,
                (index) => Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(9),
                      ),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.systemBlackColor,
                        borderRadius: BorderRadius.circular(188),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(15),
                    ),
                    Flexible(
                      child: DefaultText(
                        text:
                            'Bachelor of Medicine, Bachelor of Surgery (MBBS), 1989',
                        fontWeight: FontWeight.w400,
                        isCenter: false,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              const Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              DefaultText(
                text: 'Services',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              ...List.generate(
                3,
                (index) => Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(9),
                      ),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.systemBlackColor,
                        borderRadius: BorderRadius.circular(188),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(15),
                    ),
                    Flexible(
                      child: DefaultText(
                        text:
                            'Bachelor of Medicine, Bachelor of Surgery (MBBS), 1989',
                        fontWeight: FontWeight.w400,
                        isCenter: false,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              const Divider(
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: 'Reviews',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      const Icon(
                        CupertinoIcons.forward,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const Fees(),
              const Divider(
                color: Colors.grey,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DoctorAppointments(),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(8),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppSvgImages.calendar_ic,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(15),
                      ),
                      DefaultText(
                        text: 'My appointments',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const Spacer(),
                      const Icon(
                        CupertinoIcons.forward,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorsCard extends StatelessWidget {
  const DoctorsCard({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final ProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(9),
        vertical: getProportionateScreenHeight(9),
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppPngImages.doctor_1),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                text:
                    profile!.customerName! + ' ' + profile!.customerSurname![0],
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              DefaultText(
                text: 'Cardiologist',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(4),
                  vertical: getProportionateScreenHeight(4),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primaryColor.withOpacity(0.26),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: AppColors.primaryColor,
                      size: 12,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(5),
                    ),
                    DefaultText(
                      text: profile!.rating!.toString(),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Fees extends StatefulWidget {
  const Fees({Key? key}) : super(key: key);

  @override
  State<Fees> createState() => _FeesState();
}

class _FeesState extends State<Fees> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        isTapped = !isTapped;
      }),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                  text: 'Fees',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                Icon(
                  isTapped
                      ? CupertinoIcons.chevron_down
                      : CupertinoIcons.forward,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          ...List.generate(
            isTapped ? 2 : 0,
            (index) => Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(9),
                  ),
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.systemBlackColor,
                    borderRadius: BorderRadius.circular(188),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(15),
                ),
                Flexible(
                  child: DefaultText(
                    text:
                        'reception - consultation of a neurologist - 10 000 tg',
                    fontWeight: FontWeight.w400,
                    isCenter: false,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
