import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Domain/UseCases/TransactionsUseCases.dart';

import '../../Data/Models/StateModel.dart';
import '../../Data/Network/lib/api.dart';

final transactionStateProvider = StateNotifierProvider<TransactionsUseCases,
    StateModel<Showtransactions200Response>>((ref) {
  return TransactionsUseCases(ref.read(transactionsApi));
});
