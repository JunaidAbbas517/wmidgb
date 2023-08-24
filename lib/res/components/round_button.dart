import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final double radius;
  final FontWeight fontWeight;
  final double fontSize;
  final VoidCallback onPress;
  final Color color, textColor;
  final bool isLoading;
  const ReusableButton({
    Key? key,
    required this.title,
    required this.onPress,
    required this.color,
    required this.textColor,
    required this.width,
    required this.height,
    required this.radius,
    required this.fontWeight,
    required this.fontSize,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: GoogleFonts.mulish(
                    fontWeight: fontWeight,
                    fontSize: fontSize,
                    color: textColor,
                  ),
                ),
              ),
      ),
    );
  }
}
