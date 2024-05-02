import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Utils/Extintions.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Localization/keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/AppButton.dart';
import '../../../Widgets/AppTextField.dart';
import '../../../Widgets/CustomAppBar.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String emailOrPhone;
  const ChangePasswordScreen({super.key, required this.emailOrPhone});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              AppTextField (
                hint: context.tr(passwordKey),
                label: context.tr(passwordKey),
                textEditingController: passwordController,
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextField(
                hint: context.tr("Confirm New Password"),
                label: context.tr("Confirm New Password"),
                textEditingController: confirmPasswordController,
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(onPress: changePassword ,text: "Continue",width: context.getScreenSize.width,),
            ],
          ),
        ),
      ),
    );
  }

  void changePassword() async {
    Navigator.of(context).pushNamedAndRemoveUntil(R_LoginScreen, (Route route) => false);
    // if(phoneKey.currentState?.validate() == true){
    // ref.read(providerLoginStateProvider.notifier).login(phoneAndEmailController.value.text, passwordController.value.text);
    // }
  }
}
