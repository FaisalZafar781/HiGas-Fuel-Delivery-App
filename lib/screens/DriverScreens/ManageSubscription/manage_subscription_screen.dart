import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/delivery_completed_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import '../../../widgets/ToggleButton/ToggleButton.dart';

class ManageSubscriptionScreen extends StatefulWidget {
  ManageSubscriptionScreen({super.key});

  @override
  State<ManageSubscriptionScreen> createState() =>
      _ManageSubscriptionScreenState();
}

class _ManageSubscriptionScreenState extends State<ManageSubscriptionScreen> {
  final nameController = TextEditingController();

  final cardNumberController = TextEditingController();

  final monthController = TextEditingController();

  final yearController = TextEditingController();

  final cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  20,
                  MediaQuery.of(context).size.height * 0.05,
                  20,
                  20), // Adjust top padding based on screen height
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomRoundedContainer(
                        onTap: () => Navigator.pop(context),
                        radius: 100,
                        padding: EdgeInsets.all(10),
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    'To get full access please subscribe',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      color: Colors.black,
                      fontSize: 24, // Adjusted font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    'Thank you for trusting us to fuel your journey. Your choice fuels our mission to deliver excellence.',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      color: Colors.black,
                      fontSize: AppFontSizes.body, // Adjusted font size
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.035),

                  //monthly plan card
                  monthlyPlanCard("23.4", true, "12 Jan 2024"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    """Whats's included""",
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      color: AppColors.description,
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontSizes.body, // Adjusted font size
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            CupertinoIcons.checkmark_alt,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Quickly connect with customers near you.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                color: Colors.black,
                                fontSize: 16, // Adjusted font size
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      const Row(
                        children: [
                          Icon(
                            CupertinoIcons.checkmark_alt,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Create and manage proposals with ease.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                color: Colors.black,
                                fontSize: 16, // Adjusted font size
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      const Row(
                        children: [
                          Icon(
                            CupertinoIcons.checkmark_alt,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Get customer details.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              color: Colors.black,
                              fontSize: 16, // Adjusted font size
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Spacer(),

                  InkWell(
                      onTap: () {
                        leavingToEarlyBottomSheet(context);
                      },
                      child: Center(
                          child: Text(
                        "Cancel Membership",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontWeight: FontWeight.bold),
                      ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void leavingToEarlyBottomSheet(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/SadFace.png",
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  const Text(
                    'Leaving too early!! ',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Divider(),
                  SizedBox(height: screenHeight * 0.01),
                  const Text(
                    'Cancelling your subscription means you’ll lose access to all in app features.',
                    style: TextStyle(
                      color: AppColors.description,
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body1,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Divider(),
                  SizedBox(height: screenHeight * 0.01),
                  ActionButton(
                    text: "Go Back",
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    borderRadius: 25,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {},
                        child: Center(
                            child: Text(
                          "Cancel Membership",
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontWeight: FontWeight.bold),
                        ))),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  monthlyPlanCard(String price, isShowBestOption, String date) {
    return Stack(
      children: [
        Container(
          height: isShowBestOption == true
              ? MediaQuery.of(context).size.height * 0.135
              : MediaQuery.of(context).size.height * 0.135, // Adjusted height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage("assets/images/monthly_plan.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        isShowBestOption == true
            ? Positioned(
                top: 15,
                left: 10,
                child: CustomRoundedContainer(
                  backgroundColor: AppColors.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: const Text(
                    "Best Option",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.white,
                      fontFamily: AppFontsFamily.spaceGrotesk,
                    ),
                  ),
                ),
              )
            : SizedBox(),
        Positioned(
          top: isShowBestOption == true ? 55 : 35,
          left: 10,
          child: const Text(
            "Monthly Plan",
            style: TextStyle(
              fontSize: 16, // Adjusted font size
              color: Colors.white,
              fontFamily: AppFontsFamily.spaceGrotesk,
            ),
          ),
        ),
        Positioned(
          top: isShowBestOption == true ? 80 : 60,
          left: 10,
          child: Text(
            "\$${price}/Month",
            style: const TextStyle(
              fontSize: 16, // Adjusted font size
              color: Colors.white,
              fontFamily: AppFontsFamily.spaceGrotesk,
            ),
          ),
        ),
        Positioned(
          top: isShowBestOption == true ? 80 : 60,
          right: 10,
          child: Text(
            "Next Payment $date",
            style: TextStyle(
              fontSize: AppFontSizes.body1, // Adjusted font size
              color: AppColors.description,
              fontFamily: AppFontsFamily.spaceGrotesk,
            ),
          ),
        ),
      ],
    );
  }
}
