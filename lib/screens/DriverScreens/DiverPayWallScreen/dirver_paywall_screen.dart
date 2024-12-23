import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/delivery_completed_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import '../../../widgets/ToggleButton/ToggleButton.dart';

class DriverPaywallScreen extends StatefulWidget {
  DriverPaywallScreen({super.key});

  @override
  State<DriverPaywallScreen> createState() => _DirverPaywallScreenState();
}

class _DirverPaywallScreenState extends State<DriverPaywallScreen> {
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
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.1, -0.5),
            radius: 1,
            colors: [
              Color(0xff031648),
              Color(0xff000a25),
            ],
          ),
        ),
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
                      color: Colors.white,
                      fontSize: 24, // Adjusted font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    'Choose Your Plan',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      color: Colors.white,
                      fontSize: 18, // Adjusted font size
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(CupertinoIcons.checkmark_alt,
                              color: Colors.white),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Quickly connect with customers near you.',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                color: Colors.white,
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
                          Icon(CupertinoIcons.checkmark_alt,
                              color: Colors.white),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Create and manage proposals with ease.',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                color: Colors.white,
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
                          Icon(CupertinoIcons.checkmark_alt,
                              color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Get customer details.',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              color: Colors.white,
                              fontSize: 16, // Adjusted font size
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.035),

                  //monthly plan card
                  monthlyPlanCard("23.4", true),

                  const Spacer(),

                  ActionButton(
                    borderRadius: 25,
                    text: 'Subscribe Now',
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.white,
                    borderColor: Colors.transparent,
                    onPressed: () {
                      _openPaymentDrawer(context);
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Center(
                      child: Text(
                    "Learn More",
                    style: TextStyle(color: AppColors.white),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openPaymentDrawer(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  monthlyPlanCard("23.4", false),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Payment Details',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.title,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Divider(
                            color: AppColors.grey.withOpacity(0.7),
                            thickness: 0.7,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          CustomField(
                            borderRadius: BorderRadius.circular(30),
                            height: screenHeight * 0.08,
                            controller: nameController,
                            hintText: 'Name on Card',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          CustomField(
                            borderRadius: BorderRadius.circular(30),
                            height: screenHeight * 0.08,
                            controller: cardNumberController,
                            hintText: 'Card Number',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomField(
                                  borderRadius: BorderRadius.circular(30),
                                  height: screenHeight * 0.08,
                                  controller: monthController,
                                  hintText: 'Month',
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter month';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomField(
                                  borderRadius: BorderRadius.circular(30),
                                  height: screenHeight * 0.08,
                                  controller: yearController,
                                  hintText: 'Year',
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter year';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          CustomField(
                            borderRadius: BorderRadius.circular(30),
                            height: screenHeight * 0.08,
                            controller: cvcController,
                            hintText: 'CVC',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your CVC';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          const Text(
                            '3 or 4 digit number usually found on the signature strip',
                            style: TextStyle(
                              color: AppColors.description,
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body1,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Icon(CupertinoIcons.info),
                                  SizedBox(width: 10),
                                  Text(
                                    "Save info for your future",
                                    style: TextStyle(
                                      color: AppColors.description,
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.body1,
                                    ),
                                  ),
                                ],
                              ),
                              CustomToggleButton(
                                value: true,
                                onChanged: (bool value) {},
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(
                            color: AppColors.grey.withOpacity(0.7),
                            thickness: 0.7,
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          ActionButton(
                            text: 'Pay \$23.4',
                            backgroundColor: AppColors.primaryColor,
                            textColor: AppColors.white,
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CompletedScreen(
                                          title: "Payment Success",
                                          description:
                                              "Thank you for putting your trust in Hi-Gas, we will try to provide you best service.",
                                          buttonText: "Manage Subscrition")));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  monthlyPlanCard(String price, isShowBestOption) {
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
      ],
    );
  }
}
