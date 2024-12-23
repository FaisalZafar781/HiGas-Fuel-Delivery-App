import 'package:flutter/material.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/delivery_completed_screen.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';

import '../../../services/utils/constants/constants.dart';

class DriverCodeMatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.35),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/check2.png",
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Text(
                    "Code Matched",
                    style: TextStyle(
                      fontSize: AppFontSizes.title1,
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  const Text(
                    "Please collect the payment & deliver fuel.",
                    style: TextStyle(
                      fontSize: AppFontSizes.body,
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      color: AppColors.description,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
                          'Make sure payment is collected before marking the delivery complete.',
                          style: TextStyle(
                              fontSize: AppFontSizes.body,
                              color: AppColors.black,
                              fontFamily: AppFontsFamily.spaceGrotesk),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        ActionButton(
                          text: "Collect \$61.25 & Mark Complete",
                          backgroundColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                          borderColor: AppColors.primaryColor,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CompletedScreen(
                                          title: "Delivery Completed",
                                          description:
                                              "We hope your experience went well with us. Please provide your feedback.",
                                          buttonText: "Rate your Customer",
                                        )));
                          },
                          borderRadius: 25,
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
