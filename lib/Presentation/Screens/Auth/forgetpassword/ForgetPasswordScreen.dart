import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_provider/Utils/Extintions.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Localization/keys.dart';
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

  @override
  Widget build(BuildContext context) {
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
                ),
                SizedBox(
                  height: 16,
                ),
                AppButton(onPress: sendOtp ,text: "Continue",width: context.getScreenSize.width,),
              ],
            ),
          ),
      ),
    );
  }
  void sendOtp() async {

  }
}
