import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Data/Network/lib/api.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';

import '../../Constants/Eunms.dart';

class OrderUseCase
    extends StateNotifier<StateModel<ShowAllProviderSOrders200Response?>> {
  final Ref ref;
  final Orders12Api api;
  final MainOrderStatus orderState;
  OrderUseCase(this.orderState, this.ref, this.api) : super(StateModel());

  void getOrders({int? page = 1}) async {

    state = page != 1 ? StateModel(data: state.data,state: DataState.MORE_LOADING) : StateModel.loading();
    requestForPagination(
        () => api.showAllProviderSOrders(status: orderState.name.toLowerCase(), page: page),
        onComplete: (res) {
      print("getOrders Size for ${orderState.name} ${res?.data?.data.isEmpty}");
      if(page != 1){
        List<ShowAllProviderSOrders200ResponseDataDataInner> data = state.data?.data?.data ?? [];
        state.data?.data?.data = [...data,...(res?.data?.data??[])];
        state = StateModel.success(state.data);
      }else {
        state = StateModel.success(res);
      }

      if (state.data?.data?.data.isEmpty == true) {
        state = StateModel.empty();
      }
    });
  }
}

class OrderDetailsUseCase
    extends StateNotifier<StateModel<ShowOrderDetails2200Response>> {
  final Ref ref;
  final Orders12Api api;
  OrderDetailsUseCase(this.ref, this.api) : super(StateModel());

  void getOrderDetails(String orderId) async {
    state = StateModel.loading();
    request(() => api.showOrderDetails2(orderId: orderId),
        onComplete: (res) {}, onFailure: (res) {});
  }

  void updateOrderDetailsState(int stateId){
    state.data?.data?.statusId = stateId;
    state = StateModel<ShowOrderDetails2200Response>(state: DataState.SUCCESS, data: state.data ,message: "" );
  }
}

class UpdateOrderStatusUseCase
    extends StateNotifier<StateModel<ManageOrders1200Response>> {
  final Ref ref;
  final Orders12Api orders12api;
  UpdateOrderStatusUseCase(this.ref, this.orders12api) : super(StateModel());

  void updateOrderStatus(String? cancellationReason, String? orderId,
      String? statusId, Function onSuccess) async {
    state = StateModel.loading();
    request(
        () => orders12api.manageOrders1(
            cancellationReason: cancellationReason,
            orderId: orderId,
            statusId: statusId),
        onComplete: (res) {
          print(res);
          if(res.status == true){
            onSuccess.call();
          }else{
            print(res.message);
          }
        });
  }
}
