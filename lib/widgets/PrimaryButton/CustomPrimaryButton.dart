import 'package:flutter/material.dart';

import '../../services/utils/constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = width ?? MediaQuery.of(context).size.width * 0.8;
    final double buttonHeight = height ?? MediaQuery.of(context).size.height * 0.06;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          minimumSize: Size(buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style:  TextStyle(
                fontSize : MediaQuery.of(context).size.width * 0.0427,
fontFamily: AppFontsFamily.spaceGrotesk,
            fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
