
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String url; // Corrected the class name and parameter name
  ImageView({
    required this.url,
  });
  @override
  State<ImageView> createState() => _ImageViewState(
    url: url,
  );
}

class _ImageViewState extends State<ImageView> {
  final String url; // Corrected the class name and parameter name
  _ImageViewState({
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
