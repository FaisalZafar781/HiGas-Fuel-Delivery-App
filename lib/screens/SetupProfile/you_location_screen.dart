import 'package:flutter/material.dart';
import 'package:hi_gas/screens/SetupProfile/create_password.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';

import '../../widgets/ActionButton/action_button.dart';
import '../../widgets/CustomTextField/custom_textfield.dart';
import '../../widgets/DropdownField/drop_down_field.dart';

class YouLocationScreen extends StatefulWidget {
  const YouLocationScreen({
    super.key,
  });

  @override
  State<YouLocationScreen> createState() => _YouLocationScreenState();
}

class _YouLocationScreenState extends State<YouLocationScreen> {
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  TextEditingController locationControllerController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String? selectCity;
  String? selectState;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                "Your location?",
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
                "Let us know where you would most likely need fuel delivered or from where you are able to provide fuel to other users.",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body1,
                    color: AppColors.description,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth * 0.7,
                    child: CustomField(
                      keyboardType: TextInputType.text,
                      hintText: "Label",
                      controller: labelController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Label is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: 55,
                    width: screenWidth * 0.17,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.textFiledColor),
                    child:
                        Icon(Icons.my_location, color: AppColors.primaryColor),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                keyboardType: TextInputType.text,
                hintText: "Street Address",
                controller: streetAddressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Street Address is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              DropDownField(
                hintText: "City",
                value: selectCity,
                items: const ["Islamabad", "Rawalpindi"],
                onChanged: (value) {
                  setState(() {
                    value = selectCity;
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              DropDownField(
                hintText: "State",
                value: selectState,
                items: const ["Punjab", "Sindh", "Kpk", "Balochistan"],
                onChanged: (value) {
                  setState(() {
                    value = selectState;
                  });
                },
              )
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
