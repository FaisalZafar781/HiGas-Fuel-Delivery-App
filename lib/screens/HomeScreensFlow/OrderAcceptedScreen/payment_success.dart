import 'package:flutter/material.dart';
import 'package:hi_gas/screens/HomeScreensFlow/OrderAcceptedScreen/rate_rider_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center:
                const Alignment(0.1, -0.5), // Gradient starts from top center
            radius: 2, // Adjust the radius to control the spread
            colors: const [
              Color(0xff031648), // Color at the center
              Color(0xff000a25), // Color at the outer edges
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                child: CustomRoundedContainer(
                  backgroundColor: AppColors.white.withOpacity(0.15),
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
              Align(
                alignment: Alignment.center,
                child: CustomRoundedContainer(
                  radius: 100,
                  padding: const EdgeInsets.all(12),
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 70,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Payment Success',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'We hope your experience went well with us. Please provide your feedback.',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  ActionButton(
                      text: 'Rate your rider',
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      onPressed: () {
                        // Navigate to RateRiderScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  RatingScreen(title: "Rate your experience with Rider"),
                          ),
                        );
                      }),
                  SizedBox(height: screenHeight * 0.01),
                  ActionButton(
                      text: 'Go back to home',
                      backgroundColor: Colors.transparent,
                      textColor: AppColors.white,
                      borderColor: Colors.transparent,
                      onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
