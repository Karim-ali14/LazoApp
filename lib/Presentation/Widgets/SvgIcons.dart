import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazo_provider/Commes/Assets.dart';

import '../../Constants.dart';

class SVGIcons {
  static Widget whiteSplashAppLogoIcon({double width = 40, double height = 40}){
    return SvgPicture.asset(
      whiteSplashAppLogo,
      color: Colors.white,
      width: width,
      height: height,
    );
  }
  static Widget shareIcon(){
    return SvgPicture.asset(
      shareIconSvg,
      color: Colors.white,
      width: 40,
      height: 40,
    );
  }
  static Widget itemsIcon(){
    return SvgPicture.asset(
      itemsIconSvg,
      color: Colors.white,
      width: 30,
      height: 30,
    );
  }

  Widget networkSVG(link){
    return SvgPicture.network(
      link,
      color: Colors.white,
      width: 50,
      height: 50,
    );
  }

}