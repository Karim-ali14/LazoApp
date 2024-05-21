import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';

import '../Widgets/AppButton.dart';

class AskBottomSheet extends StatefulWidget {
  final String title;
  final String description;
  final Widget icon;
  const AskBottomSheet({super.key, required this.title, required this.description, required this.icon});

  @override
  State<AskBottomSheet> createState() => _AskBottomSheetState();
}

class _AskBottomSheetState extends State<AskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal,vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Sign Out",
            style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
          ),
          const SizedBox(
            height: defaultPaddingHorizontal,
          ),
          widget.icon,
          const SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Text(
            widget.description,
            style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400,
          ),
          const SizedBox(
            height: defaultPaddingHorizontal,
          ),
          Row(
            children: [
              Expanded(
                  child: AppButton(
                    onPress: onPositiveButtonClick,
                    child: Center(
                        child: Text(
                          "Yes",
                          style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
                              .copyWith(color: Colors.white),
                        )),
                  )),
              SizedBox(width: 8),
              Expanded(
                  child: AppButton(
                    onPress: (){context.pop();},
                    backColor: AppTheme.mainAppColorLight2,
                    child: Center(
                        child: Text(
                          "No",
                          style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400
                              .copyWith(color: AppTheme.mainAppColor),
                        )),
                  ))
            ],
          )
        ],
      ),
    );
  }
  void onPositiveButtonClick(){

  }
}
