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
            'https://static.vecteezy.com/system/resources/previews/003/715/527/non_2x/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-vector.jpg',
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
