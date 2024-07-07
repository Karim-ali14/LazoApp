import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/BannerCardItems.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/ExpandedText.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/ProductRowItem.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';

class ItemOrderDetailsScreen extends StatefulWidget {
  const ItemOrderDetailsScreen({super.key});

  @override
  State<ItemOrderDetailsScreen> createState() => _ItemOrderDetailsScreenState();
}

class _ItemOrderDetailsScreenState extends State<ItemOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                BannerCardItems(
                  list: [
                    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
                    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
                  ],
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Name of product Saudi Arabi",
                  style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700
                      .copyWith(overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Description",
                  style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
                ),
                const SizedBox(
                  height: defaultPaddingHorizontal,
                ),
                ExpandedText(
                  textContent:
                      "A bouquet of pink lilies is a collection of delicate and fragrant flowers that are bound together to create a stunning floral arrangement. Pink lilies ardasf",
                  maxLength: 150,
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppTheme.appGrey8),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 51,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.appGrey8),
                            color: AppTheme.appGrey9,
                          ),
                          child: const Padding(
                            padding: EdgeInsetsDirectional.only(start: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "About Product",
                                  style: AppTheme
                                      .styleWithTextBlackAdelleSansExtendedFonts16w500,
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Product Color",
                          endWidget: Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Product Size",
                          textValue: "Small",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ProductRowItem(
                          title: "Categories",
                          textValue: "Category 1 - Category 2 - Category 3",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
