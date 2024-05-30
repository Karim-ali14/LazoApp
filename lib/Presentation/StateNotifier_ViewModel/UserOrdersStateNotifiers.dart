

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Constants/Eunms.dart';
import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Data/Network/lib/api.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Domain/UseCases/OrderUseCase.dart';

final getNewOrderStateProvider = StateNotifierProvider.autoDispose<OrderUseCase,StateModel<ShowAllProviderSOrders200Response>>((ref) => OrderUseCase(MainOrderStatus.New,ref, ref.read(ordersApi)));
final getCurrentOrderStateProvider = StateNotifierProvider.autoDispose<OrderUseCase,StateModel<ShowAllProviderSOrders200Response>>((ref) => OrderUseCase(MainOrderStatus.Current,ref, ref.read(ordersApi)));
final getFinishOrderStateProvider = StateNotifierProvider.autoDispose<OrderUseCase,StateModel<ShowAllProviderSOrders200Response>>((ref) => OrderUseCase(MainOrderStatus.Finished,ref, ref.read(ordersApi)));
final getCanselOrderStateProvider = StateNotifierProvider.autoDispose<OrderUseCase,StateModel<ShowAllProviderSOrders200Response>>((ref) => OrderUseCase(MainOrderStatus.Cancelled,ref, ref.read(ordersApi)));

final getOrderDetailsStateProvider = StateNotifierProvider.autoDispose<OrderDetailsUseCase,StateModel<ShowOrderDetails2200Response>>((ref) => OrderDetailsUseCase(ref,ref.read(ordersApi)));