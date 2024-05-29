import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../Data/Network/lib/api.dart';
import '../../../../../Localization/keys.dart';
import '../../../../Widgets/SvgIcons.dart';

class OrderUserInformationWithOrderStatus extends StatelessWidget {
  final ShowAllProviderSOrders200ResponseDataDataInnerUser? user;
  const OrderUserInformationWithOrderStatus({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton.replace(
              child: user?.imagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        fit: BoxFit.cover,
                        user?.imagePath ?? "",
                        width: 42,
                        height: 42,
                      ),
                    )
                  : SVGIcons.defaultUserIcon(),replacement: const Icon(Icons.abc,size: 42,),),
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
                  user?.name ?? "",
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
                color: AppTheme.appGrey3,
                borderRadius: BorderRadius.circular(2),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                child: Text(
                  "Pending",
                  style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
