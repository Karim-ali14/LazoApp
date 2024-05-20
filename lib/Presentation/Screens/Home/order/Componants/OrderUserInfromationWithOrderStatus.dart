import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';

import '../../../../../Localization/keys.dart';
import '../../../../Widgets/SvgIcons.dart';

class OrderUserInformationWithOrderStatus extends StatelessWidget {

  const OrderUserInformationWithOrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SVGIcons.defaultUserIcon(),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(clientNameKey),
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,
              ),
              const SizedBox(height: 6),
              Text(
                "Mohamed Farag",
                style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w700,
              ),

            ],
          ),
          const Spacer(),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppTheme.appGrey3,
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 11,vertical: 6),
              child: Text(
                "Pending",
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}