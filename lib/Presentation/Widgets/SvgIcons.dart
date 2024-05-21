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

  static Widget calendarIcon(){
    return SvgPicture.asset(
      calendarImg,
    );
  }

  static Widget documentIcon(){
    return SvgPicture.asset(
      documentImg,
    );
  }

  static Widget numberOfItemsIcon(){
    return SvgPicture.asset(
      numberOfItemsImg,
    );
  }

  static Widget totalPriceIcon(){
    return SvgPicture.asset(
      totalPriceImg,
    );
  }

  static Widget langIcon(){
    return SvgPicture.asset(
      langImg,
    );
  }
  static Widget deleteAccountIcon(){
    return SvgPicture.asset(
      deleteAccountImg,
    );
  }
  static Widget signOutIcon(){
    return SvgPicture.asset(
      signOutImg,
    );
  }
  static Widget privacyPolicyIcon(){
    return SvgPicture.asset(
      privacyPolicyImg,
    );
  }
  static Widget termsConditionsImgIcon(){
    return SvgPicture.asset(
      termsConditionsImg,
    );
  }
  static Widget shareImgIcon(){
    return SvgPicture.asset(
      shareImg,
    );
  }
  static Widget faqIcon(){
    return SvgPicture.asset(
      faqImg,
    );
  }
  static Widget contactUsIcon(){
    return SvgPicture.asset(
      contactUsImg,
    );
  }
  static Widget whatsAppImgIcon(){
    return SvgPicture.asset(
      whatsAppImg,
    );
  }
  static Widget redFaqIcon(){
    return SvgPicture.asset(
      redFaqImg,
    );
  }
  static Widget messageIcon(){
    return SvgPicture.asset(
      messageImg,
    );
  }
  static Widget callingIcon(){
    return SvgPicture.asset(
      callingImg,
    );
  }
  static Widget rightArrowWithBackgroundIcon(){
    return SvgPicture.asset(
      rightArrowWithBackgroundImg,
    );
  }
  static Widget downArrowWithBackgroundIcon(){
    return SvgPicture.asset(
      downArrowWithBackgroundImg,
    );
  }
  static Widget upArrowWithBackgroundIcon(){
    return SvgPicture.asset(
      upArrowWithBackgroundImg,
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