import 'package:flutter/material.dart';
import 'package:hi_gas/screens/HomeScreensFlow/OrderAcceptedScreen/order_accepted_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class UserCard extends StatelessWidget {
  final GestureTapCallback? onTap;
  final int count;
  const UserCard({
    super.key,
    required this.onTap,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(), // Prevents scrolling
      shrinkWrap: true, // Prevents the list from taking up extra space
      itemCount: count, // Replace with actual driver count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: GestureDetector(
            onTap: onTap,
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
                            Icons.star_rounded,
                            size: 20,
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
                    color: AppColors.grey.withOpacity(0.5),
                    thickness: 1,
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Quantity',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.small,
                              color: AppColors.textFiledHint,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            '1 Tank',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Text(
                        ' | ',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body,
                          color: AppColors.textFiledHint,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Fuel Brand',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.small,
                              color: AppColors.textFiledHint,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            'Congas',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Text(
                        ' | ',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body,
                          color: AppColors.textFiledHint,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Time',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.small,
                              color: AppColors.textFiledHint,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            '30 min',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Text(
                        ' | ',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body,
                          color: AppColors.textFiledHint,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Payment',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.small,
                              color: AppColors.textFiledHint,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            'Cash',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Divider(
                    color: AppColors.grey.withOpacity(0.5),
                    thickness: 1,
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    children: [
                      Text(
                        'Total Cost',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body,
                          fontWeight: FontWeight.bold,
                          color: AppColors.IconColors,
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
                  SizedBox(height: screenHeight * 0.01),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
