import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Constants/Eunms.dart';
import 'package:lazo_provider/Data/Network/lib/api.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/InformationRowItem.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderButtons.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderUserInfromationWithOrderStatus.dart';
import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/UserOrdersStateNotifiers.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_provider/Utils/DateUtils.dart';
import 'package:lazo_provider/Utils/OrderEx.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../Constants.dart';
import '../../../../../Localization/keys.dart';

typedef OnOrderItemClick = void Function(String);

class OrderCardItem extends ConsumerStatefulWidget {
  final OnOrderItemClick onOrderItemClick;
  final ShowAllProviderSOrders200ResponseDataDataInner? orderModel;
  const OrderCardItem(
      {super.key, required this.onOrderItemClick, required this.orderModel});

  @override
  ConsumerState<OrderCardItem> createState() => _OrderCardItemState();
}

class _OrderCardItemState extends ConsumerState<OrderCardItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          widget.onOrderItemClick.call("${widget.orderModel?.id ?? 0}");
        },
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.appGrey8, width: 1)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                OrderUserInformationWithOrderStatus(
                  clientImage: widget.orderModel?.user?.imagePath,
                  clientName: widget.orderModel?.user?.name,
                  stateId: widget.orderModel?.statusId.toString(),
                ),
                const SizedBox(height: 24),
                InformationRowItem(
                  icon: SVGIcons.totalPriceIcon(),
                  title: "Total Price",
                  value:
                      "${context.tr(SARKey)} ${widget.orderModel?.total ?? 0}",
                ),
                const SizedBox(height: 16),
                InformationRowItem(
                  icon: SVGIcons.documentIcon(),
                  title: "Order ID",
                  value: "${widget.orderModel?.id}",
                ),
                const SizedBox(height: 16),
                InformationRowItem(
                  icon: SVGIcons.numberOfItemsIcon(),
                  title: "No. of items",
                  value:
                      "${widget.orderModel?.orderItems.length} ${context.tr(itemsKey)}",
                ),
                const SizedBox(height: 16),
                InformationRowItem(
                  icon: SVGIcons.calendarIcon(),
                  title: "Date / Time",
                  value:
                      "${widget.orderModel?.createdAt?.hhMm()}, ${widget.orderModel?.createdAt?.ddMmYyyy()}",
                  hasDivider: false,
                ),
                const SizedBox(
                  height: defaultPaddingHorizontal,
                ),
                Skeleton.leaf(
                    child: OrderButtons(
                  "${widget.orderModel?.statusId}"
                      .getOrderStatusForShowButtons(context),
                  (type) {
                    print("$type");
                    handleOnButtonsClicks(type ?? ButtonsClickType.ViewDetails);
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///   2-accept, 4-preparing, 5-read_to_shipping, 10-cancel_ready_made_order, 11-cancel_collective_order

  void handleOnButtonsClicks(ButtonsClickType type) {
    switch (type) {
      case ButtonsClickType.ViewDetails:
        {
          navigateToOrderDetails(widget.orderModel?.id?.toString());
          break;
        }
      case ButtonsClickType.Accept:
        {
          ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
              null, widget.orderModel?.id.toString(), "2", () {
            updateData();
          });
          break;
        }
      case ButtonsClickType.Cancel:
        {
          ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
              null,
              widget.orderModel?.id.toString(),
              widget.orderModel?.orderFamily == "ready_made" ? "10" : "11", () {
            updateData();
          });
          break;
        }
      case ButtonsClickType.ReadyToShipping:
        {
          ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
              null, widget.orderModel?.id.toString(), "5", () {
            updateData();
          });
          break;
        }
      case ButtonsClickType.Finish:
        {
          ref.read(updateOrderStatusStateProvider.notifier).updateOrderStatus(
              null, widget.orderModel?.id.toString(), "7", () {
            updateData();
          });
          break;
        }
    }
  }

  void updateData() {
    ref.read(getNewOrderStateProvider.notifier).getOrders();
    ref.read(getCurrentOrderStateProvider.notifier).getOrders();
    ref.read(getFinishOrderStateProvider.notifier).getOrders();
    ref.read(getCanselOrderStateProvider.notifier).getOrders();
  }

  void navigateToOrderDetails(String? orderId) {
    if (orderId != null) {
      context.push(R_OrderDetails, extra: {orderIdKey: orderId});
    }
  }
}
