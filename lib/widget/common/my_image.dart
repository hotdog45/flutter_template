// import 'package:cached_network_image/cached_network_image.dart';
import 'package:duo_hao/config/config.dart';
import 'package:flutter/material.dart';

String testImage = "https://feige-dev.oss-cn-hangzhou.aliyuncs.com/static/avatar/th_default.png";
String hostImage = "https://feige-dev.oss-cn-hangzhou.aliyuncs.com/static/avatar/";


/// 网络图片加载
class MyImage extends StatelessWidget {
  final String imageUrl;
  final String placeholder;
  final BoxFit fit;

  final Widget child;
  final Color borderColor;

  final bool isAssetImage;
  final bool isOval;
  final bool hasBorder;

  final double borderWidth;
  final double radius;
  final double height;
  final double width;

  final progressIndicatorBuilder;
  final errorWidget;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  final GestureTapCallback onTap;
  final GestureTapCallback onLongPress;
  final GestureTapCallback onDoubleTap;

  const MyImage(this.imageUrl,
      {Key key,
      this.placeholder,
      this.child,
      this.fit = BoxFit.fill,
      this.width,
      this.isAssetImage = false,
      this.isOval = false,
      this.hasBorder = false,
      this.borderColor = Colors.transparent,
      this.borderWidth = 0.5,
      this.radius = 0,
      this.height,
      this.onTap,
      this.onLongPress,
      this.onDoubleTap,
      this.padding,
      this.margin,
      this.progressIndicatorBuilder,
      this.errorWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 占位图
    Widget placeholderWidget = Container();
    Widget imageWidget;

    if (placeholder != null && placeholder.isNotEmpty) {
      placeholderWidget = Image.asset(
        placeholder,
        fit: fit,
        width: width,
        height: height,
      );
    }
    if (isAssetImage) {
      imageWidget = Image.asset(
        Config.KEY_IMAGE_PATH + imageUrl,
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      // imageWidget = CachedNetworkImage(
      //   imageUrl: imageUrl.isNotEmpty ? imageUrl : testImage,
      //   placeholder: (context, url) => placeholderWidget,
      //   fit: fit,
      //   width: width,
      //   height: height,
      //
      //   // progressIndicatorBuilder: (context, url, downloadProgress) =>
      //   //     progressIndicatorBuilder ??
      //   //     CircularProgressIndicator(value: downloadProgress.progress),
      //   errorWidget: (context, url, error) => errorWidget ?? Icon(Icons.error),
      // );

      String img = imageUrl;
      if (img == null || img.length <5){
        img = testImage;
      }else{
        if (!imageUrl.startsWith("http") && !imageUrl.startsWith("https://")){
          img = hostImage + img;
        }
      }


      imageWidget = Image.network(
        img ?? testImage,
        fit: fit,
        width: width,
        height: height,
      );
    }

    if (padding != null) {
      imageWidget = Padding(padding: padding, child: imageWidget);
    }

    if (radius > 0) {
      imageWidget = ClipRRect(
          borderRadius: BorderRadius.circular(radius), child: imageWidget);
    }
    if (isOval) {
      imageWidget = ClipOval(child: imageWidget);
    }
    if (child != null) {
      imageWidget = Stack(children: [imageWidget, child]);
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
      child: imageWidget,
      decoration: BoxDecoration(
        border: hasBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
        borderRadius: BorderRadius.all(Radius.circular(isOval ? width/2: radius)),
      ),
    );
    return imageWidget;
  }
}
