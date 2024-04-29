
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants/Assets.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_provider/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_provider/Utils/Extintions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Constants.dart';
import '../../../Localization/keys.dart';
import '../../../main.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/FlatAppButton.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController pageController = PageController();
  var isLastPage = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
        Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SVGIcons.appLogoIcon(width: 113,height: 95,color: Colors.black),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 450,
                  child: NotificationListener<ScrollEndNotification>(
                    onNotification: (notificationDetails){
                      if(pageController.page == 3){
                        setState(() {
                          isLastPage = true;
                        });
                      }
                      else {
                        setState(() {
                          isLastPage = false;
                        });
                      }
                      return true;
                    },
                    child: PageView.builder(
                      itemCount: 4,
                      controller: pageController,
                      itemBuilder: (context, index) => Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.appGrey6,width: 2),
                            ),
                            child: SizedBox(
                              width: context.getScreenSize.width * .95,
                              child: const ImageView(
                                isCircle: false,
                                placeHolder: placeholder,
                                width: 250,height: 250,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Lorem ipsum dolor sit amet consectetur Sed.",
                              textAlign: TextAlign.center,
                              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts20w700,),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Text(
                                textAlign: TextAlign.center,
                                "Lorem ipsum dolor sit amet consectetur. Amet iaculis massa urna tortor. Senectus mollis ante cras habitant ut. Euismod nam quis ac id.",
                                style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SmoothPageIndicator(
                    controller: pageController,  // PageController
                    count:  4,
                    effect:  CustomizableEffect(
                      activeDotDecoration: DotDecoration(width: 12,height: 2,borderRadius: BorderRadius.circular(4),color: AppTheme.mainAppColor),
                      dotDecoration:  DotDecoration(width: 12,height: 2,borderRadius: BorderRadius.circular(4),color: AppTheme.mainAppColorLight),
                    ),  // your preferred effect
                    onDotClicked: (index){
                      pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                    }
                ),
                const SizedBox(height: 30),
                isLastPage ? AppButton(onPress: getStarted,text: context.tr(letsStartKey) ,width: context.getScreenSize.width * 0.95,height: 56,) : const SizedBox(height: 56,)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8),
              child: Align(alignment:AlignmentDirectional.topEnd,child: FlatAppButton(onPress:getStarted,text: context.tr(skipKey),txtColor: AppTheme.appSwatch,)),
            )
          ],
        )
      ),
    );
  }
  void getStarted(){
    // context.go(R_LoginScreen);
    prefs.setBool(doneLandingKey,true);
  }
}
