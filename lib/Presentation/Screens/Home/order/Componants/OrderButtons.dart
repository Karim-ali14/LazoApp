import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Utils/Extintions.dart';

import '../../../../../Constants/Eunms.dart';
import '../../../../Widgets/AppButton.dart';

typedef OnButtonClickListener = Function(ButtonsClickType?);

class OrderButtons extends StatelessWidget {
  final bool isOrderDetail;
  final ButtonsType type;
  final OnButtonClickListener? onButtonClickListener;
  const OrderButtons( this.type,this.onButtonClickListener,{this.isOrderDetail = false,super.key,});

  @override
  Widget build(BuildContext context) {
    print("handle show buttons : ${(type == ButtonsType.ViewDetails && !isOrderDetail)}");
    return Column(children: [
      if (type == ButtonsType.ViewDetails && !isOrderDetail)
        AppButton(
                  onPress: () {
                    onButtonClickListener?.call(ButtonsClickType.ViewDetails);
                  },
                  child: Center(
          child: Text(
        "View Details",
        style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
            .copyWith(color: Colors.white),
                  )),
                )
      else if(type == ButtonsType.ShowAcceptOrCancel)
        Row(
          children: [
            Expanded(
                child: AppButton(
              onPress: (){
                onButtonClickListener?.call(ButtonsClickType.Accept);
              },
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
              onPress:(){
                onButtonClickListener?.call(ButtonsClickType.Cancel);
              },
              backColor: AppTheme.mainAppColorLight2,
              child: Center(
                  child: Text(
                "Reject",
                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
                    .copyWith(color: AppTheme.mainAppColor),
              )),
            ))
          ],
        )
      else if(type == ButtonsType.Finish)
          AppButton(
            onPress:(){
              onButtonClickListener?.call(ButtonsClickType.Finish);
            },
            child: Center(
                child: Text(
                  "Finished",
                  style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
                      .copyWith(color: Colors.white),
                )),
          )
        else if(type == ButtonsType.ReadyToShipping)
          AppButton(
            onPress:(){
              onButtonClickListener?.call(ButtonsClickType.ReadyToShipping);
            },
            backColor: AppTheme.mainAppColorLight2,
            child: const Center(
                child: Text(
                  "Ready to shipping",
                  style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w400,
                )),
          )
      else
        const SizedBox()
    ]);
  }
  void viewDetails() {}

}
