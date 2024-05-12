import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Constants.dart';
import '../../Constants/Assets.dart';

class SVGIcons {
  static Widget appLogoIcon({double width = 40, double height = 40,Color color = Colors.white}){
    return SvgPicture.asset(
      whiteSplashAppLogo,
      color: color,
      width: width,
      height: height,
    );
  }

  static Widget warningIcon({double? width , double? height }){
    return SvgPicture.asset(
      warningIc,
      width: width,
      height: height,
    );
  }
  static Widget emailIcon({double? width , double? height }){
    return SvgPicture.asset(
      emailIc,
      width: width,
      height: height,
    );
  }
  static Widget redCallingIcon({double? width , double? height }){
    return SvgPicture.asset(
      redCallingIc,
      width: width,
      height: height,
    );
  }
  static Widget whiteCallingIcon({double? width , double? height }){
    return SvgPicture.asset(
      whiteCallingIc,
      width: width,
      height: height,
    );
  }
  static Widget whatsAppIcon({double? width , double? height }){
    return SvgPicture.asset(
      whatsAppIc,
      width: width,
      height: height,
    );
  }
  static Widget editIcon({double? width , double? height }){
    return SvgPicture.asset(
      editIc,
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

  static Widget defaultUserIcon(){
    return SvgPicture.asset(
      defaultUserImg,
      width: 43,
      height: 43,
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