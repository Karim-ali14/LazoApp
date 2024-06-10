

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Utils/DateUtils.dart';

import '../../Data/Network/lib/api.dart';

class GetNotificationStateNotifiers extends StateNotifier<StateModel<ShowNotifications1200Response>>{

  var notificationDates = <dynamic>[];
  var notificationList = <ShowNotifications1200ResponseDataInner>[];

  final Ref ref;
  final Notifications1Api notifications1api;
  GetNotificationStateNotifiers(this.ref, this.notifications1api):super(StateModel());

  void getNotification() async{
    state = StateModel.loading();
    request(() => notifications1api.showNotifications1(),onComplete: (res){
      notificationList.clear();
      notificationList.addAll(
          res.data
      );
      spiltNotificationsDates();
    });
  }

  void spiltNotificationsDates() {
    notificationDates.clear();
    List<String> dates = [];
    notificationList.forEach((notificationModel) {
      notificationList.asMap().forEach((index, notifyModel) {
        if (notificationModel.createdAt?.stringToDate() ==
            notifyModel.createdAt?.stringToDate()) {
          if (dates.contains(notificationModel.createdAt?.stringToDate())) {
            if (!notificationDates.contains(notifyModel))
              notificationDates.add(notifyModel);
          } else {
            dates.add(notificationModel.createdAt!.stringToDate());
            notificationDates.add(
                checkTodayOrYesterday(notificationModel.createdAt!.stringToDate()));
            if (!notificationDates.contains(notifyModel))
              notificationDates.add(notifyModel);
          }
        }
      });
    });
  }

  String checkTodayOrYesterday(String date) {
    DateTime today = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    print("dafsdfasdf $date ${today.ddMmYyyy()}");
    return date == today.ddMmYyyy()
        ? "Today"
        : date == yesterday.ddMmYyyy()
        ? "Yesterday"
        : date;
  }

}


class MakeNotificationRead extends StateNotifier<StateModel<ReadANotification1200Response>>{
  final Ref ref;
  final Notifications1Api notifications1api;
  MakeNotificationRead(this.ref, this.notifications1api):super(StateModel());

  void readANotification(String notificationId) async{
    state = StateModel.loading();
    request(() => notifications1api.readANotification1(notificationId: notificationId));
  }
}
