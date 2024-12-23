import 'package:flutter/material.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../services/utils/constants/constants.dart';
import '../RoundedContainer/rounded_container.dart';

class FuelDeliveryTimer extends StatelessWidget {
  final String deliverMessage;
  final String cancelRideText;
  final String timerText;
  final String amountMessage;
  final String costBreakdownText;
  final String amountText;

  const FuelDeliveryTimer({
    Key? key,
    required this.deliverMessage,
    required this.cancelRideText,
    required this.timerText,
    required this.amountMessage,
    required this.costBreakdownText,
    required this.amountText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.bottomLeft,
      child: CustomRoundedContainer(
        // padding: const EdgeInsets.all(12),
        backgroundColor: AppColors.white,
        radius: 15,
        width: screenWidth,
        onTap: () async {},
        child: Column(
          children: [
            CustomRoundedContainer(
              padding: const EdgeInsets.all(12),
              backgroundColor: AppColors.slate900,
              radius: 15,
              width: screenWidth,
              onTap: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deliverMessage,
                        style: TextStyle(
                          fontSize: AppFontSizes.body,
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      InkWell(
                        onTap: () {
                          // Implement cancel ride functionality
                          _driverCancelRequest(context);
                        },
                        child: Text(
                          cancelRideText,
                          style: TextStyle(
                            fontSize: AppFontSizes.body1,
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            color: Colors.white30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    timerText,
                    style: TextStyle(
                      fontSize: AppFontSizes.title1,
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        amountMessage,
                        style: TextStyle(
                          fontSize: AppFontSizes.subtitle1,
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        amountText,
                        style: TextStyle(
                          fontSize: AppFontSizes.subtitle1,
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        costBreakdownText,
                        style: TextStyle(
                            fontSize: AppFontSizes.body1,
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            color: AppColors.description),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _driverCancelRequest(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Container(
            height: screenHeight * 0.53,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Iconsax.danger,
                    color: Colors.red,
                    size: 50,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Cancel Request?',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Divider(
                    color: AppColors.grey,
                    thickness: 0.5,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'You will be charged penalty fees for this cancellation.\n\nFrequent cancellations may affect your ability to receive high-priority requests.\nPlease review your availability before accepting requests',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  ActionButton(
                    buttonWidth: screenWidth,
                    borderRadius: 30,
                    text: 'Continue Ride',
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.white,
                    borderColor: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  ActionButton(
                    buttonWidth: screenWidth,
                    borderRadius: 30,
                    text: 'Cancel Order',
                    backgroundColor: AppColors.white,
                    textColor: AppColors.RedColor,
                    borderColor: AppColors.RedColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
