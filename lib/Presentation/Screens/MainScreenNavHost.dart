import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_provider/Localization/keys.dart';
import 'package:lazo_provider/Presentation/Screens/More/MoreScreen.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/SvgIcons.dart';

import '../Widgets/CustomAppBar.dart';
import 'Home/HomeScreen.dart';
import 'Notification/NotificationScreen.dart';

class MainScreenNavHost extends StatefulWidget {
  const MainScreenNavHost({super.key});

  @override
  State<MainScreenNavHost> createState() => _MainScreenNavHostState();
}

class _MainScreenNavHostState extends State<MainScreenNavHost> {
  Widget currentScreen = const HomeScreen();
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    List tabs = [
      context.tr(homeKey),
      context.tr(notificationsKey),
      context.tr(moreKey)
    ];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            appContext: context,
            isCenter: false,
            title:
                currentTab == 0 ? context.tr(yourOrdersKey) : tabs[currentTab],
          )),
      body: currentScreen,
      bottomNavigationBar:  Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: AppTheme.appGrey14,
              spreadRadius: 1,
              blurRadius: 20,
              offset: const Offset(0, -1))
        ]),
        child: BottomAppBar(
          elevation: 25,
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: SizedBox(
            height: 60,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = const HomeScreen();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    children: [
                      currentTab == 0 ?
                          SVGIcons.homeActiveIcon()
                          : SVGIcons.homeUnActiveIcon(),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        tabs[0],
                        style: currentTab == 0 ?
                        AppTheme.styleWithTextRedAdelleSansExtendedFonts11w500
                        : AppTheme.styleWithTextGray7AdelleSansExtendedFonts11w500
                        ,
                      )
                    ],
                  ),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = const NotificationScreen();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    children: [
                      currentTab == 1 ?
                          SVGIcons.notificationActiveIcon()
                          : SVGIcons.notificationUnActiveIcon(),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        tabs[1],
                        style: currentTab == 1 ?
                        AppTheme.styleWithTextRedAdelleSansExtendedFonts11w500
                        : AppTheme.styleWithTextGray7AdelleSansExtendedFonts11w500
                        ,
                      )
                    ],
                  ),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = const MoreScreen();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    children: [
                      currentTab == 2 ?
                          SVGIcons.moreActiveIcon()
                          : SVGIcons.moreUnActiveIcon(),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        tabs[2],
                        style: currentTab == 2 ?
                        AppTheme.styleWithTextRedAdelleSansExtendedFonts11w500
                        : AppTheme.styleWithTextGray7AdelleSansExtendedFonts11w500
                        ,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
