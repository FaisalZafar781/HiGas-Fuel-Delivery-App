import 'package:flutter/material.dart';
import 'package:hi_gas/screens/HomeScreensFlow/OrderAcceptedScreen/payment_success.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';

class ConfirmationCodeScreen extends StatelessWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 110, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verification Code',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Please ask the fuel rider to provide a code to complete the delivery &pay.',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomField(
                    controller: TextEditingController(),
                    hintText: 'Enter 6-digit Code',
                    keyboardType: TextInputType.number,
                    borderColor: AppColors.grey,
                    height: screenHeight * 0.07,
                    borderRadius: BorderRadius.circular(30),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the code';
                      }
                      return null;
                    }),
              ],
            ),
          ),
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
                    ActionButton(
                      text: 'Confirm Code & Pay',
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      onPressed: () {
                        _openCodeConfirmDrawer(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openCodeConfirmDrawer(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: screenHeight * 0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRoundedContainer(
                    radius: 100,
                    padding: EdgeInsets.all(5),
                    backgroundColor: Colors.green.withOpacity(0.3),
                    child: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                 const  Text('Code Confirmed',
                      style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        fontSize: AppFontSizes.title,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Please proceed with payment. Once paid please tap button below to mark payment success.',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Divider(
                    color: AppColors.grey,
                    thickness: 0.5,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  ActionButton(
                    text: '\$1.24 Paid',
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.white,
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentSuccessScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
