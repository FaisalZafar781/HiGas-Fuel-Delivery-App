import 'package:flutter/material.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/driver_home_screen.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/request_on_map.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/request_with_timer_map_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/PaywallScreen/paywall_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RequestBottomSheet/request_bottom_sheet.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:hi_gas/widgets/TimeLineWidget/CustomTimeLine.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/FuelRequestProvider.dart';
import '../../../widgets/UserCard/user_card.dart';
import '../../HomeScreensFlow/OrderAcceptedScreen/rate_rider_screen.dart';

class SubmitProposalScreen extends StatelessWidget {
  const SubmitProposalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final fuelRequestProvider =
        Provider.of<FuelRequestProvider>(context, listen: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Main Content
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRoundedContainer(
                          radius: 100,
                          backgroundColor: AppColors.buttonFilled,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context); // Navigate back
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        const Text(
                          'Submit Proposal',
                          style: TextStyle(
                            fontSize: AppFontSizes.title,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'The fields below are pre-filled based on the customer\'s request. Feel free to adjust them to offer your personalized bid.',
                          style: TextStyle(
                              fontSize: AppFontSizes.body,
                              color: AppColors.black,
                              fontFamily: AppFontsFamily.spaceGrotesk),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomRoundedContainer(
                          radius: 100,
                          height: screenHeight * 0.075,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          backgroundColor: AppColors.textFiledColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  fuelRequestProvider.decrementTank();
                                },
                                child: CustomRoundedContainer(
                                  radius: 100,
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor: AppColors.white,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Text(
                                fuelRequestProvider.tankCount > 0
                                    ? '${fuelRequestProvider.tankCount} Tanks'
                                    : 'No. of Tanks',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.subtitle1,
                                  fontWeight: FontWeight.bold,
                                  color: fuelRequestProvider.tankCount > 0
                                      ? AppColors.black // Selected color
                                      : AppColors.grey, // Default color
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  fuelRequestProvider.incrementTank();
                                },
                                child: CustomRoundedContainer(
                                  radius: 100,
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor: AppColors.white,
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.primaryColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomRoundedContainer(
                          radius: 100,
                          height: screenHeight * 0.075,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          backgroundColor: AppColors.textFiledColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  fuelRequestProvider.decrementDeadline();
                                },
                                child: CustomRoundedContainer(
                                  radius: 100,
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor: AppColors.white,
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ),
                              // Delivery Deadline Text
                              Text(
                                fuelRequestProvider.deliveryDeadline > 0
                                    ? '${fuelRequestProvider.deliveryDeadline} Minutes'
                                    : 'Set Delivery Deadline',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.subtitle1,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      fuelRequestProvider.deliveryDeadline > 0
                                          ? AppColors.black // Selected color
                                          : AppColors.grey, // Default color
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  fuelRequestProvider.incrementDeadline();
                                },
                                child: CustomRoundedContainer(
                                  radius: 100,
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor: AppColors.white,
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.primaryColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          borderColor: AppColors.grey,
                          controller: TextEditingController(
                            text:
                                fuelRequestProvider.preferredFuelCompany.isEmpty
                                    ? 'Preferred Fuel Company'
                                    : fuelRequestProvider.preferredFuelCompany,
                          ),
                          readOnly: true,
                          hintText: 'Preferred Fuel Company',
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter delivery charges';
                            }
                            return null;
                          },
                          suffixIcon: const Icon(Iconsax.arrow_down_1_copy),
                          onTap: () {
                            _openFuelCompanyDrawer(
                                context, fuelRequestProvider);
                          },
                        ),

                        //charges field
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          borderColor: AppColors.grey,
                          controller:
                              fuelRequestProvider.deliveryChargesController,
                          readOnly: false,
                          hintText: 'Delivery Charges',
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter price per tank';
                            }
                            return null;
                          },
                          onTap: () {},
                        ),

                        // Price per tank
                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          borderColor: AppColors.grey,
                          controller:
                              fuelRequestProvider.pricePerTankController,
                          readOnly: false,
                          hintText: 'Price per Tank',
                          keyboardType: TextInputType.text,
                          validator: null,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Summary Section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.01),
                  Divider(
                    color: AppColors.grey.withOpacity(0.7),
                    thickness: 0.7,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Submit a competitive bid to increase your chances of being selected!',
                          style: TextStyle(
                              fontSize: AppFontSizes.body,
                              color: AppColors.black,
                              fontFamily: AppFontsFamily.spaceGrotesk),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        ActionButton(
                            text: 'Review Proposal',
                            borderRadius: 30,
                            backgroundColor: AppColors.primaryColor,
                            textColor: AppColors.white,
                            borderColor: Colors.transparent,
                            onPressed: () {
                              Navigator.pop(context);
                              RequestBottomSheet(
                                context,
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openFuelCompanyDrawer(
      BuildContext context, FuelRequestProvider fuelRequestProvider) {
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: screenHeight * 0.4, // Increased height for better usability
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fuel Company',
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

                  // Option for "Congas"
                  GestureDetector(
                    onTap: () {
                      fuelRequestProvider.updatePreferredFuelCompany('Congas');
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.gas_station,
                          color: AppColors.primaryColor,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Congas',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            fontWeight: FontWeight.bold,
                            color: fuelRequestProvider.preferredFuelCompany ==
                                    'Congas'
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),

                  // Option for "Durgas"
                  GestureDetector(
                    onTap: () {
                      fuelRequestProvider.updatePreferredFuelCompany('Durgas');
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.gas_station,
                          color: Colors.amber,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Durgas',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            fontWeight: FontWeight.bold,
                            color: fuelRequestProvider.preferredFuelCompany ==
                                    'Durgas'
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),

                  // Option for "AgipGas"
                  GestureDetector(
                    onTap: () {
                      fuelRequestProvider.updatePreferredFuelCompany('AgipGas');
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.gas_station,
                          color: Colors.blue,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'AgipGas',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            fontWeight: FontWeight.bold,
                            color: fuelRequestProvider.preferredFuelCompany ==
                                    'AgipGas'
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

//RequestBottomSheet Details.
  void RequestBottomSheet(
    BuildContext context,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeight * 0.49, // Height of green container
            width: screenWidth,
            padding:
                const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 10),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CustomRoundedContainer(
                        width: 50,
                        height: 7,
                        backgroundColor: AppColors.slate400,
                        radius: 10,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Request Details',
                      style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        color: AppColors.black,
                        fontSize: AppFontSizes.title1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  size: 20,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 5),
                                RichText(
                                  text: TextSpan(
                                    text: '4.5',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.body1,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' (23 Orders)',
                                        style: TextStyle(
                                          fontFamily:
                                              AppFontsFamily.spaceGrotesk,
                                          fontSize: AppFontSizes.body1,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textFiledHint,
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
                        const Text(
                          'John Doe',
                          style: TextStyle(
                            // fontFamily: AppFontsFamily.spaceGroteskBold,
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.subtitle1,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Divider(
                          color: AppColors.grey.withOpacity(0.5),
                          thickness: 1,
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Quantity',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: AppFontSizes.small,
                                    color: AppColors.textFiledHint,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  '1 Tank',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: AppFontSizes.body,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Text(
                              ' | ',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body,
                                color: AppColors.textFiledHint,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Fuel Brand',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: AppFontSizes.small,
                                    color: AppColors.textFiledHint,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'Congas',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: AppFontSizes.body,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Text(
                              ' | ',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body,
                                color: AppColors.textFiledHint,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Time',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: AppFontSizes.small,
                                    color: AppColors.textFiledHint,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  '30 min',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: AppFontSizes.body,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Text(
                              ' | ',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body,
                                color: AppColors.textFiledHint,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Payment',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: AppFontSizes.small,
                                    color: AppColors.textFiledHint,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'Cash',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: AppFontSizes.body,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Divider(
                      color: AppColors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                    // SizedBox(height: screenHeight * 0.005),
                    Container(
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
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Terminal I Berlin Brandenburg Airpor... (You)",
                                style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    fontSize: 14),
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
                    ),
                  ],
                ),
                Column(
                  children: [
                    Divider(
                      color: AppColors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    ActionButton(
                      borderRadius: 30,
                      text: 'Submit Proposal',
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      borderColor: Colors.transparent,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         const RequestWithTimerMapScreen(),
                        //   ),
                        // );
                        Navigator.pop(context);
                        WaitBottomSheet(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//WaitBottomSheet
  void WaitBottomSheet(
    BuildContext context,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: screenHeight * 0.28, // Height of green container
                  width: screenWidth,
                  padding: const EdgeInsets.only(
                      left: 20, top: 10, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        'Please wait we are getting customer response',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.title,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        color: Colors.green,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(height: screenHeight * 0.003),
                      ActionButton(
                          borderRadius: 30,
                          text: 'Wait',
                          backgroundColor: AppColors.containerBorderColor,
                          textColor: AppColors.slate700,
                          borderColor: Colors.transparent,
                          onPressed: () {
                            Navigator.pop(context);
                            CongratsBottomSheet(context);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  //Congrats Bottom sheet
  void CongratsBottomSheet(
    BuildContext context,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestWithTimerMapScreen(),
                    ),
                  );
                },
                child: Container(
                  height: screenHeight * 0.3, // Height of green container
                  width: screenWidth,
                  padding: const EdgeInsets.only(
                      left: 20, top: 15, right: 20, bottom: 15),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/Vector.png",
                            height: 40,
                            width: 40,
                          ),
                          TextButton(onPressed: () {
                            _openBookingsDrawer(context, true);
                          }, child: Text("Offline Flow")),
                        ],
                      ),
                      Text(
                        'Congratulations! The customer has accepted your bid. ',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.title,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Please proceed with the delivery as per the details.',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.body,
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }


  void _openBookingsDrawer(BuildContext context, bool isOffline) {
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: screenHeight * 0.93, // Adjust modal height
          decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section with title
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
                child: Text(
                  'Accepting Bookings',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    color: Colors.white,
                    fontSize: AppFontSizes.subtitle1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Main content with scroll
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CustomRoundedContainer(
                                width: 60,
                                height: 5,
                                backgroundColor: AppColors.lighyGreyColor1,
                                radius: 10,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            const Text(
                              'Requests',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.title1,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            // User card
                            UserCard(
                              count: 10,
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RequestOnMap(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Floating widget
                    isOffline == false ? Container() : Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: CustomRoundedContainer(
                        onTap: () {
                          Navigator.pop(context);
                          proposalNotAccept(context, screenHeight, screenWidth);
                        },
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        backgroundColor: AppColors.slate700,
                        radius: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Offer Expired",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.subtitle1),
                            ),
                            Text(
                              "Send Again",
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  proposalNotAccept(
      BuildContext context, double screenHeight, double screenWidth) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  rideCancel(context, screenHeight, screenWidth);
                },
                child: Container(
                  height: screenHeight * 0.3, // Height of green container
                  width: screenWidth,
                  padding: const EdgeInsets.only(
                      left: 20, top: 15, right: 20, bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Proposal not accepted',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.title,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'We’re sorry, but the customer didnt accepted your proposal. You’ll be notified of new ride opportunities soon.',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.body,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Divider(
                        color: AppColors.greyText?.withOpacity(0.5),
                        thickness: 1,
                      ),
                      ActionButton(
                        text: "Go Back to Home",
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        borderColor: AppColors.primaryColor,
                        onPressed: () {
                          rideCancel(context, screenHeight, screenWidth);
                          // Navigator.pop(context);
                        },
                        borderRadius: 30,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  rideCancel(BuildContext context, double screenHeight, double screenWidth) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: screenHeight * 0.36, // Height of green container
                  width: screenWidth,
                  padding: const EdgeInsets.only(
                      left: 20, top: 15, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The customer has cancelled the ride.',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.title1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'We’re sorry, but the customer decided to cancel their request. You’ll be notified of new ride opportunities soon.',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.body,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Divider(
                        color: AppColors.greyText?.withOpacity(0.5),
                        thickness: 0.5,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      ActionButton(
                        text: "Rate Customer",
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        borderColor: AppColors.primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RatingScreen(
                                title: "Rate Customer",
                                isDriver: true,
                              ),
                            ),
                          );
                        },
                        borderRadius: 25,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DriverHomeScreen(isDriver: true),));
                          },
                          child: const Center(
                              child: Text(
                                "Go to Home",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFontSizes.body,
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                ),
                              ))),
                      SizedBox(height: screenHeight * 0.005),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
