import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Data/Network/lib/api.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/ViewModels/UserViewModel.dart';

import '../../Domain/UseCases/ProviderAuthUseCases.dart';

final providerLoginStateProvider = StateNotifierProvider.autoDispose<ProviderLoginUseCase,StateModel<ProviderLoginResponse>>((ref) => ProviderLoginUseCase(ref, ref.read(providerAuthApi)));
final sendOtpStateProvider = StateNotifierProvider.autoDispose<SendOtpUseCase,StateModel<Object>>((ref) => SendOtpUseCase(ref, ref.read(providerAuthApi)));
final confirmResetCodeStateProvider = StateNotifierProvider.autoDispose<ConfirmResetCodeUseCase,StateModel<Object>>((ref) => ConfirmResetCodeUseCase(ref, ref.read(providerAuthApi)));
final changePasswordStateProvider = StateNotifierProvider.autoDispose<ChangePasswordUseCase,StateModel<Object>>((ref) => ChangePasswordUseCase(ref, ref.read(providerAuthApi)));

final providerTokenStateProvider = StateNotifierProvider<UserProvider,ProviderLoginResponseData?>((ref) => UserProvider(ref));
final providerLogoutStateProvider = StateNotifierProvider.autoDispose<LogoutUseCase,StateModel<String>>((ref) => LogoutUseCase(ref,ref.read(providerApi)));
final providerDeleteAccountStateProvider = StateNotifierProvider.autoDispose<ProviderDeleteAccountUseCase,StateModel<bool>>((ref) => ProviderDeleteAccountUseCase(ref,ref.read(providerApi)));
