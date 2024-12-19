import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Data/Network/lib/api.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';

import '../../Data/Models/StateModel.dart';

class TransactionsUseCases
    extends StateNotifier<StateModel<Showtransactions200Response>> {

  final TransactionsApi api;

  TransactionsUseCases(this.api)
      : super(StateModel());
  void getTransactions({ String page = "1", String? dateFrom, String? dateTo,  }) async {
    state = page != "1"
        ? StateModel(data: state.data, state: DataState.MORE_LOADING)
        : StateModel.loading();
    requestForPagination(
            () => api.showtransactions( page: page),
        onComplete: (res) {
          if (int.parse(page) > 1) {
            List<TransactionDetails> data = state.data?.data?.transactions?.data ?? [];
            state.data?.data?.transactions?.data = [...data, ...(res.data?.transactions?.data?? [])];
            state = StateModel.success(state.data);
          } else {
            state = StateModel.success(res);
          }

          if (state.data?.data?.transactions?.data.isEmpty == true) {
            state = StateModel.empty();
          }
        });
  }
}
