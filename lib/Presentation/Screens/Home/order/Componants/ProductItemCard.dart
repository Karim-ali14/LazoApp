import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Localization/keys.dart';

import '../../../../../Constants/Assets.dart';
import '../../../../../Data/Network/lib/api.dart';
import '../../../../Theme/AppTheme.dart';
import '../../../../Widgets/CircleImage.dart';

class ProductItemCard extends StatefulWidget {
  final ShowOrderDetails2200ResponseDataOrderItemsInner? item;
  const ProductItemCard({super.key, this.item});

  @override
  State<ProductItemCard> createState() => _ProductItemCardState();
}

class _ProductItemCardState extends State<ProductItemCard> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.appGrey8, width: 1)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 67,
                    width: 67,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white),
                    child: ImageView(
                      width: MediaQuery.of(context).size.width,
                      height: 122,
                      initialImg: widget.item?.product != null
                          ? widget.item?.product?.coverImagePath
                          : widget.item?.service?.coverImagePath,
                      placeHolder: placeholder,
                    ),
                  ),
                  const SizedBox(
                    width: defaultPaddingHorizontal,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.item?.product != null
                            ? widget.item?.product?.name ?? ""
                            : widget.item?.service?.name ?? "",
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts16w500,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "${context.tr(SARKey)} ${widget.item?.product != null ? widget.item?.product?.priceAfterDiscount : widget.item?.service?.priceAfterDiscount}",
                        style: AppTheme
                            .styleWithTextRedAdelleSansExtendedFonts16w500,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "${context.tr(SARKey)} ${widget.item?.product != null ? widget.item?.product?.price : widget.item?.service?.price}",
                        style: AppTheme
                            .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              widget.item?.product != null
                  ? Row(
                      children: [
                        Text(
                          "Size : ",
                          style: AppTheme
                              .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                        ),
                        Text(
                          "${widget.item?.product?.name}",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts14w500,
                        ),
                        Spacer(),
                        Text(
                          "Color : ",
                          style: AppTheme
                              .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                        ),
                        Text(
                          "${widget.item?.product?.name}",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts14w500,
                        ),
                        Spacer(),
                        Text(
                          "Amount : ",
                          style: AppTheme
                              .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                        ),
                        Text(
                          "${widget.item?.product?.amount}",
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts14w500,
                        ),
                      ],
                    )
                  : const SizedBox()
            ],
          )),
    );
  }
}
