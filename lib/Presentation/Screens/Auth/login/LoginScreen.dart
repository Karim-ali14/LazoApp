import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Localization/keys.dart';
import 'package:lazo_provider/Presentation/Screens/Auth/login/Widgets/BlockProviderBottomSheet.dart';
import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_provider/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_provider/Utils/Extintions.dart';

import '../../../../Constants/Constants.dart';
import '../../../Widgets/AppButton.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneAndEmailController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    handleState(providerLoginStateProvider,showLoading: true,showToast: true,onSuccess: (state){
      print("success ....");
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPaddingHorizontal,
                  vertical: 20
                ),
                child: Row(
                  children: [
                    Text(context.tr(loginKey),style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts20w700,),
                    const Expanded(child: SizedBox()),
                    Text(context.tr(arabicKey),style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w400,),
                  ],
                ),
              ),
              SVGIcons.appLogoIcon(width: 113,height: 95,color: Colors.black),
              const SizedBox(
                height: 40,
              ),
              AppTextField(
                hint: context.tr(phoneNumberAndEmailAddressKey),
                label: context.tr(phoneNumberAndEmailAddressKey),
                textEditingController: phoneAndEmailController,
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextField (
                hint: context.tr(passwordKey),
                label: context.tr(passwordKey),
                textEditingController: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Spacer(),
                  InkWell(onTap: forgetPassword,child: Text(context.tr(forgetPasswordKey),style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w400,))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              AppButton(onPress: login,text: context.tr(loginKey),width: context.getScreenSize.width,),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account?",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w400,),
                  Text("Sign Up",style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w400.copyWith(decoration: TextDecoration.underline,decorationColor: AppTheme.mainAppColor),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void login() async {
    // if(phoneKey.currentState?.validate() == true){
      ref.read(providerLoginStateProvider.notifier).login(phoneAndEmailController.value.text, passwordController.value.text);
    // }
  }

  void forgetPassword() async {
    // if(phoneKey.currentState?.validate() == true){
    context.push(R_ForgetPasswordScreen);
    // }
  }

  void showBlockBottomSheet(){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (context) => BlockProviderBottomSheet(onContentUsClick: () {
          Navigator.pop(context);
        }));
  }


}
