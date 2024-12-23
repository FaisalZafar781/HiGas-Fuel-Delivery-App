import 'package:flutter/material.dart';
import 'package:hi_gas/screens/AuthenticationScreen/ForgotPassword/enter_code_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRoundedContainer(
                  radius: 100,
                  padding: EdgeInsets.all(8),
                  backgroundColor: AppColors.containerBorderColor,
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomField(
                  controller: TextEditingController(),
                  hintText: 'Email address',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  'We will send a confirmation code here.',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body1,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            ActionButton(
                text: 'Continue',
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.white,
                borderColor: Colors.transparent,
                borderRadius: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EnterCodeScreen(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
