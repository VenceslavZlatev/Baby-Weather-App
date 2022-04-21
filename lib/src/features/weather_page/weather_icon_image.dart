import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherIconImage extends StatelessWidget {
  const WeatherIconImage({Key? key, required this.iconUrl, required this.size})
      : super(key: key);
  final String iconUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconUrl,
      height: size,
    );
  }
}

// Image.asset(
//       iconUrl,
//       height: size,
//     );

// CachedNetworkImage(
//       imageUrl: iconUrl,
//       width: size,
//       height: size,
//     );