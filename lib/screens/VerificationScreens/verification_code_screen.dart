import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_gas/screens/DriverScreens/AuthenticationScreens/new_email_address_screen.dart';
import 'package:hi_gas/screens/SetupProfile/profile_setup_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';

import '../../widgets/ActionButton/action_button.dart';
import '../../widgets/CustomTextField/custom_textfield.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({
    super.key,
  });

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  TextEditingController codeController = TextEditingController();
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
                "Almost Done!",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    color: AppColors.text,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                " Check your inbox for the verification email sent to youremail@gmail.com",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body1,
                    color: AppColors.description,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomField(
                keyboardType: TextInputType.number,
                hintText: "6 Digit Code",
                controller: codeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "6 Digit Code is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  const Text(
                    "Didnt get a code?     ",
                    style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        fontSize: AppFontSizes.small,
                        color: AppColors.description,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Resend",
                    style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        fontSize: AppFontSizes.body1,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          // const SizedBox(
          //   height: 400,
          // ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewEmailAddressScreen(),
                  ),
                );
              },
              child: Text(
                "Send to a different email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body1,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
