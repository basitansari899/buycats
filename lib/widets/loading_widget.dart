

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final int widgetLength;
  const LoadingWidget({Key? key, required this.widgetLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: List.generate(widgetLength, (i) {
        return Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                  width: 327,
                  height: 94,
       
                  decoration: const BoxDecoration(
                     color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  ),
          ),
        );
      }
  ),
    );
  }
}