import 'package:flutter/material.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';

import '../../../services/utils/constants/constants.dart';
import '../../VerificationScreens/verification_page_builder.dart';
import '../DriverProfessionalPageBuilder/driver_professional_page_builder_screen.dart';

class DriverProfessionalDetailScreen extends StatelessWidget {
  const DriverProfessionalDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = mediaWidth < 600;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRoundedContainer(
                        onTap: () => Navigator.pop(context),
                        radius: 100,
                        padding: EdgeInsets.all(8),
                        backgroundColor: AppColors.containerBorderColor,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Title
                      Text(
                        "Professional Details",
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.title,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Subtitle
                      const Text(
                        "Please add your professional details to register as a driver.",
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body1,
                          color: AppColors.description,
                        ),
                      ),
                      const SizedBox(height: 24),

                      buildDetailItem(context, "Single Taxpayer Registry (RUC)",
                          "123456789", isSmallScreen),
                      buildDetailItem(context, "Identification Card",
                          "123456789", isSmallScreen),
                      buildImageDetailItem(
                          context, "Driver’s License", "Front", isSmallScreen),
                      buildImageDetailItem(
                          context, "Driver’s License", "Back", isSmallScreen),
                      Divider(
                        color: AppColors.grey.withOpacity(0.5),
                        thickness: 0.5,
                      ),
                      SizedBox(height: 10),
                      buildImageDetailItem(
                          context, "Car Registration", "Front", isSmallScreen),
                      buildImageDetailItem(
                          context, "Car Registration", "Back", isSmallScreen),
                      Divider(
                        color: AppColors.grey.withOpacity(0.5),
                        thickness: 0.5,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ActionButton(
                        text: "Update Details",
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        borderColor: AppColors.primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriverProfessionalPageBuilderScreen(
                              ),
                            ),
                          );
                        },
                        borderRadius: 25,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Text Detail Item
  Widget buildDetailItem(
      BuildContext context, String title, String value, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: AppFontsFamily.spaceGrotesk,
            fontSize: AppFontSizes.body1,
            color: AppColors.slate400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontFamily: AppFontsFamily.spaceGrotesk,
            fontSize: AppFontSizes.subtitle1,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Image Detail Item
  Widget buildImageDetailItem(
      BuildContext context, String title, String subtitle, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body1,
                    fontWeight: FontWeight.bold,
                    color: AppColors.slate400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.subtitle1,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            Container(
              width: isSmallScreen ? 100 : 120,
              height: isSmallScreen ? 70 : 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.containerGrey,
              ),
              child: Icon(
                Icons.image,
                size: isSmallScreen ? 40 : 50,
                color: AppColors.slate800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
