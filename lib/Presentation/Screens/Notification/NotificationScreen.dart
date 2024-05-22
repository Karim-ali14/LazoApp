import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_provider/Presentation/Screens/Notification/componants/NotificationDateView.dart';
import 'package:lazo_provider/Presentation/Screens/Notification/componants/NotificationItemView.dart';
import 'package:lazo_provider/Utils/DateUtils.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var notificationDates = <dynamic>[];
  var notificationList = <String>[]; // todo this will be notification model

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: NotificationItemView(
        imageUrl: "https://live.staticflickr.com/65535/52211883534_f45cb76810_z.jpg",
        isReading: false)));
  }

  void spiltNotificationsDates() {
    notificationDates.clear();
    List<String> dates = [];
    notificationList.forEach((notificationModel) {
      notificationList.asMap().forEach((index, notifyModel) {
        // if (notificationModel.created_at.stringToDate() ==
        //     notifyModel.created_at.stringToDate()) {
        //   if (dates.contains(notificationModel.created_at.stringToDate())) {
        //     if (!notificationDates.contains(notifyModel))
        //       notificationDates.add(notifyModel);
        //   } else {
        //     dates.add(notificationModel.created_at.stringToDate());
        //     notificationDates.add(
        //         checkTodayOrYesterday(notificationModel.created_at.stringToDate()));
        //     if (!notificationDates.contains(notifyModel))
        //       notificationDates.add(notifyModel);
        //   }
        // }
      });
    });
  }

  String checkTodayOrYesterday(String date) {
    DateTime today = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    return date == today.yMD()
        ? "Today"
        : date == yesterday.yMD()
        ? "Yesterday"
        : date;
  }

}
