import 'package:flutter/material.dart';

class DialogPrimaryButton extends StatelessWidget {
  final Function()? onSave;
  final String? buttonText;
  final double? width;
  final double? height;
  final double? fontSize;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final bool isFav;
  const DialogPrimaryButton({Key? key, this.onSave, this.buttonText, this.width, this.height, this.fontSize, this.padding, this.margin, this.color, this.isFav = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSave,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
          colors: isFav? [const Color.fromRGBO(224, 224, 224, 0), const Color(0xFFE0E0E0)]:[const Color(0xFFFFAB91), Color(0xFFFF6F43)],
          begin: const FractionalOffset(0.2,3.5),
          end: Alignment.topCenter,
          tileMode: TileMode.clamp,
        ), 
          borderRadius: BorderRadius.circular(10.0),

        ),
        alignment: Alignment.center,
        child: Text(
          buttonText ?? '',
          style: TextStyle(
              color: isFav ? Colors.black : Colors.white, fontSize: fontSize ?? 14, fontWeight: FontWeight.w500),
        ),
      ),

    );
  }
}
