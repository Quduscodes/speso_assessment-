import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:speso_assessment/constants/colors.dart';
import 'package:speso_assessment/constants/text_theme.dart';

class QuickServicesWidget extends StatelessWidget {
  const QuickServicesWidget({this.svgAsset, this.title, Key? key})
      : super(key: key);
  final String? svgAsset;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.w,
      decoration: BoxDecoration(
          color: AppPallet.whiteColor, borderRadius: BorderRadius.circular(15)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    svgAsset!,
                    height: 30.sp,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    title!,
                    style: CustomTheme.normalText(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
