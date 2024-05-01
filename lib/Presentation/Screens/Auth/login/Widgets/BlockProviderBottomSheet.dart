import 'package:flutter/cupertino.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/AppButton.dart';
import 'package:lazo_provider/Presentation/Widgets/SvgIcons.dart';


typedef OnContentUsClick = void Function();

class BlockProviderBottomSheet extends StatefulWidget {
  final OnContentUsClick onContentUsClick;
  const BlockProviderBottomSheet({super.key, required this.onContentUsClick});

  @override
  State<BlockProviderBottomSheet> createState() => _BlockProviderBottomSheetState();
}

class _BlockProviderBottomSheetState extends State<BlockProviderBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: defaultPaddingHorizontal,
        ),
        SVGIcons.warningIcon(),
        const SizedBox(
          height: defaultPaddingHorizontal,
        ),
        Text("Your account has block",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700),
        const SizedBox(
          height: defaultPaddingHorizontal,
        ),
        Text("please contact us to learn more",style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts16w400),
        const SizedBox(
          height: defaultPaddingHorizontal,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
          child: AppButton(onPress: () {
            widget.onContentUsClick.call();
          },child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SVGIcons.whiteCallingIcon(),
              const SizedBox(
                width: 7,
              ),
              const Text("Contact Us",style: AppTheme.styleWithTextWhiteAdelleSansExtendedFonts14w400)
            ],
          ),),
        ),
        const SizedBox(
          height: defaultPaddingHorizontal,
        ),
      ],
    );
  }
}

