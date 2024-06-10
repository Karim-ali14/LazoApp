import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/InformationRowItem.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderCardItem.dart';
import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/UserOrdersStateNotifiers.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/AppButton.dart';
import 'package:lazo_provider/Presentation/Widgets/DataListView.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../StateNotifier_ViewModel/UserAuthStateNotifiers.dart';
import 'OrderPlaceHolder.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getNewOrderStateProvider.notifier).getOrders();
      ref.read(getCurrentOrderStateProvider.notifier).getOrders();
      ref.read(getFinishOrderStateProvider.notifier).getOrders();
      ref.read(getCanselOrderStateProvider.notifier).getOrders();
    });
    super.initState();
  }

  var currentPageForNewOrder = 1;
  var currentPageForCurrentOrder = 1;
  var currentPageForFinishOrder = 1;
  var currentPageForCanceledOrder = 1;

  @override
  Widget build(BuildContext context) {
    final newOrders = ref.watch(getNewOrderStateProvider);
    List<ShowAllProviderSOrders200ResponseDataDataInner> newOrderList = [];

    final currentOrders = ref.watch(getCurrentOrderStateProvider);
    final finishOrders = ref.watch(getFinishOrderStateProvider);
    final cancelOrders = ref.watch(getCanselOrderStateProvider);

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
              dividerColor: Colors.transparent,
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
                        color: activeTabIndex == 0
                            ? AppTheme.mainAppColor
                            : AppTheme.appGrey8,
                      ),
                      color: activeTabIndex == 0
                          ? AppTheme.mainAppColor
                          : AppTheme.appGrey9,
                    ),
                    child: Center(
                      child: Text(
                        "New Order",
                        style: activeTabIndex == 0
                            ? AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                            : AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                .copyWith(color: AppTheme.appGrey10),
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
                        color: activeTabIndex == 1
                            ? AppTheme.mainAppColor
                            : AppTheme.appGrey8,
                      ),
                      color: activeTabIndex == 1
                          ? AppTheme.mainAppColor
                          : AppTheme.appGrey9,
                    ),
                    child: Center(
                      child: Text(
                        "Current Order",
                        style: activeTabIndex == 1
                            ? AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                            : AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                .copyWith(color: AppTheme.appGrey10),
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
                        color: activeTabIndex == 2
                            ? AppTheme.mainAppColor
                            : AppTheme.appGrey8,
                      ),
                      color: activeTabIndex == 2
                          ? AppTheme.mainAppColor
                          : AppTheme.appGrey9,
                    ),
                    child: Center(
                      child: Text(
                        "Finish Order",
                        style: activeTabIndex == 2
                            ? AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                            : AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                .copyWith(color: AppTheme.appGrey10),
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
                        color: activeTabIndex == 3
                            ? AppTheme.mainAppColor
                            : AppTheme.appGrey8,
                      ),
                      color: activeTabIndex == 3
                          ? AppTheme.mainAppColor
                          : AppTheme.appGrey9,
                    ),
                    child: Center(
                      child: Text(
                        "Cancel Order",
                        style: activeTabIndex == 3
                            ? AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                            : AppTheme
                                .styleWithTextWhiteAdelleSansExtendedFonts14w400
                                .copyWith(color: AppTheme.appGrey10),
                      ),
                    ),
                  ),
                ),
              ],
              controller: tabController,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: [
                DataListView<ShowAllProviderSOrders200ResponseDataDataInner>(
                    dataList: newOrders.data?.data?.data ?? [...List.generate(5, (index) => ShowAllProviderSOrders200ResponseDataDataInner())],
                    paginated: true,
                    pageLoading: currentPageForNewOrder <
                        (newOrders.data?.data?.lastPage ?? 0),
                    onBottomReached: () {
                      if (currentPageForNewOrder <
                          (newOrders.data?.data?.lastPage ?? 0)) {
                        ref
                            .read(getNewOrderStateProvider.notifier)
                            .getOrders(page: ++currentPageForNewOrder);
                      }
                    },
                    builder: (item) => Skeletonizer(
                      enabled: newOrders.state == DataState.LOADING,
                      child: OrderCardItem(
                            onOrderItemClick: (orderId) {
                              navigateToOrderDetails(orderId);
                            },
                            orderModel: item,
                          ),
                    )),
                currentOrders.state == DataState.EMPTY
                    ? OrderPlaceHolder(onAddOrderClick: () {})
                    : Skeletonizer(
                        enabled: currentOrders.state == DataState.LOADING,
                        child: ListView.builder(
                            itemCount:
                                currentOrders.data?.data?.data.length ?? 5,
                            itemBuilder: (context, index) {
                              return OrderCardItem(
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel:
                                    currentOrders.data?.data!.data[index],
                              );
                            })),
                finishOrders.state == DataState.EMPTY
                    ? OrderPlaceHolder(onAddOrderClick: () {})
                    : Skeletonizer(
                        enabled: finishOrders.state == DataState.LOADING,
                        child: ListView.builder(
                            itemCount:
                                finishOrders.data?.data?.data.length ?? 0,
                            itemBuilder: (context, index) {
                              return OrderCardItem(
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel:
                                    finishOrders.data?.data!.data[index],
                              );
                            })),
                cancelOrders.state == DataState.EMPTY
                    ? OrderPlaceHolder(onAddOrderClick: () {})
                    : Skeletonizer(
                        enabled: cancelOrders.state == DataState.LOADING,
                        child: ListView.builder(
                            itemCount:
                                cancelOrders.data?.data?.data.length ?? 0,
                            itemBuilder: (context, index) {
                              return OrderCardItem(
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel:
                                    cancelOrders.data?.data!.data[index],
                              );
                            })),
              ],
            ))
          ],
        ),
      ),
    );
  }

  void logout() async {
    await ref.read(providerTokenStateProvider.notifier).logout();
    context.go(R_LoginScreen);
  }

  void navigateToOrderDetails(String orderId) {
    context.push(R_OrderDetails, extra: {orderIdKey: orderId});
  }
}
