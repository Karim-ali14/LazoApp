import 'package:flutter/services.dart';
import 'package:lazo_provider/Data/Network/lib/api.dart';
import 'package:lazo_provider/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_provider/Utils/Extintions.dart';

import '../../../../../Data/Providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../Constants.dart';
import '../../Data/Models/User.dart';
import '../../Localization/LanguageProvider.dart';
import '../../main.dart';
import '../Theme/AppTheme.dart';
import '../Theme/AppThemeHandler.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  // double _opc = 0.0;
  late AppThemeMode _appThemeMode;
  bool isThereUser = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4),(){
      // setState(() => _opc = 1.0);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
          statusBarColor:
          AppTheme.mainAppColor,statusBarIconBrightness: Brightness.dark)
      );
      ProviderLoginResponseData? user = ref.read(userProvider);
      print("Usersfsdfsdfsd $user");
      print("Usersfsdfsdfsd ${user == null}");
      if(user != null){
        context.go(R_MainScreen);
      }else if(prefs.getBool("doneLanding") == true){
        context.go(R_LoginScreen);
      }else {
        context.push(R_Onboarding);
      }
    });
    //setupInteractedMessage(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: SingleChildScrollView(
        child: Center(
          child:  Container(
            width: context.getScreenSize.width,
            height: context.getScreenSize.height,
            decoration: const BoxDecoration(
                color: AppTheme.mainAppColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Spacer(),
                TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    curve: Curves.ease,
                    duration: const Duration(seconds: 4),
                    builder: (BuildContext context, double opacity, Widget? child) {
                      return Opacity(
                          opacity: opacity,
                          child: SVGIcons.appLogoIcon(width: 191,height: 159)
                      );
                    }),

                // AnimatedPadding(duration: const Duration(milliseconds: 500),padding: EdgeInsets.only(top: _opc == 1.0 ? 0 : 130),
                //   child:  ,),
                const Spacer(),
                // AnimatedOpacity(opacity: _opc , duration: const Duration(milliseconds: 500),
                //   child: Container(),)
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppTheme.mainBackgroundLightColor,
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor:
            Colors.white,statusBarIconBrightness: Brightness.dark)
    );
  }
}
