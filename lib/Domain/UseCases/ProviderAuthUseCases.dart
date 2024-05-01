import 'dart:convert';

import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Data/Network/lib/api.dart';
import 'package:lazo_provider/Data/Providers/UserProvider.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_provider/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Constants.dart';
// import '../../Presentation/StateNotifiers-ViewModel/UserAuthStateNotifiers.dart';


class ProviderLoginUseCase extends StateNotifier<StateModel<ProviderLoginResponse>>{
  final Ref ref;
  final PublicAuthApi authApi;
  ProviderLoginUseCase( this.ref, this.authApi):super(StateModel());

  void login(String? emailOrPhone,String? pass) async {
    state = StateModel.loading();
    request(() => authApi.providerLoginPost(emailOrPhone: emailOrPhone , password: pass),onComplete: (resp) {
      ref.read(providerTokenStateProvider.notifier).setUser(resp.data);
    });
  }

}
// class UserSignUpUseCase extends StateNotifier<StateModel<String>> {
//
//   final Ref ref;
//   final PublicAuthApi _authenticationApi;
//   UserSignUpUseCase(this.ref, this._authenticationApi) : super(StateModel());
//
//   void signUp(SignUpRequest signUpRequest) async {
//     state = StateModel.loading();
//     print("Request $signUpRequest");
//     request(()=> _authenticationApi.clientRegisterPost(lang: "en",name: signUpRequest.fullName,email: signUpRequest.email,countryCode: signUpRequest.countryCode,phone: int.tryParse(signUpRequest.phone),termsAndConditions: 1),onComplete: (resp){
//       ref.read(userState.notifier).setUser(resp.data!);
//     });
//   }
//
// }
//
// class UserSignInUseCase extends StateNotifier<StateModel<UserRegisterResponse>> {
//
//   final Ref ref;
//   final PublicAuthenticationApi _authenticationApi;
//   UserSignInUseCase(this.ref, this._authenticationApi) : super(StateModel());
//
//   void login(String phone) async {
//     state = StateModel.loading();
//     print("Request $phone");
//     request(()=> _authenticationApi.clientLoginPost(phone : phone),onComplete: (resp){
//       ref.read(userState.notifier).setUser(resp.data!);
//     });
//   }
//
// }
//
// class SendOTPUseCase extends StateNotifier<StateModel<OTPSendResponse>> {
//
//   final Ref ref;
//   final PublicVerificationCodeApi _verificationApi;
//   SendOTPUseCase(this.ref, this._verificationApi) : super(StateModel());
//
//   void sendSignUpOtp(String phone) async {
//     state = StateModel.loading();
//     request(()=> _verificationApi.otpSendPost(phone: int.parse(phone),isRegistering: 1),onComplete: (resp){
//       print("Result Response $resp");
//     });
//   }
//   void sendLoginOtp(String phone) async {
//     state = StateModel.loading();
//     request(()=> _verificationApi.otpSendPost(phone: int.parse(phone),isRegistering: 0),onComplete: (resp){
//       print("Result Response $resp");
//     });
//   }
// }
//
// class OTPVerificationUseCase extends StateNotifier<StateModel<OTPVerifyResponse>> {
//
//   final Ref ref;
//   final PublicVerificationCodeApi _verificationApi;
//   OTPVerificationUseCase(this.ref, this._verificationApi) : super(StateModel());
//
//   void verification(String phone,int otp) async {
//     state = StateModel.loading();
//     request(()=> _verificationApi.otpVerifyPost(phone: int.parse(phone),otp: otp),onComplete: (resp){
//       print("Result Response $resp");
//     });
//   }
//
// }
//
// class UserProfileUpdateUseCase extends StateNotifier<StateModel<ClientProfileResponse>> {
//
//   final Ref ref;
//   final ClientApi _clientApi;
//   UserProfileUpdateUseCase(this.ref, this._clientApi) : super(StateModel());
//
//   void update({String? name,int? phone,String? email}) async {
//     state = StateModel.loading();
//     request(()=> _clientApi.clientProfileEditPut(name: name,phone: phone,email: email),onComplete: (resp){
//       print("Resp $resp");
//       Token? user = ref.read(userState);
//
//       user?.user?.phone = resp.data?.phone;
//       user?.user?.email = resp.data?.email;
//       user?.user?.name = resp.data?.name;
//
//       ref.read(userState.notifier).setUser(Token.fromJson(json.decode(json.encode(user?.toJson())))!);
//     });
//   }
//
// }

class UserProvider extends StateNotifier<ProviderLoginResponseData?> {

  final Ref ref;
  UserProvider(this.ref) : super(null);

  String? checkIfSavedUser(){
    return prefs.getString(userKey);
  }

  void setUser(ProviderLoginResponseData? providerObject){
    state = providerObject;
    prefs.setString(userKey, json.encode(providerObject?.toJson()));
    ref.read(apiClient).defaultHeaderMap.update("Authorization", (value) => "Bearer ${providerObject?.accessToken}",ifAbsent: ()=> "Bearer ${providerObject?.accessToken}");
  }

  Future<bool> logout() async {
    state = null;
    await prefs.remove(userKey);
    return true;
  }

}