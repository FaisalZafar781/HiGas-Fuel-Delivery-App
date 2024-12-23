import 'package:flutter/material.dart';
import 'package:hi_gas/screens/AuthenticationScreen/ForgotPassword/forgot_password.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/driver_home_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/HomeScreen/home_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatefulWidget {
  final bool? isDriver;
  const LoginScreen({Key? key, this.isDriver}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
                  'Welcome back, add credentials',
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
                SizedBox(height: screenHeight * 0.02),
                CustomField(
                  controller: TextEditingController(),
                  hintText: 'Enter Password',
                  obscureText: _obscureText,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: AppFontSizes.body,
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
                      builder: (context) => widget.isDriver == true
                          ? DriverHomeScreen(
                              isDriver: widget.isDriver ?? false,
                            )
                          : HomeScreen(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
