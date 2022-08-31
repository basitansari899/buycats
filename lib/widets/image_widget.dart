

import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageLink;
  const ImageWidget({Key? key, required this.imageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                borderRadius: BorderRadius.circular((16)),
                child: SizedBox(
                  height: 76,
                  width: 77,
                  child: imageLink.isEmpty ? const SizedBox() : Image.network(
                    imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
              );
  }
}