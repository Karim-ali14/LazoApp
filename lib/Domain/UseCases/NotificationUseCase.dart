

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';

import '../../Data/Network/lib/api.dart';

class GetNotificationStateNotifiers extends StateNotifier<StateModel<ShowNotifications1200Response>>{

  final Ref ref;
  final Notifications1Api notifications1api;
  GetNotificationStateNotifiers(this.ref, this.notifications1api):super(StateModel());

  void getNotification() async{
    state = StateModel.loading();
    request(() => notifications1api.showNotifications1());
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
