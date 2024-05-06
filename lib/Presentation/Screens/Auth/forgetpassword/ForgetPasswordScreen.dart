import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Constants/Eunms.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_provider/Utils/Extintions.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Localization/keys.dart';
import '../../../StateNotifier_ViewModel/UserAuthStateNotifiers.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/AppButton.dart';
import '../../../Widgets/AppTextField.dart';
import '../../../Widgets/SvgIcons.dart';

class ForgetPasswordScreen extends ConsumerStatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ConsumerState<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  final phoneAndEmailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    handleState(sendOtpStateProvider,showLoading: true,showToast: true,onSuccess: (state){
      context.push("$R_LoginScreen/$R_ForgetPasswordScreen/$R_OTP",extra: {"emailOrPhone" : phoneAndEmailController.value.text , "type" : OTPType.Update});
    });
    return Scaffold(
      appBar: CustomAppBar(
          appContext: context,
          title: "Forget Password",
          isCenter: false,
          navigated: true,
          trailingWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
            child: Text(context.tr(arabicKey),style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w400,),
          )
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  SVGIcons.appLogoIcon(width: 113,height: 95,color: Colors.black),
                  const SizedBox(
                    height: 25,
                  ),
                  Text("Enter your phone number / email address we will send you a code to reset the password",style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400,),
                  const SizedBox(
                    height: 25
                  ),
                  AppTextField(
                    hint: context.tr(phoneNumberAndEmailAddressKey),
                    label: context.tr(phoneNumberAndEmailAddressKey),
                    textEditingController: phoneAndEmailController,
                    mode: AutovalidateMode.onUserInteraction,
                    validate: (value){
                      if(value?.isEmpty == true){
                        return "Enter your phone number or email address";
                      }else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AppButton(onPress:() {
                      sendOtp(phoneAndEmailController.value.text);
                  } ,text: "Continue",width: context.getScreenSize.width,),
                ],
              ),
            ),
          ),
      ),
    );
  }
  void sendOtp(String emailOrPhone) async {
    if (formKey.currentState?.validate() == true) {
      ref.read(sendOtpStateProvider.notifier).sendOtp(emailOrPhone);
    }
  }
}
