import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';


String testImage3 =
    "https://bing.ioliu.cn/v1/rand?key=person&w=${Random().nextInt(700)}&h=${Random().nextInt(700)}";
String testImage =
    "https://picsum.photos/${Random().nextInt(700)}/${Random().nextInt(700)}/";
String testImage2 = "https://picsum.photos/${Random().nextInt(1000)}";

/// 网络图片加载
class MyImage extends StatelessWidget {
  final String? imageUrl;
  final String? placeholder;
  final BoxFit? fit;

  final Widget? child;
  final Color borderColor;
  final Color? color;

  final bool isAssetImage;

  /// 新增展示本地文件目录下的图片
  final bool isFileImage;
  final bool isOval;
  final bool hasBorder;

  final double borderWidth;
  final double radius;
  final double? height;
  final double? width;

  final errorWidget;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongPress;
  final GestureTapCallback? onDoubleTap;

  const MyImage(this.imageUrl,
      {Key? key,
      this.placeholder = '',
      this.child,
      this.fit = BoxFit.cover,
      // this.fit ,
      this.width,
      this.isAssetImage = false,
      this.isFileImage = false,
      this.isOval = false,
      this.hasBorder = false,
      this.color,
      this.borderColor = Colors.transparent,
      this.borderWidth = 0.5,
      this.radius = 0,
      this.height,
      this.onTap,
      this.onLongPress,
      this.onDoubleTap,
      this.padding,
      this.margin,
      this.errorWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (imageUrl == null) {
      return Container();
    }
    if (isFileImage) {
      imageWidget = Image.file(
        File(imageUrl!),
        fit: fit,
        width: width,
        height: height,
        color: color,
      );
    } else {
      if (isAssetImage) {
        imageWidget = Image.asset(
          Config.KEY_IMAGE_PATH + imageUrl!,
          fit: fit,
          width: width,
          height: height,
          color: color,
        );
      } else {
        String img = imageUrl ?? "";
        if (img.length < 5) {
          img =
              "https://picsum.photos/${Random().nextInt(400)}/${Random().nextInt(400)}/";
          // img = testImage;
        }
        // print("图片链接:$img");
        imageWidget = CachedNetworkImage(
          imageUrl: img,
          fit: fit,
          width: width,
          height: height,
          fadeInDuration: Duration.zero,
          fadeOutDuration: Duration.zero,
          placeholder: (context, url) => placeholder!.isNotEmpty
              ? Image.asset(
                  Config.KEY_IMAGE_PATH + placeholder!,
                  fit: fit,
                  width: width,
                  height: height,
                )
              : const SizedBox(),
          errorWidget: (context, url, error) =>
              errorWidget ??
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(color: Colors.blueGrey)),
        );
      }
    }

    if (padding != null) {
      imageWidget = Padding(padding: padding!, child: imageWidget);
    }

    if (radius > 0) {
      imageWidget = ClipRRect(
          borderRadius: BorderRadius.circular(radius), child: imageWidget);
    }
    if (isOval) {
      imageWidget = ClipOval(child: imageWidget);
    }
    if (child != null) {
      imageWidget = Stack(children: [imageWidget, child!]);
    }
    if (onTap != null || onDoubleTap != null || onLongPress != null) {
      imageWidget = InkWell(
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          highlightColor: Colors.transparent,
          radius: 0.0,
          child: imageWidget);
    }

    imageWidget = Container(
      margin: margin,
      decoration: BoxDecoration(
        border: hasBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
        borderRadius:
            BorderRadius.all(Radius.circular(isOval ? width! / 2 : radius)),
      ),
      child: imageWidget,
    );
    return imageWidget;
  }
}
