import 'package:flutter/material.dart';

import '../../services/utils/constants/constants.dart';
import '../ActionButton/action_button.dart';
import '../TimeLineWidget/CustomTimeLine.dart';

class DestinationBottomSheet extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final String driveToDestinationText;
  final String userName;
  final String startPointText;
  final String endPointText;
  final String instructionText;
  final String buttonText;
  final VoidCallback onMarkArrived;

  const DestinationBottomSheet({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.driveToDestinationText,
    required this.userName,
    required this.startPointText,
    required this.endPointText,
    required this.instructionText,
    required this.buttonText,
    required this.onMarkArrived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: screenHeight * 0.35,
          width: screenWidth,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          driveToDestinationText,
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            color: AppColors.black,
                            fontSize: AppFontSizes.subtitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              userName,
                              style: const TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.small,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      children: [
                        SizedBox(
                          width: 40, // Ensure this matches your timeline size
                          child: CustomTimeline(
                            useCustomStartEndIndicators: true,
                            itemCount: 2,
                            nodeColors: [
                              AppColors.primaryColor,
                              AppColors.redContainer,
                            ],
                            connectorColor: AppColors.primaryColor,
                            nodeSize: 20,
                            spacing: 50,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              startPointText,
                              style: const TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 35),
                            Text(
                              endPointText,
                              style: const TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.005),
                  Divider(
                    color: AppColors.grey.withOpacity(0.5),
                    thickness: 0.5,
                  ),
                  SizedBox(height: screenHeight * 0.004),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          instructionText,
                          style: const TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.small,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        ActionButton(
                          borderRadius: 30,
                          text: buttonText,
                          backgroundColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                          borderColor: Colors.transparent,
                          onPressed: onMarkArrived,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
