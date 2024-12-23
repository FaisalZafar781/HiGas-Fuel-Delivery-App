import 'package:flutter/material.dart';
import 'package:hi_gas/screens/HomeScreensFlow/HomeScreen/home_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/WaitScreen/wait_time_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class PaywallScreen extends StatefulWidget {
  PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  final nameController = TextEditingController();

  final cardNumberController = TextEditingController();

  final monthController = TextEditingController();

  final yearController = TextEditingController();

  final cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.screenColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.1, -0.5), // Gradient starts from top center
            radius: 1, // You can adjust the radius to control the spread
            colors: [
              Color(0xff031648), // Color at the center
              Color(0xff000a25), // Color at the outer edges
            ],
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomRoundedContainer(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WaitScreen())),
                          radius: 100,
                          padding: EdgeInsets.all(10),
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Text(
                      'Complete Payment to Post Your Request',
                      style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        color: Colors.white,
                        fontSize: AppFontSizes.title,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Text(
                      'To proceed with posting your request, you need to pay the required fees. If there are any pending penalty charges from previous cancellations, they will also be included in this payment.',
                      style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        color: Colors.white,
                        fontSize: AppFontSizes.body,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.2),
                    CustomRoundedContainer(
                      backgroundColor: AppColors.grey.withOpacity(0.3),
                      radius: 12,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Terminal Berlin Branden...',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  color: Colors.white,
                                  fontSize: AppFontSizes.body,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$41.4',
                                style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    color: Colors.white,
                                    fontSize: AppFontSizes.body,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            '1 Tank | Congas | 30 minutes | Cash',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              color: AppColors.white,
                              fontSize: AppFontSizes.body1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomRoundedContainer(
                      radius: 12,
                      backgroundColor: AppColors.grey.withOpacity(0.3),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text('Request Fee',
                                  style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      color: Colors.white,
                                      fontSize: AppFontSizes.body1,
                                      fontWeight: FontWeight.bold)),
                              Spacer(),
                              Text('\$2.88',
                                  style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      color: Colors.white,
                                      fontSize: AppFontSizes.body1,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          const Row(
                            children: [
                              Text('Pending Penalty Fees',
                                  style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      color: Colors.white,
                                      fontSize: AppFontSizes.body,
                                      fontWeight: FontWeight.bold)),
                              Spacer(),
                              Text('\$1.80',
                                  style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      color: Colors.white,
                                      fontSize: AppFontSizes.body,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          const Row(
                            children: [
                              Text('Total Payment',
                                  style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      color: Colors.white,
                                      fontSize: AppFontSizes.subtitle,
                                      fontWeight: FontWeight.bold)),
                              Spacer(),
                              Text('\$3.88',
                                  style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      color: Colors.white,
                                      fontSize: AppFontSizes.subtitle,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Text(
                      'Paayment ensures your request is prioritized and helps maintain a fair experience for all users. Thank you for you understanding!',
                      style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.grey,
                          fontSize: AppFontSizes.body1,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    ActionButton(
                        borderRadius: 25,
                        text: 'Pay Now',
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        borderColor: Colors.transparent,
                        onPressed: () {
                          _openPaymentDrawer(context);
                        })
                  ],
                ),
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
              return Container(
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
                          SizedBox(width: 10),
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
                      Text(
                        '3 or 4 digit number usually found on the signature strip',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: AppFontSizes.body1,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Divider(
                        color: AppColors.grey.withOpacity(0.7),
                        thickness: 0.7,
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      ActionButton(
                        text: 'Pay \$23.4',
                        backgroundColor: AppColors.buttonFilled,
                        textColor: AppColors.grey.withOpacity(0.7),
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        onPressed: () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                content: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomRoundedContainer(
                                          radius: 100,
                                          padding: const EdgeInsets.all(5),
                                          backgroundColor:
                                              Colors.green.withOpacity(0.3),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Payment Success',
                                          style: TextStyle(
                                            fontFamily:
                                                AppFontsFamily.spaceGrotesk,
                                            fontSize: AppFontSizes.title,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Divider(
                                          color:
                                              AppColors.grey.withOpacity(0.7),
                                          thickness: 0.7,
                                        ),
                                        const SizedBox(height: 10),
                                        const Center(
                                          child: Text(
                                            'Thank you for putting your trust in Hi-Gas, we will try to provide you best service.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily:
                                                  AppFontsFamily.spaceGrotesk,
                                              fontSize: AppFontSizes.body1,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
