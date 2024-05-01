import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Data/Network/lib/api.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';

import '../../Domain/UseCases/ProviderAuthUseCases.dart';

final providerLoginStateProvider = StateNotifierProvider.autoDispose<ProviderLoginUseCase,StateModel<ProviderLoginResponse>>((ref) => ProviderLoginUseCase(ref, ref.read(providerAuthApi)));

final providerTokenStateProvider = StateNotifierProvider<UserProvider,ProviderLoginResponseData?>((ref) => UserProvider(ref));
