import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Presentation/Dialogs/ContactUsBottomSheet.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_provider/Presentation/Widgets/SvgIcons.dart';

import 'Componants/MoreItemCard.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MoreItemCard(
              startIcon: SVGIcons.langIcon(),
              text: "Language",
              endIcon: Text(
                "English",
                style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w500,
              ),
            ),
          ),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
          InkWell(
            onTap: showContactUsBottomSheet,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MoreItemCard(
                startIcon: SVGIcons.contactUsIcon(),
                text: "Contact Us",
                endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
              ),
            ),
          ),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
          InkWell(
            onTap: (){
              context.push(R_FAQScreen);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MoreItemCard(
                startIcon: SVGIcons.faqIcon(),
                text: "FAQ",
                endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
              ),
            ),
          ),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MoreItemCard(
              startIcon: SVGIcons.shareImgIcon(),
              text: "Share The App",
              endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
            ),
          ),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MoreItemCard(
              startIcon: SVGIcons.termsConditionsImgIcon(),
              text: "Terms & Conditions",
              endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
            ),
          ),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MoreItemCard(
              startIcon: SVGIcons.langIcon(),
              text: "Privacy & Policy",
              endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
            ),
          ),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MoreItemCard(
              startIcon: SVGIcons.signOutIcon(),
              textWidget: Text(
                "Sign out",
                style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w500,
              ),
              endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
            ),
          ),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MoreItemCard(
              startIcon: SVGIcons.deleteAccountIcon(),
              textWidget: Text(
                "Sign out",
                style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w500,
              ),
              endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
            ),
          ),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
        ],
      )),
    );
  }

  void showContactUsBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        isScrollControlled: true, // Set isScrollControlled to true
        builder: (content) => ContactUsBottomSheet());
  }
}
