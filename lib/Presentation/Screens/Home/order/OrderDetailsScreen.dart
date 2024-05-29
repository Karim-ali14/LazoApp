import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Constants/Eunms.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderButtons.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/OrderUserInfromationWithOrderStatus.dart';
import 'package:lazo_provider/Presentation/Widgets/CustomAppBar.dart';

import '../../../../Localization/keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/SvgIcons.dart';
import 'Componants/InformationRowItem.dart';
import 'Componants/ProductItemCard.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String orderId;
  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        navigated: true,
        title: context.tr(orderDetailsKey),
        appContext: context,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppTheme.appGrey8, width: 1)),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: OrderUserInformationWithOrderStatus(user: null,)),
                    const SizedBox(
                      height: 32,
                    ),
                    Text("Order Info",
                        style:
                            AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.appGrey8, width: 1),
                          color: Colors.white),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      child: Column(
                        children: [
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text("Products",
                        style:
                        AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700),
                    const SizedBox(
                      height: 24,
                    ),
                    ProductItemCard()
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24,horizontal: defaultPaddingHorizontal),
            child: OrderButtons(type: ButtonsType.ViewDetails,),
          )
        ],
      ),
    );
  }
}
