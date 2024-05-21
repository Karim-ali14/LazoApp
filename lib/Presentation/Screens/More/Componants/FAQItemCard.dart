import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/SvgIcons.dart';

class FAQItemCard extends StatefulWidget {
  final String title;
  final String description;
  const FAQItemCard({super.key, required this.title, required this.description,});

  @override
  State<FAQItemCard> createState() => _FAQItemCardState();
}

class _FAQItemCardState extends State<FAQItemCard> {
  var expandedState = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          expandedState = !expandedState;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(defaultPaddingHorizontal),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppTheme.appGrey8),
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.title),
                Spacer(),
                expandedState ? SVGIcons.upArrowWithBackgroundIcon() : SVGIcons.downArrowWithBackgroundIcon()
              ],
            ),
            expandedState ? const SizedBox(
              height: defaultPaddingHorizontal,
            ):const SizedBox(),
            expandedState ? Text(
              widget.description,
              style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400.copyWith(height: 1.6),
            ) : const SizedBox()

          ],
        ),
      ),
    );
  }
}
