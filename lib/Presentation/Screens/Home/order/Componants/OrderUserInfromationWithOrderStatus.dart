import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Utils/OrderEx.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../Data/Network/lib/api.dart';
import '../../../../../Localization/keys.dart';
import '../../../../Widgets/SvgIcons.dart';

class OrderUserInformationWithOrderStatus extends StatelessWidget {
  final ShowAllProviderSOrders200ResponseDataDataInner? orderModel;
  const OrderUserInformationWithOrderStatus({super.key, this.orderModel});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton.replace(
              replacement: const Icon(Icons.abc,size: 42,),
              child: orderModel?.user?.imagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        fit: BoxFit.cover,
                        orderModel?.user?.imagePath ?? "",
                        width: 42,
                        height: 42,
                        errorBuilder: (
                            BuildContext context,
                            Object error,
                            StackTrace? stackTrace,
                        ) {
                          return SVGIcons.defaultUserIcon();
                        },
                      ),
                    )
                  : SVGIcons.defaultUserIcon(),),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(clientNameKey),
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,
              ),
              const SizedBox(height: 6),
              Skeleton.replace(
                child: Text(
                  orderModel?.user?.name ?? "",
                  style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w700,
                ),
                replacement: const Text("Mohamed Farag",
                  style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w700,),
              ),
            ],
          ),
          const Spacer(),
          Skeleton.leaf(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: "${orderModel?.statusId}".getOrderStatusColor(context).withOpacity(0.1),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                child: Text(
                  "${orderModel?.statusId}".getOrderStatus(context),
                  style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400.copyWith(color: "${orderModel?.statusId}".getOrderStatusColor(context)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
