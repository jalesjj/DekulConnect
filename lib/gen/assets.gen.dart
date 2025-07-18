// lib/gen/assets.gen.dart
/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic-checked.svg
  SvgGenImage get icChecked => const SvgGenImage('assets/icons/ic-checked.svg');

  /// File path: assets/icons/ic-home-grey.svg
  SvgGenImage get icHomeGrey =>
      const SvgGenImage('assets/icons/ic-home-grey.svg');

  /// File path: assets/icons/ic-home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/icons/ic-home.svg');

  /// File path: assets/icons/ic-keluar.svg
  SvgGenImage get icKeluar => const SvgGenImage('assets/icons/ic-keluar.svg');

  /// File path: assets/icons/ic-lock.svg
  SvgGenImage get icLock => const SvgGenImage('assets/icons/ic-lock.svg');

  /// File path: assets/icons/ic-profile-grey.svg
  SvgGenImage get icProfileGrey =>
      const SvgGenImage('assets/icons/ic-profile-grey.svg');

  /// File path: assets/icons/ic-profile.svg
  SvgGenImage get icProfile => const SvgGenImage('assets/icons/ic-profile.svg');

  /// File path: assets/icons/ic-rapot-grey.svg
  SvgGenImage get icRapotGrey =>
      const SvgGenImage('assets/icons/ic-rapot-grey.svg');

  /// File path: assets/icons/ic-rapot.svg
  SvgGenImage get icRapot => const SvgGenImage('assets/icons/ic-rapot.svg');

  /// File path: assets/icons/ic-unchecked.svg
  SvgGenImage get icUnchecked =>
      const SvgGenImage('assets/icons/ic-unchecked.svg');

  /// File path: assets/icons/ic-user.svg
  SvgGenImage get icUser => const SvgGenImage('assets/icons/ic-user.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    icChecked,
    icHomeGrey,
    icHome,
    icKeluar,
    icLock,
    icProfileGrey,
    icProfile,
    icRapotGrey,
    icRapot,
    icUnchecked,
    icUser,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/anak-anak.png
  AssetGenImage get anakAnak =>
      const AssetGenImage('assets/images/anak-anak.png');

  /// File path: assets/images/logo-guru.png
  AssetGenImage get logoGuru =>
      const AssetGenImage('assets/images/logo-guru.png');

  /// File path: assets/images/logo-ortu.png
  AssetGenImage get logoOrtu =>
      const AssetGenImage('assets/images/logo-ortu.png');

  /// File path: assets/images/select-guru.png
  AssetGenImage get selectGuru =>
      const AssetGenImage('assets/images/select-guru.png');

  /// File path: assets/images/select-ortu.png
  AssetGenImage get selectOrtu =>
      const AssetGenImage('assets/images/select-ortu.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    anakAnak,
    logoGuru,
    logoOrtu,
    selectGuru,
    selectOrtu,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
