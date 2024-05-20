import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_provider/Constants/Constants.dart';

import '../../../../../Constants/Assets.dart';
import '../../../../Theme/AppTheme.dart';
import '../../../../Widgets/CircleImage.dart';

class ProductItemCard extends StatefulWidget {
  const ProductItemCard({super.key});

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
                        borderRadius: BorderRadius.circular(4), color: Colors.white),
                    child: ImageView(
                      width: MediaQuery.of(context).size.width,
                      height: 122,
                      initialImg:
                      "https://t3.ftcdn.net/jpg/02/70/35/00/360_F_270350073_WO6yQAdptEnAhYKM5GuA9035wbRnVJSr.jpg",
                      placeHolder: placeholder,
                    ),
                  ),
                  const SizedBox(
                    width: defaultPaddingHorizontal,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Product Name",
                        style:
                        AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w500,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "SAR 350",
                        style: AppTheme.styleWithTextRedAdelleSansExtendedFonts16w500,
                      ),SizedBox(
                        height: 2,
                      ),
                      Text(
                        "SAR 450",
                        style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text("Size : ",style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400,),
                  Text("Small",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,),
                  Spacer(),
                  Text("Color : ",style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400,),
                  Text("Black",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,),
                  Spacer(),
                  Text("Amount : ",style: AppTheme.styleWithTextAppGrey7AdelleSansExtendedFonts14w400,),
                  Text("2",style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,),

                ],
              )
            ],
          )),
    );
  }
}
