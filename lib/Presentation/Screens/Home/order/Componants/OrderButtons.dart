import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Utils/Extintions.dart';

import '../../../../Widgets/AppButton.dart';

class OrderButtons extends StatelessWidget {
  final bool showViewDetails;
  const OrderButtons({super.key, required this.showViewDetails});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (showViewDetails)
        AppButton(
                  onPress: viewDetails,
                  child: Center(
          child: Text(
        "View Details",
        style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
            .copyWith(color: Colors.white),
                  )),
                )
      else
        Row(
          children: [
            Expanded(
                child: AppButton(
              onPress: viewDetails,
              child: Center(
                  child: Text(
                "Accept",
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
                    .copyWith(color: Colors.white),
              )),
            )),
            SizedBox(width: 8),
            Expanded(
                child: AppButton(
              onPress: viewDetails,
              backColor: AppTheme.mainAppColorLight2,
              child: Center(
                  child: Text(
                "Reject",
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
                    .copyWith(color: AppTheme.mainAppColor),
              )),
            ))
          ],
        ),
    ]);
  }

  void viewDetails() {}
}
