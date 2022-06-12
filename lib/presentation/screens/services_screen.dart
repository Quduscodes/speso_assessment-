import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:speso_assessment/constants/colors.dart';
import 'package:speso_assessment/constants/text_theme.dart';
import 'package:speso_assessment/presentation/widgets/services_widgets/quick_services_card.dart';
import 'package:speso_assessment/presentation/widgets/services_widgets/wallet_balance_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);
  static const List<String> services = [
    "Top up",
    "Withdraw",
    "Receive",
    "Transactions"
  ];

  List<Color> getColor(int index) {
    switch (index) {
      case 0:
        return [AppPallet.blueColor2, AppPallet.blueColor2];

      case 1:
        return [AppPallet.orangeColor1, AppPallet.orangeColor2];

      case 2:
        return [AppPallet.greenColor1, AppPallet.greenColor2];

      case 3:
        return [AppPallet.purpleColor1, AppPallet.purpleColor2];
    }
    return [Colors.white];
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          // For Android.
          // Use [light] for white status bar and [dark] for black status bar.
          statusBarIconBrightness: Brightness.dark,
          // For iOS.
          // Use [dark] for white status bar and [light] for black status bar.
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
            backgroundColor: AppPallet.greyColor2,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Services",
                          style: CustomTheme.appHeaderText(context),
                        ),
                        Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                "assets/svg/setting.svg",
                                height: 25.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Expanded(
                    child: ListView(children: [
                      const WalletBalanceCard(),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      SizedBox(
                        height: 12.h,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                child: ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: services.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 7.0.w,
                                        ),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(15.0),
                                            // width: 20.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: const Alignment(0.8, 1),
                                                colors: <Color>[
                                                  ...getColor(index)
                                                ],
                                                tileMode: TileMode.mirror,
                                              ),
                                            ),
                                            child: SvgPicture.asset(
                                              "assets/svg/${services[index].replaceAll(" ", "").toLowerCase()}.svg",
                                              color: AppPallet.whiteColor,
                                              height: 20.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            services[index],
                                            style:
                                                CustomTheme.normalText(context),
                                          ),
                                        ],
                                      );
                                    }))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          "Quick Services",
                          style: CustomTheme.appHeaderText(context),
                        ),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            QuickServicesWidget(
                                svgAsset: "assets/svg/airtime.svg",
                                title: "Airtime"),
                            QuickServicesWidget(
                                svgAsset: "assets/svg/dollar-circle.svg",
                                title: "Pay Bill"),
                            QuickServicesWidget(
                                svgAsset: "assets/svg/convert-card.svg",
                                title: "Split Pay"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          "Refer and Earn",
                          style: CustomTheme.appHeaderText(context),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          height: 20.h,
                          child: Image.asset(
                            "assets/png/refer.png",
                            fit: BoxFit.contain,
                          ))
                    ]),
                  ),
                ],
              ),
            )));
  }
}
