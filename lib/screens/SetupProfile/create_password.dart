import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hi_gas/screens/HomeScreensFlow/HomeScreen/home_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../widgets/ActionButton/action_button.dart';
import '../../widgets/CustomTextField/custom_textfield.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({
    super.key,
  });

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  TextEditingController passwordAddressController = TextEditingController();
  TextEditingController matchPasswordAddressController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create a password",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    color: AppColors.text,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                // borderColorfocused: AppColors.RedColor,
                obscureText: true,
                keyboardType: TextInputType.text,
                hintText: "Choose a Strong Password",
                controller: passwordAddressController,
                suffixIcon: Icon(Iconsax.eye_slash_copy),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                // borderColorfocused: AppColors.RedColor,
                obscureText: true,
                keyboardType: TextInputType.text,
                hintText: "Re-enter Password",
                controller: matchPasswordAddressController,
                suffixIcon: Icon(Iconsax.eye_slash_copy),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
            ],
          ),
          const Text(
            "Password must be 8 character long.\n Please use alpha numeric characters",
            style: TextStyle(
                fontFamily: AppFontsFamily.spaceGrotesk,
                fontSize: AppFontSizes.body1,
                color: AppColors.description,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
