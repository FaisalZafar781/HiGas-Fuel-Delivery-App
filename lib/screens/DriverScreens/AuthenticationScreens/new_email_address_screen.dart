import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_gas/screens/VerificationScreens/verification_code_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';

class NewEmailAddressScreen extends StatelessWidget {
  const NewEmailAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailAddressController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 70, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRoundedContainer(
                  backgroundColor: AppColors.containerGrey.withOpacity(0.15),
                  radius: 100,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 28,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Enter a new Email Address",
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
                const SizedBox(
                  height: 15,
                ),
                ActionButton(
                    text: "Continue",
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.white,
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
