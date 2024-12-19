import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Constants.dart';

class ImageView extends StatelessWidget {
  final String? initialImg;
  final String? placeHolder;
  final double? width;
  final double? height;
  final bool? isCircle;
  final double? borderSize;
  final Color? borderColor;
  final BorderRadius? radius;

  const ImageView({
    super.key,
    this.initialImg,
    this.width,
    this.height,
    this.placeHolder,
    this.isCircle,
    this.radius,
    this.borderSize,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    // Extract dimensions from the link
    final Uri? uri = initialImg != null ? Uri.tryParse(initialImg!) : null;
    final parsedWidth = uri?.queryParameters['w'] != null
        ? double.tryParse(uri!.queryParameters['w']!)
        : null;
    final parsedHeight = uri?.queryParameters['h'] != null
        ? double.tryParse(uri!.queryParameters['h']!)
        : null;

    // Determine final width and height
    final double finalWidth = width ?? parsedWidth ?? 50.0;
    final double finalHeight = height ?? parsedHeight ?? 50.0;

    return Container(
      clipBehavior: Clip.antiAlias,
      width: finalWidth,
      height: finalHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: isCircle == true ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: radius,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderSize ?? 0,
        ),
      ),
      child: isCircle == true
          ? ClipOval(
        child: _isSvg(initialImg)
            ? SvgPicture.network(
          initialImg ?? "",
          placeholderBuilder: (context) => Image.asset(
            placeHolder ?? userPlaceholder,
            fit: BoxFit.cover,
            width: finalWidth,
            height: finalHeight,
          ),
          height: finalHeight,
          width: finalWidth,
          fit: BoxFit.cover,
        )
            : CachedNetworkImage(
          placeholder: (context, url) => Image.asset(
            placeHolder ?? userPlaceholder,
            fit: BoxFit.cover,
            width: finalWidth,
            height: finalHeight,
          ),
          imageUrl: initialImg ?? "",
          errorWidget: (context, err, child) => Image.asset(
            placeHolder ?? userPlaceholder,
            fit: BoxFit.cover,
            width: finalWidth,
            height: finalHeight,
          ),
          fit: BoxFit.cover,
        ),
      )
          : _isSvg(initialImg)
          ? SvgPicture.network(
        initialImg ?? "",
        placeholderBuilder: (context) => Image.asset(
          placeHolder ?? userPlaceholder,
          fit: BoxFit.cover,
          width: finalWidth,
          height: finalHeight,
        ),
        height: finalHeight,
        width: finalWidth,
        fit: BoxFit.cover,
      )
          : CachedNetworkImage(
        placeholder: (context, url) => Image.asset(
          placeHolder ?? userPlaceholder,
          fit: BoxFit.cover,
          width: finalWidth,
          height: finalHeight,
        ),
        imageUrl: initialImg ?? "",
        errorWidget: (context, err, child) => Image.asset(
          placeHolder ?? userPlaceholder,
          fit: BoxFit.cover,
          width: finalWidth,
          height: finalHeight,
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  bool _isSvg(String? url) {
    return url?.isNotEmpty == true &&
        url?.toLowerCase().endsWith(".svg") == true;
  }
}
