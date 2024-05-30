import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:lazo_provider/Localization/keys.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';

import '../Constants/Eunms.dart';

extension OrderEx on String{
  String getOrderStatus(BuildContext context){
    String orderStatus = "";
    switch (this){
      case "0" : {
        orderStatus = context.tr(paddingKey);
        break;
      }case "1" : {
        orderStatus = context.tr(waitingKey);
        break;
      }case "4" : {
        orderStatus = context.tr(preparingKey);
        break;
      }case "5" : {
        orderStatus = context.tr(readyToShippingKey);
        break;
      }case "7" : {
        orderStatus = context.tr(finishedKey);
        break;
      }
    }
    return orderStatus;
  }
  Color getOrderStatusColor(BuildContext context){
    Color orderStatusColor = AppTheme.appYellow;
    switch (this){
      case "0" : {
        orderStatusColor = AppTheme.appYellow;
        break;
      }case "1" : {
        orderStatusColor = AppTheme.appBlue;
        break;
      }case "4" : {
        orderStatusColor = AppTheme.preparingColor;
        break;
      }case "5" : {
        orderStatusColor = AppTheme.readyToShippingColor;
        break;
      }case "7" : {
        orderStatusColor = AppTheme.finishColor;
        break;
      }
    }
    return orderStatusColor;
  }

  ButtonsType getOrderStatusForShowButtons(BuildContext context){
    ButtonsType orderStatusColor = ButtonsType.ViewDetails;
    switch (this){
      case "0" : {
        orderStatusColor = ButtonsType.ShowAcceptOrCancel;
        break;
      }case "1" : {
        orderStatusColor =  ButtonsType.ViewDetails;
        break;
      }case "4" : {
        orderStatusColor =  ButtonsType.ReadyToShipping;
        break;
      }case "5" : {
        orderStatusColor =  ButtonsType.Finish;
        break;
      }case "7" : {
        orderStatusColor =  ButtonsType.ViewDetails;
        break;
      }
    }
    return orderStatusColor;
  }
}