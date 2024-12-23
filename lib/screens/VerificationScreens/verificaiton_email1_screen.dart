import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_gas/screens/VerificationScreens/verification_code_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';

import '../../widgets/ActionButton/action_button.dart';
import '../../widgets/CustomTextField/custom_textfield.dart';

class VerificaitonEmail1Screen extends StatefulWidget {
  const VerificaitonEmail1Screen({
    super.key,
  });

  @override
  State<VerificaitonEmail1Screen> createState() =>
      _VerificaitonEmail1ScreenState();
}

class _VerificaitonEmail1ScreenState extends State<VerificaitonEmail1Screen> {
  TextEditingController emailAddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
        top: 20,
        bottom: 90,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What is your email address?",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    color: AppColors.text,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                keyboardType: TextInputType.text,
                hintText: "Email Address",
                controller: emailAddressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 13,
              ),
              const Text(
                "We will send a confirmation code here.",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body1,
                    color: AppColors.description,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.52,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "By selecting “Continue” you agree to the Terms of Service & Privacy Policy.",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.small,
                    color: AppColors.description,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
