import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_provider/Constants/Constants.dart';
import 'package:lazo_provider/Domain/CommonProviders/ApiProvider.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/BannerCardItems.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/ExpandedText.dart';
import 'package:lazo_provider/Presentation/Screens/Home/order/Componants/ProductRowItem.dart';
import 'package:lazo_provider/Presentation/StateNotifier_ViewModel/UserOrdersStateNotifiers.dart';
import 'package:lazo_provider/Presentation/Theme/AppTheme.dart';
import 'package:lazo_provider/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_provider/Utils/Extintions.dart';

import '../../../../Constants/Eunms.dart';
import '../../../../Data/Models/StateModel.dart';

class ItemOrderDetailsScreen extends ConsumerStatefulWidget {
  final String id;
  final OrderItemType orderItemType;
  const ItemOrderDetailsScreen({required this.id, required this.orderItemType,super.key});

  @override
  ConsumerState<ItemOrderDetailsScreen> createState() =>
      _ItemOrderDetailsScreenState();
}

class _ItemOrderDetailsScreenState
    extends ConsumerState<ItemOrderDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.orderItemType == OrderItemType.Product) {
        ref
            .read(getOrderProductItemDetailsStateProvider.notifier)
            .getProductItemDetails(widget.id);
      } else {
        ref
            .read(getOrderServiceItemDetailsStateProvider.notifier)
            .getServiceItemDetails(widget.id);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productItemState = ref.watch(getOrderProductItemDetailsStateProvider);
    final serviceItemState = ref.watch(getOrderServiceItemDetailsStateProvider);
    handleState(getOrderProductItemDetailsStateProvider, showLoading: true);
    handleState(getOrderServiceItemDetailsStateProvider, showLoading: true);

    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        navigated: true,
        isCenter: false,
        title: widget.orderItemType == OrderItemType.Product
            ? "Product Details"
            : "Service Details",
      ),
      body: productItemState.state == DataState.SUCCESS ||
              serviceItemState.state == DataState.SUCCESS
          ? SafeArea(
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
                        list: widget.orderItemType == OrderItemType.Product
                            ? (productItemState.data?.data?.images
                                        .map((item) => item.imagePath ?? "") ??
                                    [])
                                .toList()
                            : (serviceItemState.data?.data?.images
                                        .map((item) => item.imagePath ?? "") ??
                                    [])
                                .toList(),
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "${widget.orderItemType == OrderItemType.Product ? productItemState.data?.data?.name : serviceItemState.data?.data?.name} ",
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts18w700
                            .copyWith(overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Description",
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts18w700,
                      ),
                      const SizedBox(
                        height: defaultPaddingHorizontal,
                      ),
                      ExpandedText(
                        textContent:
                            "${widget.orderItemType == OrderItemType.Product ? productItemState.data?.data?.description : serviceItemState.data?.data?.description} ",
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
                                  padding:
                                      EdgeInsetsDirectional.only(start: 12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "About Product",
                                        style: AppTheme
                                            .styleWithTextBlackAdelleSansExtendedFonts16w500,
                                      ),
                                    ],
                                  ),
                                )),
                            widget.orderItemType == OrderItemType.Product
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: ProductRowItem(
                                      title: "Product Color",
                                      endWidget: Container(
                                        width: 13,
                                        height: 13,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: productItemState
                                                .data
                                                ?.data
                                                ?.colors
                                                .first
                                                .hexcode
                                                ?.getColorFromHex),
                                      ),
                                      textValue: productItemState
                                          .data
                                          ?.data
                                          ?.colors
                                          .first.name,
                                    ),
                                  )
                                : SizedBox(),
                            widget.orderItemType == OrderItemType.Product
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: ProductRowItem(
                                      title: "Product Size",
                                      textValue:
                                          "${productItemState.data?.data?.sizes.first.name}",
                                    ),
                                  )
                                : SizedBox(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: ProductRowItem(
                                title: "Categories",
                                textValue:
                                    "${widget.orderItemType == OrderItemType.Product ? productItemState.data?.data?.categories.map((item) => item.nameEn).join(" - ") : serviceItemState.data?.data?.categories.map((item) => item.nameEn).join(" - ")}",
                                hasDivider: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (widget.orderItemType == OrderItemType.Product)
                        ...(List.generate(
                            productItemState.data?.data?.productlists.length ??
                                0,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Text(
                                      "${productItemState.data?.data?.productlists[index].name}",
                                      style: AppTheme
                                          .styleWithTextBlackAdelleSansExtendedFonts18w700,
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    IntrinsicHeight(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 6),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: AppTheme.appGrey8),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            ...(List.generate(
                                                productItemState
                                                        .data
                                                        ?.data
                                                        ?.productlists[index]
                                                        .items
                                                        .length ??
                                                    0,
                                                (itemIndex) => ProductRowItem(
                                                      title:
                                                          "${productItemState.data?.data?.productlists[index].items[itemIndex].name}",
                                                      textValue:
                                                          "SAR ${productItemState.data?.data?.productlists[index].items[itemIndex].price}",
                                                      hasDivider: index != 4,
                                                    )))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )))
                      else
                        ...(List.generate(
                            serviceItemState.data?.data?.lists.length ??
                                0,
                                (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  "${serviceItemState.data?.data?.lists[index].name}",
                                  style: AppTheme
                                      .styleWithTextBlackAdelleSansExtendedFonts18w700,
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                IntrinsicHeight(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 6),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(4),
                                      border: Border.all(
                                          color: AppTheme.appGrey8),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        ...(List.generate(
                                            serviceItemState.data?.data?.lists.length ??
                                                0,
                                                (itemIndex) => ProductRowItem(
                                              title:
                                              "${serviceItemState.data?.data?.lists[index].items[itemIndex].name}",
                                              textValue:
                                              "SAR ${serviceItemState.data?.data?.lists[index].items[itemIndex].price}",
                                              hasDivider: index != 4,
                                            )))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ))),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
