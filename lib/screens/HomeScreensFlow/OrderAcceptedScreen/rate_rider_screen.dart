import 'package:flutter/material.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/driver_home_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/HomeScreen/home_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class RatingScreen extends StatelessWidget {
  String title;
  final bool? isDriver;
  RatingScreen({super.key, required this.title, this.isDriver});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            right: 16,
            child: CustomRoundedContainer(
              backgroundColor: AppColors.grey.withOpacity(0.15),
              radius: 100,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                iconSize: 28,
                color: AppColors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Your feedback value for us to make our app experience great',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _starIcon(),
                    _starIcon(),
                    _starIcon(),
                    _starIcon(),
                    _starIcon(),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: Text(
                    isDriver == false
                        ? 'That\'s great. What did you like?'
                        : '5/5',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ActionButton(
                      text: 'Submit Rating',
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => isDriver == true
                                    ? DriverHomeScreen(
                                        isDriver: isDriver ?? false)
                                    : HomeScreen()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon _starIcon() {
    return Icon(
      Icons.star_rounded,
      color: Colors.amber,
      size: 50,
    );
  }
}
