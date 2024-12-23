import 'package:flutter/material.dart';
import 'package:hi_gas/screens/AccountSettings/PasswordReset.dart';
import 'package:hi_gas/screens/AuthenticationScreen/ForgotPassword/reset_password_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';

class EnterCodeScreen extends StatelessWidget {
  const EnterCodeScreen({super.key});

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
                  'Please enter the code sent to your email',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomField(
                  controller: TextEditingController(),
                  hintText: 'Enter six digit code',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the code';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.001),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Didn\'t get a code?',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body1,
                          color: AppColors.black,
                        )),
                    SizedBox(width: screenWidth * 0.015),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: AppFontSizes.body1,
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
                      builder: (context) => const ResetPasswordScreen(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
