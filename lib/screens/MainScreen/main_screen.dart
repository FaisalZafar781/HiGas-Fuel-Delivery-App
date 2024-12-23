import 'package:flutter/material.dart';
import 'package:hi_gas/providers/LanguageProvider.dart';
import 'package:hi_gas/screens/AuthenticationScreen/LoginScreen/login_screen.dart';
import 'package:hi_gas/screens/VerificationScreens/verification_page_builder.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import '../../services/utils/constants/constants.dart';
import '../../widgets/ToggleButton/ToggleButton.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final bool isDriver;
  const MainScreen({super.key, required this.isDriver});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.mainScreenBg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.01),
              Consumer<LanguageProvider>(
                builder: (context, provider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // English Text
                      Text(
                        'English',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body1,
                          color: provider.isGerman
                              ? AppColors.greyText
                              : AppColors.white,
                          fontWeight: provider.isGerman
                              ? FontWeight.w500
                              : FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' / ',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // Germany Text
                      Text(
                        'Germany',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body1,
                          color: provider.isGerman
                              ? AppColors.white
                              : AppColors.greyText,
                          fontWeight: provider.isGerman
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      CustomToggleButton(
                        value: provider.isGerman,
                        onChanged: (bool value) {
                          provider.toggleLanguage();
                        },
                      ),
                    ],
                  );
                },
              ),
              Image.asset(
                "assets/images/main_logo.png",
                height: size.height * 0.3,
                width: size.width * 0.6,
              ),
              Text(
                "Hi GAS",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize:
                        size.width * 0.08, // Font size relative to screen width
                    color: AppColors.white,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Fuel Delivery Made Easy – Fast, Reliable, and Hassle-Free Refueling at Your Doorstep",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppFontsFamily.spaceGrotesk,
                  fontSize:
                      size.width * 0.045, // Font size relative to screen width
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: size.height * 0.03, // Spacing relative to screen height
              ),
              ActionButton(
                text: "Sign up",
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.white,
                borderColor: AppColors.primaryColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationPageBuilder(
                          isDriver: widget.isDriver,
                        ),
                      ));
                },
                borderRadius:
                    size.width * 0.06, // Border radius relative to screen width
              ),
              SizedBox(
                height: size.height * 0.02, // Spacing relative to screen height
              ),
              ActionButton(
                text: "Login",
                backgroundColor: AppColors.mainScreenBg,
                textColor: AppColors.white,
                borderColor: AppColors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(
                          isDriver: widget.isDriver,
                        ),
                      ));
                },
                borderRadius: size.width * 0.06,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: size.height *
                        0.001, // Thickness relative to screen height
                    height: size.height * 0.001,
                    color: Colors.grey,
                  )),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Text(
                      "Or",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width *
                            0.045, // Font size relative to screen width
                      ),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: size.height * 0.001,
                    height: size.height * 0.001,
                    color: Colors.grey,
                  )),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              ActionButton(
                text: "Continue with Google",
                backgroundColor: AppColors.lighyGreyColor1.withOpacity(0.3),
                textColor: AppColors.white,
                borderColor: AppColors.lighyGreyColor1.withOpacity(0.3),
                onPressed: () {},
                borderRadius: size.width * 0.06,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationPageBuilder(
                            isDriver: widget.isDriver,
                          ),
                        ));
                  },
                  child: Text(
                    "Continue as Guest",
                    style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        fontSize: size.width * 0.045,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w900),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
