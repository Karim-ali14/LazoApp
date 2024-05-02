import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Presentation/Widgets/CustomAppBar.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Localization/keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/SvgIcons.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final String? emailOrPhone;
  const OtpScreen(this.emailOrPhone, {super.key});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appContext: context,
          title: "OTP",
          navigated: true,
          isCenter: false,
          trailingWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
            child: Text(context.tr(arabicKey),style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w400,),
          )
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SVGIcons.appLogoIcon(width: 113,height: 95,color: Colors.black),
            const SizedBox(
              height: 25,
            ),
            Text("Please enter the verification code you",style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400,),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                    text:TextSpan(
                        text: "received from ",
                        style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400,
                        children: <TextSpan>[
                          TextSpan(
                              text: widget.emailOrPhone,
                              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w700,
                              children: <TextSpan>[

                              ]
                          )
                        ]
                    )

                ),
                const SizedBox(
                  width: 8,
                ),
                SVGIcons.editIcon()
              ],
            ),

          ],
        ),
      ),
    );
  }
}
