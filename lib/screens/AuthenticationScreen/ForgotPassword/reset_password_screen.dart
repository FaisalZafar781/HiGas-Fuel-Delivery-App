import 'package:flutter/material.dart';
import 'package:hi_gas/screens/AuthenticationScreen/ForgotPassword/forgot_password.dart';
import 'package:hi_gas/screens/AuthenticationScreen/LoginScreen/login_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                  'Reset Password',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomField(
                  controller: TextEditingController(),
                  hintText: 'Choose a strong Password',
                  obscureText: true,
                  suffixIcon: Icon(Iconsax.eye_copy),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomField(
                  controller: TextEditingController(),
                  hintText: 'Re-enter Password',
                  obscureText: true,
                  suffixIcon: Icon(Iconsax.eye_copy),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: screenHeight * 0.005),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Password must be 8 character long.',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body1,
                      color: AppColors.black,
                    )),
                Text('Please use alpha numeric characters.',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body1,
                      color: AppColors.black,
                    )),
                SizedBox(height: screenHeight * 0.02),
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
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
