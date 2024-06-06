import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Domain/UseCases/NotificationUseCase.dart';

import '../../Data/Network/lib/api.dart';

final showNotificationStateNotifiers = StateNotifierProvider.autoDispose<
        GetNotificationStateNotifiers,
        StateModel<ShowNotifications1200Response>>(
    (ref) => GetNotificationStateNotifiers(ref, ref.read(notificationApi)));


final makeNotificationReadStateNotifiers = StateNotifierProvider.autoDispose<
        MakeNotificationRead,
        StateModel<ReadANotification1200Response>>(
    (ref) => MakeNotificationRead(ref, ref.read(notificationApi)));
