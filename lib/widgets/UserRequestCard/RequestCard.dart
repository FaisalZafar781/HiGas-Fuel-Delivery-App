import 'package:flutter/material.dart';
import 'package:hi_gas/screens/OrderHistory/RequestHistoryScreen.dart';

import '../../screens/OrderHistory/OrderDetailsScreen.dart';
import '../../services/utils/constants/constants.dart';

class UserRequestCard extends StatelessWidget {
  final String userName;
  final String rating;
  final bool rated; // Indicates if the user has rated
  final String price;
  final String details;

  const UserRequestCard({
    super.key,
    required this.userName,
    required this.rating,
    required this.rated,
    required this.price,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery for responsive height and width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetails(
              isDriver: true,
            ),
          ),
        );
      },
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.145,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFD7DCF1)), // Border color
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage:
                      AssetImage('assets/images/avatar_placeholder.png'),
                ),
                Spacer(),
                rated
                    ? Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xffF9CA10),
                            size: 16,
                          ),
                          // const SizedBox(width: 4),
                          Text(
                            "$rating (Rated)",
                            style: const TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body,
                              color: AppColors.description,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        "Rate Customer",
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
                        userName,
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSizes.body,
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Text(
                        price,
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
                    details,
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
    );
  }
}
