import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Data/Models/StateModel.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Presentation/Dialogs/AskBottomSheet.dart';
import 'package:lazo_provider/Presentation/Dialogs/ContactUsBottomSheet.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_provider/Presentation/Widgets/SvgIcons.dart';

import '../../StateNotifier_ViewModel/UserAuthStateNotifiers.dart';
import 'Componants/MoreItemCard.dart';

class MoreScreen extends ConsumerStatefulWidget {
  const MoreScreen({super.key});

  @override
  ConsumerState<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends ConsumerState<MoreScreen> {

  @override
  Widget build(BuildContext context) {

    handleState(providerLogoutStateProvider,showLoading: true , onSuccess: (res){
      if(res.state == DataState.SUCCESS){
        navigateToLogin();
      }
    });

    handleState(providerDeleteAccountStateProvider,showLoading: true , onSuccess: (res){
      if(res.state == DataState.SUCCESS){
        navigateToLogin();
      }
    });

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
          InkWell(
            onTap: showSignOutBottomSheet,
            child: Padding(
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
          ),
          SizedBox(
            height: defaultPaddingHorizontal,
          ),
          InkWell(
            onTap: showDeleteAccountBottomSheet,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MoreItemCard(
                startIcon: SVGIcons.deleteAccountIcon(),
                textWidget: Text(
                  "Delete Account",
                  style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w500,
                ),
                endIcon: SVGIcons.rightArrowWithBackgroundIcon(),
              ),
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

  void showSignOutBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (builder) =>
        AskBottomSheet(
          title: "Sign Out",
          description: "Are you sure you want to sign out?",
          icon: SVGIcons.sadFaceIcon(), onPositiveButtonClick: () {
            ref.read(providerLogoutStateProvider.notifier).logout();
        },
        )
    );
  }

  void showDeleteAccountBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (builder) =>
        AskBottomSheet(
          title: "Delete Account",
          description: "Are you sure you want to delete account?",
          icon: SVGIcons.deleteAccountIcIcon(), onPositiveButtonClick: () {
            ref.read(providerDeleteAccountStateProvider.notifier).delete();
        },
        )
    );
  }

  void navigateToLogin() {
    context.go(R_LoginScreen);
  }
}
