import 'package:kheloo/shared/constants/app_colors.dart';
import 'package:kheloo/shared/constants/app_image.dart';
import 'package:kheloo/utils/ui_text_style.dart';
import 'package:kheloo/views/dashboard/home/home_screen.dart';
import 'package:kheloo/views/dashboard/register/register_screen.dart';
import 'package:kheloo/views/dashboard/sports/sports_screen.dart';
import 'package:kheloo/views/dashboard/live_casino/live_casino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  int selectedNavbarIndex = 0;

  late TabController _tabController;

  List<Widget> screens = const [
    HomeScreen(),
    SportsScreem(),
    LiveCasinoScreen(),
    RegisterScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImage.icLogo, height: kToolbarHeight),
        actions: [
          GestureDetector(
              onTap: null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImage.icPromotion, width: 24),
                  Text(
                    "Promotions",
                    style:
                        UITextStyle.boldTextStyle(color: AppColor.yellowColor),
                  )
                ],
              )),
          Container(
              height: double.maxFinite,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.yellowGradientStart,
                  AppColor.yelloGradientEnd,
                ],
              )),
              child: Text(
                "Login".toUpperCase(),
                style: UITextStyle.regularTextStyle(
                    fontSize: 14, characterSpacing: 0.3, color: AppColor.white),
              )),
        ],
      ),
      body: screens[_tabController.index],
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Kheloo"),
                content: const Text("Do something on tap of add"),
                actions: [
                  TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text("Ok"))
                ],
              );
            },
          );
        },
        mini: true,
        elevation: 0,
        focusElevation: 0.0,
        hoverElevation: 0.0,
        disabledElevation: 0.0,
        highlightElevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: AppColor.yellowColorAlt,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        child: Icon(Icons.add, color: AppColor.blackColor),
      ),
      bottomNavigationBar: TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          unselectedLabelColor: AppColor.white,
          indicator: const BoxDecoration(),
          labelPadding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelColor: AppColor.white,
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
          onTap: _onItemTapped,
          tabs: [
            renderNavItem(
                label: 'Support',
                index: 0,
                selectedIcon: AppImage.icSupport,
                unselectedIcon: AppImage.icSupport,
                transform: Matrix4.skew(calculateTangent(15), 0.0)* Matrix4.translationValues(-20, 0.0, 0.0),
                decoration: BoxDecoration(
                  color: AppColor.yellowColor,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColor.yellowGradientStart,
                      AppColor.yelloGradientEnd,
                    ],
                    stops: const [0.0, 0.5],
                  ),
                )),
            renderNavItem(
                label: 'Sports',
                index: 1,
                selectedIcon: AppImage.icSports,
                unselectedIcon: AppImage.icSports),
            renderNavItem(
                label: 'Live Casino',
                index: 3,
                selectedIcon: AppImage.icCasino,
                unselectedIcon: AppImage.icCasino),
            renderNavItem(
                label: 'Register',
                index: 4,
                selectedIcon: AppImage.icProfile,
                unselectedIcon: AppImage.icProfile,
                transform: Matrix4.skew(calculateTangent(-15), 0.0) * Matrix4.translationValues(20, 0.0, 0.0) ,
                decoration: BoxDecoration(
                  color: AppColor.yellowColor,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColor.yellowGradientStart,
                      AppColor.yelloGradientEnd,
                    ],
                    stops: const [0.0, 0.5],
                  ),
                )),
          ]),
    );
  }

  _onItemTapped(int index) {
    _tabController.index = index;
    setState(() {});
  }

  double degreesToRadians(double degrees) {
    return degrees * math.pi / 180.0;
  }

  double calculateTangent(double degrees) {
    double radians = degreesToRadians(degrees);
    return math.tan(radians);
  }

  Widget renderNavItem(
      {String? label,
      int? index,
      String? selectedIcon,
      String? unselectedIcon,
      double? height,
      Matrix4? transform,
      Decoration? decoration}) {
    return Stack(
      children: [
          Positioned.fill(
          child: Container(
            transform: transform,
            decoration: decoration,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width * 0.25,
          height: kBottomNavigationBarHeight * 1.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _tabController.index == index ? selectedIcon! : unselectedIcon!,
                height: height ?? 24,
                width: height ?? 24,
                fit: BoxFit.fitHeight,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox(height: 24),
              ),
              const SizedBox(height: 5.0),
              Text(label!)
            ],
          ),
        ),
      ],
    );
  }
}
