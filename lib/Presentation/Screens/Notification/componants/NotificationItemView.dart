import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';

class NotificationItemView extends StatefulWidget {
  final String imageUrl;
  final bool isReading;
  const NotificationItemView({super.key, required this.imageUrl, required this.isReading});

  @override
  State<NotificationItemView> createState() => _NotificationItemViewState();
}

class _NotificationItemViewState extends State<NotificationItemView> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
        color: widget.isReading ? Colors.white : AppTheme.appGrey12,
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    fit: BoxFit.cover,
                    widget.imageUrl,
                    width: 42,
                    height: 42,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. Mattis venenatis.",
                    style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w400,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text("3:26 PM",style: AppTheme.styleWithTextGray13AdelleSansExtendedFonts11w400,)
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const Divider(
              height: 1,
              color: AppTheme.appGrey11,
            )
          ],
        ),
      ),
    );
  }
}
