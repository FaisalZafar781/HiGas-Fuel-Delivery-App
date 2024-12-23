import 'package:flutter/material.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/driver_home_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/HomeScreen/home_screen.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';

import '../../../services/utils/constants/constants.dart';
import '../../../widgets/RoundedContainer/rounded_container.dart';
import '../../HomeScreensFlow/OrderAcceptedScreen/rate_rider_screen.dart';
import '../ManageSubscription/manage_subscription_screen.dart';

class CompletedScreen extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;

  // Constructor to accept parameters
  const CompletedScreen({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.screenColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.1, -0.5), // Gradient starts from top center
            radius: 1, // You can adjust the radius to control the spread
            colors: [
              Color(0xff031648), // Color at the center
              Color(0xff000a25), // Color at the outer edges
            ],
          ),
        ),
        child: Stack(children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomRoundedContainer(
                      backgroundColor: AppColors.grey.withOpacity(0.2),
                      radius: 100,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        iconSize: 28,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Image.asset("assets/images/check1.png",
                      height: 80, width: 80),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title, // Use the title parameter here
                        style: TextStyle(
                          fontSize: AppFontSizes.title1,
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        description, // Use the description parameter here
                        style: TextStyle(
                          fontSize: AppFontSizes.body,
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      ActionButton(
                        text: buttonText, // Use the buttonText parameter here
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        borderColor: AppColors.primaryColor,
                        onPressed: () {
                          if (title.contains("Rate your Customer")) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RatingScreen(title: "Rate Customer"),
                              ),
                            );
                          } else {
                            //ManageSubscriptionScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RatingScreen(
                                  title: "Rate Customer",
                                  isDriver: true,
                                ),
                              ),
                            );
                          }
                        },
                        borderRadius: 25,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          child: Text(
                            "Go back to home",
                            style: TextStyle(
                              fontSize: AppFontSizes.body,
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DriverHomeScreen(
                                  isDriver: true,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
