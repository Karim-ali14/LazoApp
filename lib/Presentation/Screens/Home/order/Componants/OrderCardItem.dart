import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/InformationRowItem.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderButtons.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderUserInfromationWithOrderStatus.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/SvgIcons.dart';

import '../../../../../Constants/Assets.dart';

class OrderCardItem extends StatefulWidget {
  const OrderCardItem({super.key});

  @override
  State<OrderCardItem> createState() => _OrderCardItemState();
}

class _OrderCardItemState extends State<OrderCardItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppTheme.appGrey8,
              width: 1
            )
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              const OrderUserInformationWithOrderStatus(),
              const SizedBox(height: 24),
              InformationRowItem(
                icon: SVGIcons.totalPriceIcon(),
                title: "Total Price",
                value: "SAR 250",
              ),
              const SizedBox(height: 16),
              InformationRowItem(
                icon: SVGIcons.documentIcon(),
                title: "Order ID",
                value: "c95126",
              ),
              const SizedBox(height: 16),
              InformationRowItem(
                icon: SVGIcons.numberOfItemsIcon(),
                title: "No. of items",
                value: "3 Items",
              ),
              const SizedBox(height: 16),
              InformationRowItem(
                icon: SVGIcons.calendarIcon(),
                title: "Date / Time",
                value: "06:00 PM, 13/5/2024",
                hasDivider: false,
              ),
              OrderButtons(showViewDetails: false)
            ],
          ),
        ),
      ),
    );
  }
}
