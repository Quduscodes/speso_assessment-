import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:speso_assessment/constants/colors.dart';
import 'package:speso_assessment/constants/text_theme.dart';
import 'package:speso_assessment/presentation/screens/chat_screen.dart';
import 'package:speso_assessment/presentation/screens/profile_screen.dart';
import 'package:speso_assessment/presentation/screens/scan_screen.dart';
import 'package:speso_assessment/presentation/screens/services_screen.dart';

class BottomAppBarScreen extends ConsumerStatefulWidget {
  const BottomAppBarScreen({Key? key}) : super(key: key);

  @override
  _BottomAppBarScreenVendorState createState() =>
      _BottomAppBarScreenVendorState();
}

class _BottomAppBarScreenVendorState extends ConsumerState<BottomAppBarScreen> {
  final GlobalKey<ScaffoldState>? _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController? _pageController = PageController(initialPage: 0);
  int? _page = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: AppPallet.greenColor2,
        body: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _page = page;
            });
          },
          physics: const NeverScrollableScrollPhysics(),
          children: bottomAppBarScreens!.toList(),
        ),
        bottomNavigationBar: Container(
          //height: 89.0.h,
          width: size.width,
          decoration: BoxDecoration(
            color: AppPallet.whiteColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 1.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < bottomAppBarScreens!.length; i++)
                  Expanded(
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _pageController!.animateToPage(i,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          });
                        },
                        child: Container(
                          width: 6.0.w,
                          height: 7.0.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            //borderRadius: BorderRadius.circular(35.0.h),
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  height: 4.h,
                                  width: 10.w,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    bottomAppBarAsset![i].assetImage!,
                                    color: i == _page
                                        ? AppPallet.purpleColor3
                                        : AppPallet.textColor2,
                                    fit: BoxFit.scaleDown,
                                    height: 3.h,
                                  )),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                bottomAppBarAsset![i].assetName!,
                                style: CustomTheme.smallText(context).copyWith(
                                  color: i == _page
                                      ? AppPallet.textColor
                                      : AppPallet.textColor2,
                                  fontWeight: i == _page
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
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

List<Widget>? bottomAppBarScreens = [
  const ChatScreen(),
  const ScanScreen(),
  const ServicesScreen(),
  const ProfileScreen(),
];

class BottomAppBarAssetModel {
  final String? assetName;
  final String? assetImage;
  final String? activeAssetImage;

  BottomAppBarAssetModel(
      {this.assetName, this.assetImage, this.activeAssetImage});
}

List<BottomAppBarAssetModel>? bottomAppBarAsset = [
  BottomAppBarAssetModel(
    assetName: 'Chat',
    assetImage: "assets/svg/messages-3.svg",
    activeAssetImage: "activeDashboard",
  ),
  BottomAppBarAssetModel(
    assetName: 'Scan',
    assetImage: "assets/svg/scan 2.svg",
    activeAssetImage: "activeOrders",
  ),
  BottomAppBarAssetModel(
    assetName: 'Services',
    assetImage: "assets/svg/Services.svg",
    activeAssetImage: "activeProduct",
  ),
  BottomAppBarAssetModel(
    assetName: 'Me',
    assetImage: "assets/svg/frame.svg",
    activeAssetImage: "activeVendorCentral",
  ),
];
