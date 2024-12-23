import 'package:flutter/material.dart';
import 'package:hi_gas/widgets/PrimaryButton/CustomPrimaryButton.dart';
import '../../services/utils/constants/constants.dart';
import '../../widgets/TimeLineWidget/CustomTimeLine.dart';

class OrderDetails extends StatelessWidget {
  final bool isDriver;
  const OrderDetails({Key? key, required this.isDriver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order ID and Status Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order ID: 2342',
                    style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        fontSize: AppFontSizes.title,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  isDriver == true
                      ? Container()
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Completed',
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: 14,
                            ),
                          ),
                        ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                '24 Nov, 2024',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: AppFontsFamily.spaceGrotesk,
                ),
              ),
              const SizedBox(height: 16),
              // Rider Details Section
              Text(
                isDriver == true ? 'Customer Details' : 'Rider Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSizes.subtitle1,
                  fontFamily: AppFontsFamily.spaceGrotesk,
                ),
              ),
              isDriver == true ? SizedBox(height: 0) : SizedBox(height: 8),
              isDriver == true
                  ? Container()
                  : Text(
                      'Car Reg. No: AED-234',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: AppFontsFamily.spaceGrotesk,
                      ),
                    ),
              const SizedBox(height: 12),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.145,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                        ),
                        Spacer(),
                        Text(
                          isDriver == true
                              ? "Rate Customer"
                              : 'Rate your experience',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontSizes.body,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.black,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$61.00',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontWeight: FontWeight.w900,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "1 Tank  |  Congas  |  30 minutes",
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontWeight: FontWeight.bold,
                              fontSize: AppFontSizes.small,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Price Section
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: Colors.grey),
              const SizedBox(height: 16),
              // Journey Details Section
              const Text(
                'Journey Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: AppFontsFamily.spaceGrotesk,
                ),
              ),
              const SizedBox(height: 12),
              isDriver == true
                  ? Container(
                      child: Row(
                        children: [
                          Container(
                            width: 40, // Ensure this matches your timeline size
                            child: CustomTimeline(
                              useCustomStartEndIndicators: true,
                              itemCount: 2,
                              nodeColors: [
                                AppColors.redContainer,
                                AppColors.primaryColor
                              ],
                              connectorColor: AppColors.primaryColor,
                              nodeSize: 20,
                              spacing: 50,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.8,
                                child: Text(
                                  "Terminal I Berlin Brandenburg Airport Melli-Beeese ",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "7.5 KM ≈",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Schoenfeld Berlin Central Station",
                                style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CustomTimeline Widget
                        SizedBox(
                          width: 40,
                          child: CustomTimeline(
                            itemCount: 2,
                            nodeColors: [
                              AppColors.primaryColor,
                              AppColors.redContainer
                            ],
                            connectorColor: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(
                            width: 8), // Space between CustomTimeline and text
                        // Column for Journey Text
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        'Terminal 1 Berlin Brandenburg Airport Melli-Bee...',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontFamily:
                                              AppFontsFamily.spaceGrotesk,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      'Schönefeld Berlin Central Station',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontFamily: AppFontsFamily.spaceGrotesk,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              const Spacer(),
              // Bottom Section

              isDriver == true
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your address will be reused, if you want to repeat the same request.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: AppFontsFamily.spaceGrotesk,
                          ),
                        ),
                        const SizedBox(height: 16),
                        PrimaryButton(text: 'Repeat Request', onPressed: () {})
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
