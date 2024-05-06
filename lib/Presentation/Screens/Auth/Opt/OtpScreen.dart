import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Constants/Eunms.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Presentation/Screens/Auth/Opt/Componants/OTPFields.dart';
import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_provider/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_provider/Utils/Extintions.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Localization/keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/AppButton.dart';
import '../../../Widgets/SvgIcons.dart';
import 'Componants/TimerCounter.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final String emailOrPhone;
  final OTPType? otpType;
  const OtpScreen({super.key,required this.emailOrPhone,required this.otpType});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final GlobalKey<OTPFieldsState> otpFieldsKeys = GlobalKey();
  final GlobalKey<TimerTextState> timerKey = GlobalKey();
  var readyToResendOtp = false;
  @override
  Widget build(BuildContext context) {

    handleState(sendOtpStateProvider,showLoading: true,showToast: true,onSuccess: (state){
      timerKey.currentState?.restart();
    });

    handleState(confirmResetCodeStateProvider,showLoading: true,showToast: true,onSuccess: (state){
      context.push(R_ChangePasswordScreen,extra: {"emailOrPhone":widget.emailOrPhone,"code" : otpFieldsKeys.currentState?.getCode});
    });

    return Scaffold(
      appBar: CustomAppBar(
          appContext: context,
          title: "OTP",
          navigated: true,
          isCenter: false,
          trailingWidget: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: Text(
              context.tr(arabicKey),
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w400,
            ),
          )),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SVGIcons.appLogoIcon(width: 113, height: 95, color: Colors.black),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Please enter the verification code you",
              style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                        text: "received from ",
                        style: AppTheme
                            .styleWithTextGray7AdelleSansExtendedFonts16w400,
                        children: <TextSpan>[
                      TextSpan(
                          text: widget.emailOrPhone,
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts16w700)
                    ])),
                const SizedBox(
                  width: 8,
                ),
                InkWell(child: SVGIcons.editIcon(),onTap: (){
                  context.pop();
                }),
              ],
            ),
            const SizedBox(height: 40,),
            OTPFields(key: otpFieldsKeys,),
            SizedBox(height: 20,),
            Padding(padding : const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal), child: AppButton(onPress: () {
              if(otpFieldsKeys.currentState?.formKey.currentState?.validate() == true){
                verifyPhoneOrEmail(widget.emailOrPhone,otpFieldsKeys.currentState?.getCode);
              }
            } ,text: "Continue",width: context.getScreenSize.width,)),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: TimerText(key: timerKey,onTimerFinish: (){
                  setState(() {
                    readyToResendOtp = true;
                  });
                },)
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                text: TextSpan(
                  text: "Resend verification code",
                  style: TextStyle(
                    color: readyToResendOtp ? AppTheme.mainAppColor : AppTheme.appGrey3, // Set the color to green
                    fontSize: 16.0,
                    decoration: TextDecoration.underline, // Underline the text
                  ),
                  recognizer: TapGestureRecognizer()..onTap = !readyToResendOtp ? null : (){
                    // if(widget.otpType == OTPType.SignUp){
                    //   ref.read(resendOTPStateNotifier.notifier).sendSignUpOtp(widget.emailOrPhone??"");
                    // }
                    // if(widget.otpType == OTPType.Login){
                    //   ref.read(resendOTPStateNotifier.notifier).sendLoginOtp(widget.emailOrPhone??"");
                    // }
                    setState(() {
                      readyToResendOtp = false;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendOtp(String emailOrPhone) async {
    ref.read(sendOtpStateProvider.notifier).sendOtp(emailOrPhone);
  }

  void verifyPhoneOrEmail(String emailOrPhone,String? code) async {
    ref.read(confirmResetCodeStateProvider.notifier).confirmReset(emailOrPhone, code);
  }
}
