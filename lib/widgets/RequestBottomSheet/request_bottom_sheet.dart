import 'package:flutter/material.dart';

import '../../screens/DriverScreens/HomeScreens/submit_proposal_screen.dart';
import '../ActionButton/action_button.dart';
import '../RoundedContainer/rounded_container.dart';
import '../TimeLineWidget/CustomTimeLine.dart';

class RequestBottomSheet extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final String requestDetailsTitle;
  final String userName;
  final String quantityText;
  final String fuelBrandText;
  final String timeText;
  final String paymentText;
  final String terminalInfo;
  final String distanceInfo;
  final String stationInfo;
  final String submitButtonText;

  const RequestBottomSheet({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.requestDetailsTitle,
    required this.userName,
    required this.quantityText,
    required this.fuelBrandText,
    required this.timeText,
    required this.paymentText,
    required this.terminalInfo,
    required this.distanceInfo,
    required this.stationInfo,
    required this.submitButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: screenHeight * 0.49,
          width: screenWidth,
          padding: const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CustomRoundedContainer(
                  width: 50,
                  height: 7,
                  backgroundColor: Colors.grey,
                  radius: 10,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                requestDetailsTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const CircleAvatar(radius: 12),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, size: 20, color: Colors.amber),
                      const SizedBox(width: 5),
                      RichText(
                        text: TextSpan(
                          text: '4.5',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' (23 Orders)',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,
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
                userName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),
              SizedBox(height: screenHeight * 0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        quantityText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Fuel Brand',
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        fuelBrandText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Time',
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        timeText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Payment',
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        paymentText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),
              Row(
                children: [
                const SizedBox(
                    width: 40,
                    child: CustomTimeline(
                      useCustomStartEndIndicators: true,
                      itemCount: 2,
                      nodeColors: [Colors.green, Colors.red],
                      connectorColor: Colors.green,
                      nodeSize: 20,
                      spacing: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        terminalInfo,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        distanceInfo,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        stationInfo,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.005),
              ActionButton(
                borderRadius: 30,
                text: submitButtonText,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SubmitProposalScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
