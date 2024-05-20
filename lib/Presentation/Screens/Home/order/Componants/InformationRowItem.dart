import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';

import '../../../../../Localization/keys.dart';
import '../../../../Widgets/SvgIcons.dart';

class InformationRowItem extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? value;
  final bool? hasDivider;
  const InformationRowItem({super.key, this.icon, this.title, this.value, this.hasDivider = true});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            const SizedBox(width: 12),
            Text(
              context.tr("Total Price"),
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,
            ),
            const Spacer(),
            const Text(
              "SAR 250",
              style:
                  AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
            )
          ],
        ),
        if (hasDivider == true) const SizedBox(height: 16) else const SizedBox(),
        if (hasDivider == true) const Divider(color: AppTheme.appGrey8, height: 1) else const SizedBox()
      ]),
    );
  }
}
