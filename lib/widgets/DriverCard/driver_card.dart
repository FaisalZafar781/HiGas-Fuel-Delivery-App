import 'package:flutter/material.dart';
import 'package:hi_gas/screens/HomeScreensFlow/OrderAcceptedScreen/order_accepted_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true, // Prevents the list from taking up extra space
        itemCount: 10, // Replace with actual driver count
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CustomRoundedContainer(
              borderColor: AppColors.containerBorderColor,
              showBorder: true,
              backgroundColor: AppColors.driverTile,
              padding: const EdgeInsets.all(15),
              radius: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Iconsax.star_1,
                            size: 16,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 5),
                          RichText(
                            text: TextSpan(
                              text: '4.5',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body1,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: ' (23 Orders)',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: AppFontSizes.body1,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textFiledHint,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      // fontFamily: AppFontsFamily.spaceGroteskBold,
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.subtitle1,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Divider(
                    color: AppColors.grey,
                    thickness: 1,
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    children: [
                      Text(
                        'Total Cost',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body1,
                          color: AppColors.textFiledHint,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '\$12.80',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Ensures buttons are spaced evenly
                    children: [
                      Expanded(
                        child: ActionButton(
                          text: 'Ignore',
                          backgroundColor: AppColors.white,
                          textColor: AppColors.textFiledHint,
                          borderColor: AppColors.grey.withOpacity(0.7),
                          borderRadius: 25,
                          buttonHeight: screenHeight * 0.05,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                          width: screenWidth * 0.02), // Space between buttons
                      Expanded(
                        child: ActionButton(
                          text: 'Order Now',
                          backgroundColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                          borderColor: Colors.transparent,
                          borderRadius: 25,
                          buttonHeight: screenHeight * 0.05,
                          onPressed: () {
                            // Navigate to OrderAcceptedScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OrderAcceptedScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
