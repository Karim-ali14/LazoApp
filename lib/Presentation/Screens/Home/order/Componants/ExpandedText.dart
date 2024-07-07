import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';

class ExpandedText extends StatefulWidget {
  final String textContent;
  final int maxLength;
  const ExpandedText(
      {super.key, required this.textContent, required this.maxLength});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    String content = expanded
        ? "${widget.textContent} "
        : (widget.textContent.length > widget.maxLength
            ? "${widget.textContent.substring(0, widget.maxLength).trim()}... "
            : widget.textContent);

    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: content,
                  style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400.copyWith(height: 1.5,overflow: TextOverflow.ellipsis),
                ),
                TextSpan(
                  text : expanded ? "Read Less" : "Read More",
                  style: AppTheme.styleWithTextAppRedAdelleSansExtendedFonts14w400,
                  recognizer: TapGestureRecognizer()..onTap = (){
                    setState(() {
                      expanded = !expanded;
                    });
                  }
                )
              ]
            ),
          ),
        ),
      ],
    );
  }
}
