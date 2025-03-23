import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';

class ImageCached extends StatefulWidget {
  const ImageCached({super.key, this.url, this.width, this.height, this.radius});

  final String? url;
  final double? width;
  final double? height;
  final double? radius;

  @override
  State<ImageCached> createState() => _ImageCachedState();
}

class _ImageCachedState extends State<ImageCached> {
  @override
  Widget build(BuildContext context) {
    var url = widget.url;

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius ?? 1000),
      child: CachedNetworkImage(
        imageUrl:
            url ??
            'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/65761296352685.5eac4787a4720.jpg',
        width: widget.width ?? 50,
        height: widget.height ?? 50,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
        placeholder: (_, _) {
          return Container(color: context.colorScheme.tertiaryContainer);
        },
        errorWidget: (context, error, stackTrace) {
          return Container(
            color: context.colorScheme.tertiaryContainer,
            alignment: Alignment.center,
            width: widget.width != null ? widget.width! : 50,
            height: widget.height != null ? widget.height! : 50,
            child: Icon(
              Icons.image,
              size: widget.width != null ? (widget.width! * 0.6) : 50,
            ),
          );
        },
      ),
    );
  }
}
