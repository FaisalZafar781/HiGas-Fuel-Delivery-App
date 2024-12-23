
import 'package:flutter/material.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 30),
            child: CustomRoundedContainer(
              backgroundColor: AppColors.textFiledColor,
              padding: EdgeInsets.only(
                top: screenHeight * 0.02,
                left: 15,
                right: 15,
                // bottom: screenHeight * 0.02,
              ),
              width: screenWidth * 0.83, // container width
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Iconsax.location,
                    size: 20,
                    color: AppColors.IconColors,
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Schenefeld Berlin Central Station',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            color: AppColors.black,
                            fontSize: AppFontSizes.body,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Meli-Beese-Rirg',
                          style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              color: AppColors.black,
                              fontSize: AppFontSizes.body1,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Repeat Request',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body1,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
