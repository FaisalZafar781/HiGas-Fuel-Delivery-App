import 'package:flutter/material.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/driver_code_match_screen.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';

import '../../../services/utils/constants/constants.dart';

class DriverVerificationCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  // Progress Indicator (3 dots)
                  Image.asset(
                    "assets/images/WaitingDots.png",
                    height: 30,
                    width: 30,
                  ),
                  // Title
                  const Text(
                    "Share Verification Code",
                    style: TextStyle(
                      fontSize: AppFontSizes.title,
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  // Subtitle
                  const Text(
                    "Ask the customer to enter the verification code to confirm delivery.",
                    style: TextStyle(
                      fontSize: AppFontSizes.body,
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      color: AppColors.description,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Verification Code Container
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DriverCodeMatchScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                      decoration: BoxDecoration(
                        color: AppColors.textFiledColor,
                        borderRadius: BorderRadius.circular(15.0),
                        border:
                            Border.all(color: AppColors.containerBorderColor),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Verification Code",
                              style: TextStyle(
                                fontSize: AppFontSizes.body,
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                color: AppColors.description,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          const Text(
                            "898758",
                            style: TextStyle(
                              fontSize: AppFontSizes.title30,
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      ),
                    ),
                  ),
                  // Footer Text
                ],
              ),
            ),
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wait for the code to match before delivering the fuel and collecting payment.',
                          style: TextStyle(
                              fontSize: AppFontSizes.body,
                              color: AppColors.black,
                              fontFamily: AppFontsFamily.spaceGrotesk),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
