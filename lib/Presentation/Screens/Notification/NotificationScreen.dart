import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Presentation/Screens/Notification/componants/NotificationDateView.dart';
import 'package:lazo_provider/Presentation/Screens/Notification/componants/NotificationItemView.dart';
import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/NotificationStateNotifiers.dart';
import 'package:lazo_provider/Utils/DateUtils.dart';

import '../../../Data/Network/lib/api.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  // var notificationDates = <dynamic>[];
  // var notificationList = <ShowNotifications1200ResponseDataInner>[];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(showNotificationStateNotifiers.notifier).getNotification();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationState = ref.watch(showNotificationStateNotifiers);
    handleState(makeNotificationReadStateNotifiers,showLoading: true,onSuccess: (res){
      if(res.data?.data?.type == "order") {
        ref.read(showNotificationStateNotifiers.notifier).getNotification();
        navigateToOrderDetails(res.data?.data?.orderId.toString() ?? "");
      }
    });
    // handleState(showNotificationStateNotifiers,showLoading: true,onSuccess: (res){
    //   // notificationList.clear();
    //   // notificationList.addAll(
    //   //   res.data?.data ?? []
    //   // );
    //   // spiltNotificationsDates();
    // });
    return Scaffold(
        body: SafeArea(
            child: notificationState.data?.status == DataState.LOADING
                ? const Expanded(
                    child: Center(
                    child: CircularProgressIndicator(),
                  ))
                : ListView.builder(
                itemCount: ref.watch(showNotificationStateNotifiers.notifier).notificationDates.length,
                itemBuilder: (context, index) {
                  if(ref.watch(showNotificationStateNotifiers.notifier).notificationDates[index] is String){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20.0),
                      child: NotificationDateView(date: ref.watch(showNotificationStateNotifiers.notifier).notificationDates[index]),
                    );
                  } else if(ref.watch(showNotificationStateNotifiers.notifier).notificationDates[index] is ShowNotifications1200ResponseDataInner){
                    return NotificationItemView(
                        notification: ( ref.watch(showNotificationStateNotifiers.notifier).notificationDates[index]! as ShowNotifications1200ResponseDataInner), onNotificationItemClick: (notificationItem ) {
                          if(notificationItem.type == "order"){
                            if(notificationItem.isRead == 0){
                              ref.read(makeNotificationReadStateNotifiers.notifier).readANotification(notificationItem.id.toString());
                            }else {
                              navigateToOrderDetails(notificationItem.orderId.toString());
                            }
                          }
                    },);}
                  })));
  }

  // void spiltNotificationsDates() {
  //   notificationDates.clear();
  //   List<String> dates = [];
  //   notificationList.forEach((notificationModel) {
  //     notificationList.asMap().forEach((index, notifyModel) {
  //       if (notificationModel.createdAt?.stringToDate() ==
  //           notifyModel.createdAt?.stringToDate()) {
  //         if (dates.contains(notificationModel.createdAt?.stringToDate())) {
  //           if (!notificationDates.contains(notifyModel))
  //             notificationDates.add(notifyModel);
  //         } else {
  //           dates.add(notificationModel.createdAt!.stringToDate());
  //           notificationDates.add(
  //               checkTodayOrYesterday(notificationModel.createdAt!.stringToDate()));
  //           if (!notificationDates.contains(notifyModel))
  //             notificationDates.add(notifyModel);
  //         }
  //       }
  //     });
  //   });
  // }
  //
  // String checkTodayOrYesterday(String date) {
  //   DateTime today = DateTime.now();
  //   DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
  //   print("dafsdfasdf $date ${today.ddMmYyyy()}");
  //   return date == today.ddMmYyyy()
  //       ? "Today"
  //       : date == yesterday.ddMmYyyy()
  //           ? "Yesterday"
  //           : date;
  // }

  void navigateToOrderDetails(String orderId) {
    context.push(
      R_OrderDetails,
        extra: {orderIdKey : orderId}
    );
  }
}
