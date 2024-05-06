import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_provider/Utils/Extintions.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Localization/keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/AppButton.dart';
import '../../../Widgets/AppTextField.dart';
import '../../../Widgets/CustomAppBar.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  final String emailOrPhone;
  final String code;
  const ChangePasswordScreen({super.key, required this.emailOrPhone, required this.code});

  @override
  ConsumerState<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {

  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    handleState(changePasswordStateProvider,showLoading: true,showToast: true,onSuccess: (state){
      context.go(R_LoginScreen);
    });

    return Scaffold(
      appBar: CustomAppBar(
          appContext: context,
          title: "Change Password",
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
                  height: 20,
                ),
                AppTextField (
                  hint: context.tr(passwordKey),
                  label: context.tr(passwordKey),
                  textEditingController: passwordController,
                  mode: AutovalidateMode.onUserInteraction,
                  validate: (value){
                    if(value?.isEmpty == true){
                      return "Enter your password";
                    }else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextField(
                  hint: context.tr("Confirm New Password"),
                  label: context.tr("Confirm New Password"),
                  textEditingController: confirmPasswordController,
                  mode: AutovalidateMode.onUserInteraction,
                  validate: (value){
                    if(value?.isEmpty == true){
                      return "Enter confirm password";
                    }else if(passwordController.value.text != confirmPasswordController.value.text){
                      return "password and confirm password not match";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(onPress: changePassword ,text: "Continue",width: context.getScreenSize.width,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changePassword() async {
    if(formKey.currentState?.validate() == true) {
      ref.read(changePasswordStateProvider.notifier).changePassword(
          widget.emailOrPhone, passwordController.value.text,
          confirmPasswordController.value.text);
    }
  }
}
