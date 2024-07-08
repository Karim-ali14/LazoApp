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
    state = page != 1
        ? StateModel(data: state.data, state: DataState.MORE_LOADING)
        : StateModel.loading();
    requestForPagination(
        () => api.showAllProviderSOrders(
            status: orderState.name.toLowerCase(),
            page: page), onComplete: (res) {
      print("getOrders Size for ${orderState.name} ${res?.data?.data.isEmpty}");
      if (page != 1) {
        List<ProviderOrderDetails> data = state.data?.data?.data ?? [];
        state.data?.data?.data = [...data, ...(res?.data?.data ?? [])];
        state = StateModel.success(state.data);
      } else {
        state = StateModel.success(res);
      }

      if (state.data?.data?.data.isEmpty == true) {
        state = StateModel.empty();
      }
    });
  }

  void updateList(ProviderOrderDetails order) {
    List<ProviderOrderDetails> data = state.data?.data?.data ?? [];
    state.data?.data?.data = [
      ...data,
      ...([order])
    ];
    state = StateModel.success(state.data);
  }

  void updateOrder(ProviderOrderDetails order) {
    List<ProviderOrderDetails> data = state.data?.data?.data ?? [];
    var indexWhere = data.indexWhere((item) => item.id == order.id);
    data[indexWhere] = order;
    state.data?.data?.data = [...data];
    state = StateModel.success(state.data);
  }

  void deleteOrder(ProviderOrderDetails order) {
    try {
      List<ProviderOrderDetails> data =
          (state.data?.data?.data ?? []).toList(growable: true);
      print(data.length);
      var index = data.indexWhere((item) => item.id == order.id);
      print(index);
      data.removeAt(index);
      print(data.length);

      state.data?.data?.data = data;
      if (data.isNotEmpty) {
        state = StateModel.success(state.data);
      } else {
        state = StateModel.empty(data: null);
      }
    } catch (e) {
      print(e);
    }
  }
}

class OrderDetailsUseCase
    extends StateNotifier<StateModel<ProviderOrderDetailsResponse>> {
  final Ref ref;
  final Orders12Api api;
  OrderDetailsUseCase(this.ref, this.api) : super(StateModel());

  void getOrderDetails(String orderId) async {
    state = StateModel.loading();
    request(() => api.showOrderDetails2(orderId: orderId),
        onComplete: (res) {}, onFailure: (res) {});
  }

  void updateOrderDetailsState(int stateId) {
    state.data?.data?.statusId = stateId;
    state = StateModel<ProviderOrderDetailsResponse>(
        state: DataState.SUCCESS, data: state.data, message: "");
  }
}

class OrderProductItemDetailsUserCase
    extends StateNotifier<StateModel<ProductDetailsResponse>> {
  final Ref ref;
  final PublicApi api;
  OrderProductItemDetailsUserCase(this.ref, this.api) : super(StateModel());

  void getProductItemDetails(String productId) async {
    state = StateModel.loading();
    request(() => api.showProductDetails(productId: productId),
        onComplete: (res) {});
  }
}

class OrderServiceItemDetailsUserCase
    extends StateNotifier<StateModel<ServiceShowResponse>> {
  final Ref ref;
  final PublicApi api;
  OrderServiceItemDetailsUserCase(this.ref, this.api) : super(StateModel());

  void getServiceItemDetails(String serviceId) async {
    state = StateModel.loading();
    request(() => api.showServiceDetails(serviceId: serviceId),
        onComplete: (res) {});
  }
}

class UpdateOrderStatusUseCase
    extends StateNotifier<StateModel<ProviderOrderDetailsResponse>> {
  final Ref ref;
  final Orders12Api orders12api;
  UpdateOrderStatusUseCase(this.ref, this.orders12api) : super(StateModel());

  void updateOrderStatus(
      {String? cancellationReason,
      String? orderId,
      String? statusId,
      Function? onLoading,
      Function(ProviderOrderDetailsResponse)? onSuccess,
      Function? onFailureRequest}) async {
    onLoading?.call();
    state = StateModel.loading();
    request(
      () => orders12api.manageOrders1(
          cancellationReason: cancellationReason,
          orderId: orderId,
          statusId: statusId),
    );
  }
}
