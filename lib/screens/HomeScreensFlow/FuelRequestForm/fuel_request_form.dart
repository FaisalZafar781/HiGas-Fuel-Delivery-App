import 'package:flutter/material.dart';
import 'package:hi_gas/screens/HomeScreensFlow/PaywallScreen/paywall_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/FuelRequestProvider.dart';

class FuelRequestForm extends StatelessWidget {
  const FuelRequestForm({super.key});

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
                          'Place Fuel Request',
                          style: TextStyle(
                            fontSize: AppFontSizes.title,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Please enter following details to create a bid for drivers and get your fuel',
                          style: TextStyle(
                              fontSize: AppFontSizes.body,
                              color: AppColors.IconColors,
                              fontFamily: AppFontsFamily.spaceGrotesk),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            Expanded(
                              child: CustomField(
                                borderColor: AppColors.grey,
                                controller:
                                    fuelRequestProvider.locationController,
                                hintText: 'Location',
                                keyboardType: TextInputType.text,
                                validator: null,
                              ),
                            ),
                            const SizedBox(width: 10),
                            CustomRoundedContainer(
                              padding: const EdgeInsets.all(15),
                              radius: 100,
                              backgroundColor: AppColors.containerBorderColor,
                              child: Icon(
                                Iconsax.map_copy,
                                color: AppColors.primaryColor,
                                size: 25,
                              ),
                            ),
                          ],
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
                          validator: null,
                          suffixIcon: const Icon(Iconsax.arrow_down_1_copy),
                          onTap: () {
                            _openFuelCompanyDrawer(
                                context, fuelRequestProvider);
                          },
                        ),

                        SizedBox(height: screenHeight * 0.02),

                        SizedBox(height: screenHeight * 0.02),
                        CustomField(
                          borderColor: AppColors.grey,
                          controller: TextEditingController(
                            text: fuelRequestProvider.paymentMethod.isEmpty
                                ? 'Payment Method'
                                : fuelRequestProvider.paymentMethod,
                          ),
                          readOnly: true,
                          hintText: 'Payment Method',
                          keyboardType: TextInputType.text,
                          validator: null,
                          suffixIcon: const Icon(Iconsax.arrow_down_1_copy),
                          onTap: () {
                            _openPaymentMethodDrawer(
                                context, fuelRequestProvider);
                          },
                        ),

                        SizedBox(
                            height: screenHeight *
                                0.1), // Add space to prevent content overlap
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomRoundedContainer(
                      borderColor: AppColors.grey.withOpacity(0.5),
                      showBorder: true,
                      backgroundColor: AppColors.textFiledColor,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Deadline - Home',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.subtitle1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$/tank',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.body,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            fuelRequestProvider.isFormValid()
                                ? '${fuelRequestProvider.tankCount} Tank | ${fuelRequestProvider.preferredFuelCompany} | ${fuelRequestProvider.deliveryDeadline} minute'
                                : 'Quantity | Brand | Delivery Deadline',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body,
                              color: AppColors.textFiledHint,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.lighyGreyColor1,
                      thickness: 1,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    InkWell(
                      onTap: () {
                        if (fuelRequestProvider.isFormValid()) {
                          _openCostBreakdownDrawer(context);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Cost Breakdown',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      color: AppColors.textFiledHint,
                                      fontSize: AppFontSizes.body1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Icon(
                                    Iconsax.arrow_right_3_copy,
                                    color: AppColors.textFiledHint,
                                    size: 15,
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              Text(
                                fuelRequestProvider.isFormValid()
                                    ? '\$61.00'
                                    : '\$00.00',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.subtitle,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          ActionButton(
                            buttonWidth: screenWidth * 0.5,
                            borderRadius: 30,
                            text: 'Create Now',
                            backgroundColor: fuelRequestProvider.isFormValid()
                                ? AppColors
                                    .primaryColor // Change color if valid
                                : AppColors.buttonFilled, // Default color
                            textColor: fuelRequestProvider.isFormValid()
                                ? AppColors.white // Text color for valid
                                : AppColors.grey, // Default text color
                            borderColor: fuelRequestProvider.isFormValid()
                                ? AppColors.primaryColor
                                : AppColors.buttonFilled,
                            onPressed: fuelRequestProvider.isFormValid()
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                             PaywallScreen(),
                                      ),
                                    );
                                  }
                                : () {}, // Provide an empty callback when form is invalid
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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

  void _openPaymentMethodDrawer(
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
            height: screenHeight * 0.4, // Increased height
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
                    'Select Payment Method',
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
                  // Option for "Cash"
                  GestureDetector(
                    onTap: () {
                      fuelRequestProvider.updatePaymentMethod('Cash');
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: AppColors.primaryColor,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Cash',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            fontWeight: FontWeight.bold,
                            color: fuelRequestProvider.paymentMethod == 'Cash'
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  // Option for "Online Payment"
                  GestureDetector(
                    onTap: () {
                      fuelRequestProvider.updatePaymentMethod('Online Payment');
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.online_prediction,
                          color: Colors.blue,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Online Payment',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            fontWeight: FontWeight.bold,
                            color: fuelRequestProvider.paymentMethod ==
                                    'Online Payment'
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

  void _openCostBreakdownDrawer(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: screenHeight * 0.28,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cost Breakdown',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Fuel Per Liter',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: '\$12.80/tank  ',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '1x',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body1,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Service Fees',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '\$1.80',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Cost',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.title1,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '\$61.00',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.title1,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
