import 'package:flutter/material.dart';
import 'package:hi_gas/screens/SetupProfile/you_location_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../widgets/ActionButton/action_button.dart';
import '../../widgets/CustomTextField/custom_textfield.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({
    super.key,
  });

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  TextEditingController fistNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
        top: 20,
        bottom: 90,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Lets Setup your profile!",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    color: AppColors.text,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please provide following information for your identity confirmation. ",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body1,
                    color: AppColors.description,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.textFiledColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomRoundedContainer(
                      padding: EdgeInsets.all(20),
                      radius: 100,
                      backgroundColor: AppColors.containerBorderColor,
                      child: Icon(
                        Iconsax.user_copy,
                        color: AppColors.black,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text("Upload Profile Image",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                keyboardType: TextInputType.text,
                hintText: "First Name",
                controller: fistNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "fist name is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                keyboardType: TextInputType.text,
                hintText: "Last Name",
                controller: lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Last Name is required";
                  }
                  return null;
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "You can always change profile data from the settings. ",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body1,
                    color: AppColors.description,
                    fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );
  }
}
