import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/CancellationReasonBottomSheet.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/InformationRowItem.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderCardItem.dart';
import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/UserOrdersStateNotifiers.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/AppButton.dart';
import 'package:lazo_provider/Presentation/Widgets/DataListView.dart';
import 'package:lazo_provider/Utils/OrderEx.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants/Eunms.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Utils/Snaks.dart';
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
  OrderStateActionType? actionType = null;

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
    final user =
        ref.read(providerTokenStateProvider.notifier).checkIfSavedUser();
    final newOrders = ref.watch(getNewOrderStateProvider);
    final currentOrders = ref.watch(getCurrentOrderStateProvider);
    final finishOrders = ref.watch(getFinishOrderStateProvider);
    final cancelOrders = ref.watch(getCanselOrderStateProvider);

    handleState(updateOrderStatusStateProvider,
        showLoading: true, showToast: true, onSuccess: (res) {
      if (actionType == OrderStateActionType.Accepte) {
        ref
            .read(getNewOrderStateProvider.notifier)
            .updateOrder(res.data!.data!);
      } else if (actionType == OrderStateActionType.Cancel) {
        ref
            .read(getNewOrderStateProvider.notifier)
            .deleteOrder(res.data!.data!);
        ref
            .read(getCanselOrderStateProvider.notifier)
            .updateList(res.data!.data!);
      } else if (actionType == OrderStateActionType.Preparing) {
        ref
            .read(getNewOrderStateProvider.notifier)
            .deleteOrder(res.data!.data!);
        ref
            .read(getCurrentOrderStateProvider.notifier)
            .updateList(res.data!.data!);
      } else if (actionType == OrderStateActionType.ReadyToShipping) {
        ref
            .read(getCurrentOrderStateProvider.notifier)
            .updateOrder(res.data!.data!);
      } else if (actionType == OrderStateActionType.Finish) {
        // ref
        //     .read(getCurrentOrderStateProvider.notifier)
        //     .deleteOrder(res.data!.data!);
        ref
            .read(getCurrentOrderStateProvider.notifier)
            .updateOrder(res.data!.data!);
      }
    });

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Tab(
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
                        "Cancelled Order",
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
                newOrders.state == DataState.EMPTY
                    ? OrderPlaceHolder(onAddOrderClick: () {})
                    : DataListView<ProviderOrderDetails>(
                        dataList: newOrders.data?.data?.data ??
                            (newOrders.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ProviderOrderDetails())
                                  ]
                                : []),
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
                                onOrderItemActionClick:
                                    (orderId, statusId, cancellationReason) {
                                  if (user?.provider?.status != "pending") {
                                    actionType = statusId.getOrderAction();
                                    print(
                                        "make oder state = ${actionType?.name}");
                                    if (actionType ==
                                        OrderStateActionType.Accepte) {
                                      ref
                                          .read(updateOrderStatusStateProvider
                                              .notifier)
                                          .updateOrderStatus(
                                              orderId: orderId,
                                              statusId: statusId);
                                    } else if (actionType ==
                                        OrderStateActionType.Cancel) {
                                      showCancellationBottomSheet(
                                          orderId, statusId);
                                    }else if (actionType ==
                                        OrderStateActionType.Preparing) {
                                      ref
                                          .read(updateOrderStatusStateProvider
                                          .notifier)
                                          .updateOrderStatus(
                                          orderId: orderId,
                                          statusId: statusId);
                                    }
                                  } else {
                                    AppSnackBar.showSnackBar(context,
                                        isSuccess: true, message: "Your account is still pending");
                                  }

                                    },
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel: item,
                              ),
                            )),
                currentOrders.state == DataState.EMPTY
                    ? OrderPlaceHolder(onAddOrderClick: () {})
                    : DataListView<ProviderOrderDetails>(
                        dataList: currentOrders.data?.data?.data ??
                            (currentOrders.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ProviderOrderDetails())
                                  ]
                                : []),
                        paginated: true,
                        pageLoading: currentPageForCurrentOrder <
                            (currentOrders.data?.data?.lastPage ?? 0),
                        onBottomReached: () {
                          if (currentPageForCurrentOrder <
                              (currentOrders.data?.data?.lastPage ?? 0)) {
                            ref
                                .read(getCurrentOrderStateProvider.notifier)
                                .getOrders(page: ++currentPageForCurrentOrder);
                          }
                        },
                        builder: (item) => Skeletonizer(
                              enabled: currentOrders.state == DataState.LOADING,
                              child: OrderCardItem(
                                onOrderItemActionClick:
                                    (orderId, statusId, cancellationReason) {
                                  if (user?.provider?.status != "pending") {
                                    actionType = statusId.getOrderAction();
                                    print(
                                        "make oder state = ${actionType?.name}");
                                    ref
                                        .read(updateOrderStatusStateProvider
                                            .notifier)
                                        .updateOrderStatus(
                                            orderId: orderId,
                                            statusId: statusId);
                                  } else {
                                    AppSnackBar.showSnackBar(context,
                                        isSuccess: true, message: "Your account is still pending");
                                  }

                                    },
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel: item,
                              ),
                            )),
                finishOrders.state == DataState.EMPTY
                    ? OrderPlaceHolder(onAddOrderClick: () {})
                    : DataListView<ProviderOrderDetails>(
                        dataList: finishOrders.data?.data?.data ??
                            (finishOrders.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ProviderOrderDetails())
                                  ]
                                : []),
                        paginated: true,
                        pageLoading: currentPageForFinishOrder <
                            (finishOrders.data?.data?.lastPage ?? 0),
                        onBottomReached: () {
                          if (currentPageForFinishOrder <
                              (finishOrders.data?.data?.lastPage ?? 0)) {
                            ref
                                .read(getFinishOrderStateProvider.notifier)
                                .getOrders(page: ++currentPageForFinishOrder);
                          }
                        },
                        builder: (item) => Skeletonizer(
                              enabled: finishOrders.state == DataState.LOADING,
                              child: OrderCardItem(
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel: item,
                              ),
                            )),
                cancelOrders.state == DataState.EMPTY
                    ? OrderPlaceHolder(onAddOrderClick: () {})
                    : DataListView<ProviderOrderDetails>(
                        dataList: cancelOrders.data?.data?.data ??
                            (cancelOrders.state == DataState.LOADING
                                ? [
                                    ...List.generate(
                                        5, (index) => ProviderOrderDetails())
                                  ]
                                : []),
                        paginated: true,
                        pageLoading: currentPageForCanceledOrder <
                            (cancelOrders.data?.data?.lastPage ?? 0),
                        onBottomReached: () {
                          if (currentPageForCanceledOrder <
                              (cancelOrders.data?.data?.lastPage ?? 0)) {
                            ref
                                .read(getCanselOrderStateProvider.notifier)
                                .getOrders(page: ++currentPageForCanceledOrder);
                          }
                        },
                        builder: (item) => Skeletonizer(
                              enabled: cancelOrders.state == DataState.LOADING,
                              child: OrderCardItem(
                                onOrderItemClick: (orderId) {
                                  navigateToOrderDetails(orderId);
                                },
                                orderModel: item,
                              ),
                            )),
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

  void updateData() {
    ref.read(getNewOrderStateProvider.notifier).getOrders();
    ref.read(getCurrentOrderStateProvider.notifier).getOrders();
    ref.read(getFinishOrderStateProvider.notifier).getOrders();
    ref.read(getCanselOrderStateProvider.notifier).getOrders();
  }

  void showCancellationBottomSheet(String orderId, String orderState) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (BuildContext builder) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: CancellationReasonBottomSheet(
                  onSelectItemCallback: (cancellationReason) {
                Navigator.pop(context);
                ref
                    .read(updateOrderStatusStateProvider.notifier)
                    .updateOrderStatus(
                        orderId: orderId,
                        statusId: orderState,
                        cancellationReason: cancellationReason);
              }),
            ));
  }
}
