import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/InformationRowItem.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderCardItem.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/AppButton.dart';

import '../../StateNotifier_ViewModel/UserAuthStateNotifiers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 1;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this,initialIndex: 1);
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TabBar(
              indicatorPadding: EdgeInsets.zero,
              labelPadding: const EdgeInsetsDirectional.only(end: 10),
              physics: const ClampingScrollPhysics(),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  child: Container(
                    width: 150,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: activeTabIndex == 0 ? AppTheme.mainAppColor : AppTheme.appGrey8,
                      ),
                      color: activeTabIndex == 0 ? AppTheme.mainAppColor : AppTheme.appGrey9,
                    ),
                    child: Center(
                      child: Text(
                        "New Order",
                        style: activeTabIndex == 0 ? AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400 : AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400.copyWith(color: AppTheme.appGrey10),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 150,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: activeTabIndex == 1 ? AppTheme.mainAppColor : AppTheme.appGrey8,
                      ),
                      color: activeTabIndex == 1 ? AppTheme.mainAppColor : AppTheme.appGrey9,
                    ),
                    child: Center(
                      child: Text(
                        "Current Order",
                        style: activeTabIndex == 1 ? AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400 : AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400.copyWith(color: AppTheme.appGrey10),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 150,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: activeTabIndex == 2 ? AppTheme.mainAppColor : AppTheme.appGrey8,
                      ),
                      color: activeTabIndex == 2 ? AppTheme.mainAppColor : AppTheme.appGrey9,
                    ),
                    child: Center(
                      child: Text(
                        "New Order",
                        style: activeTabIndex == 2 ? AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400 : AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400.copyWith(color: AppTheme.appGrey10),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 150,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: activeTabIndex == 3 ? AppTheme.mainAppColor : AppTheme.appGrey8,
                      ),
                      color: activeTabIndex == 3 ? AppTheme.mainAppColor : AppTheme.appGrey9,
                    ),
                    child: Center(
                      child: Text(
                        "Current Order",
                        style: activeTabIndex == 3 ? AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400 : AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400.copyWith(color: AppTheme.appGrey10),
                      ),
                    ),
                  ),
                ),
              ],controller: tabController,),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              child: Center(
                child:
                // AppButton(onPress: logout ,text: "Logout"),
                OrderCardItem(onOrderItemClick: (orderId) {
                  context.push(R_OrderDetails,extra: {orderIdKey : orderId});
                },)
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
  void logout() async {
    await ref.read(providerTokenStateProvider.notifier).logout();
    context.go(R_LoginScreen);
  }
}
