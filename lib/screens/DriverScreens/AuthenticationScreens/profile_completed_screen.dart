import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hi_gas/screens/AuthenticationScreen/LoginScreen/login_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/HomeScreen/home_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfileCompletedScreen extends StatefulWidget {
  final bool isDriver;
  const ProfileCompletedScreen({
    super.key,
    required this.isDriver,
  });

  @override
  State<ProfileCompletedScreen> createState() => _ProfileCompletedScreenState();
}

class _ProfileCompletedScreenState extends State<ProfileCompletedScreen> {
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
                child: Image.asset("assets/images/check1.png",
                    height: 80, width: 80),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Driver profile is created',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Start bidding process today to earn handsome amount of money. Best of luck',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  ActionButton(
                      text: 'Continue',
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      onPressed: () {
                        // Navigate to RateRiderScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(
                              isDriver: widget.isDriver,
                            ),
                          ),
                        );
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}