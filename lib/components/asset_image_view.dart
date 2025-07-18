// lib/components/asset_image_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dekul_connect_app/styles/styles.dart';

class AssetImageView extends StatelessWidget {
  final String fileName;
  final IconData? materialIcon;
  final double? height;
  final double? width;
  final Color? color;
  final double? scale;
  final BoxFit? fit;
  final GestureTapCallback? onTap;

  const AssetImageView({
    super.key,
    required this.fileName,
    this.materialIcon,
    this.height = 24,
    this.width = 24,
    this.color,
    this.scale,
    this.fit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: _getView());
  }

  Widget _getView() {
    if (fileName.trim().isEmpty) {
      return _fallbackIcon();
    }

    final mimType = fileName.split('.').last.toLowerCase();
    final path = fileName;

    switch (mimType) {
      case "svg":
        return SvgPicture.asset(
          path,
          height: height,
          width: width,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      case "png":
      case "jpg":
      case "jpeg":
        return Image.asset(
          path,
          height: height,
          width: width,
          color: color,
          scale: scale,
          fit: fit,
        );
      default:
        return materialIcon != null
            ? Icon(materialIcon, size: width, color: color)
            : _fallbackIcon();
    }
  }

  Widget _fallbackIcon() {
    return Icon(
      Icons.image_not_supported_outlined,
      size: width,
      color: color ?? AppColors.black,
    );
  }
}
