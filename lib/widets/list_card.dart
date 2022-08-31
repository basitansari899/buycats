import 'package:buy_cats/constants/app_constants.dart';
import 'package:buy_cats/widets/button_widget.dart';
import 'package:flutter/material.dart';

class LTCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadius borderRadius;
  final void Function() onTap;
  final BoxConstraints? constraints;
  final bool hasBorder;
  final bool isFav;
  final String catName;
  final String catDescription;
  final String? catImageLink;

  const LTCard({
    Key? key,
    this.width,
    this.height,
    this.hasBorder = true,
    this.color = Colors.white,
    this.margin,
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(5.0)),
    required this.onTap,
    this.constraints,
    required this.catName,
    required this.catDescription,
    required this.isFav,
    this.catImageLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: 327,
      height: 94,
      padding: padding,
      constraints: constraints,
      decoration: BoxDecoration(
        color: color,
        border: hasBorder ? Border.all(color: Colors.grey.shade300) : null,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular((16)),
            child: SizedBox(
              height: 94,
              width: 94,
              child: catImageLink == null ? const SizedBox() : Image.network(
                catImageLink!,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Text('');
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0, left: 10.0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Text(
                    catName,
                    style: TextStyles.SUBHEAD_STYLE,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    catDescription,
                    style: TextStyles.SUBTEXT_STYLE,
                  ),
                  const SizedBox(height: 10),
                  DialogPrimaryButton(
                      width: 213,
                      height: 32,
                      onSave: onTap,
                      isFav: isFav,
                      buttonText: isFav ? ButtonLabel.REMOVE : ButtonLabel.ADD),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
