
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Data/Network/lib/api.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';

import '../../Constants/Eunms.dart';

class OrderUseCase extends StateNotifier<StateModel<ShowAllProviderSOrders200Response>>{
  final Ref ref;
  final Orders12Api api;
  final MainOrderStatus orderState;
  OrderUseCase(this.orderState,this.ref, this.api):super(StateModel());

  void getOrders() async{
    state = StateModel.loading();
    request(()=> api.showAllProviderSOrders(status: orderState.name.toLowerCase()),onComplete: (res){
      print("getOrders Size for ${orderState.name} ${res.data?.data.isEmpty}");
      if(res.data?.data.isEmpty == true){
        state = StateModel.empty();
      }
    });
  }
}