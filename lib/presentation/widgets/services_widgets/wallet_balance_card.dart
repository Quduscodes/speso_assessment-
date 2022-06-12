import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:speso_assessment/constants/colors.dart';
import 'package:speso_assessment/constants/text_theme.dart';

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80.w,
                  height: 1.5.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: AppPallet.greyColor1,
                  ),
                ),
                Container(
                  height: 22.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: const Alignment(0.8, 1),
                        colors: <Color>[
                          AppPallet.blueColor1,
                          AppPallet.pinkColor1,
                          AppPallet.blueColor1,
                        ],
                        tileMode: TileMode.mirror,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: AssetImage("assets/png/Wallet_Banner.png"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wallet \nBalance",
                          style: CustomTheme.normalText(context)
                              .copyWith(color: AppPallet.whiteColor),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          "₦ 40,000.00",
                          style: CustomTheme.semiLargeText(context)
                              .copyWith(color: AppPallet.whiteColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
