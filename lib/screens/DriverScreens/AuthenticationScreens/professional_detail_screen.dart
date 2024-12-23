import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_gas/screens/HomeScreensFlow/HomeScreen/home_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';

class ProfessionalDetailScreen extends StatefulWidget {
  const ProfessionalDetailScreen({
    super.key,
  });

  @override
  State<ProfessionalDetailScreen> createState() =>
      _ProfessionalDetailScreenState();
}

class _ProfessionalDetailScreenState extends State<ProfessionalDetailScreen> {
  TextEditingController taxPayerRegisteryController = TextEditingController();
  TextEditingController idCardController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
        top: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Professional Details",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    color: AppColors.text,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  'Please add your professional details to register as a driver.',
                  style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body1,
                      color: AppColors.description,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                obscureText: true,
                keyboardType: TextInputType.text,
                hintText: "Single Taxpayer Registery (RUC)",
                controller: taxPayerRegisteryController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "RUC is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                obscureText: true,
                keyboardType: TextInputType.text,
                hintText: "Identification card",
                controller: idCardController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "id card is required";
                  }
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
