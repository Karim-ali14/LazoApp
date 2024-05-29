
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/SvgIcons.dart';

class OrderPlaceHolder extends StatelessWidget {
  final VoidCallback? onAddOrderClick;
  const OrderPlaceHolder({super.key, required this.onAddOrderClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SVGIcons.orderPlaceHolderSvgIcon(),
              const SizedBox(
                height: defaultPaddingHorizontal,
              ),
              Text("No booking orders now.",style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400.copyWith(height: 1.5),),
              const SizedBox(
                height: defaultPaddingHorizontal,
              )
            ],
          ),
        ));
  }
}
