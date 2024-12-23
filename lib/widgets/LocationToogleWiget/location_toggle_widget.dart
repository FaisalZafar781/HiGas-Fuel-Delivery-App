import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/LocationProvider.dart';
import '../../services/utils/constants/constants.dart';
import '../RoundedContainer/rounded_container.dart';

class LocationToggleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<LocationProvider>(
      builder: (context, value,child) {
        return Positioned(
          bottom: screenHeight * 0.09,
          right: value.isLocationEnabled ? 16 : screenWidth * 0.35,
          child: Align(
            alignment: Alignment.centerRight,
            child: Consumer<LocationProvider>(
              builder: (context, locationProvider, child) {
                return InkWell(
                  onTap: () => locationProvider.toggleLocation(context),
                  child: CustomRoundedContainer(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: locationProvider.isLocationEnabled
                        ? AppColors.green
                        : AppColors.slate800,
                    radius: 100,
                    child: locationProvider.isLocationEnabled
                        ? Icon(
                      Icons.power_settings_new_outlined,
                      color: AppColors.white,
                    )
                        : Row(
                      children: [
                        Icon(
                          Icons.power_settings_new_outlined,
                          color: AppColors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Go Online',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            color: AppColors.white,
                            fontSize: AppFontSizes.subtitle1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }
}
