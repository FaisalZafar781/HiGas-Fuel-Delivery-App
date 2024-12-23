import 'package:flutter/material.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/PrimaryButton/CustomPrimaryButton.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../services/utils/constants/constants.dart';
import '../../widgets/CustomTextField/custom_textfield.dart';
import '../../widgets/DropdownField/drop_down_field.dart';

class EditAccountDetails extends StatelessWidget {
  EditAccountDetails({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRoundedContainer(
              onTap: () => Navigator.pop(context),
              radius: 100,
              padding: EdgeInsets.all(8),
              backgroundColor: AppColors.containerBorderColor,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24,
              ),
            ),
            const SizedBox(height: 16),
            // Title
            const Text(
              "Edit Account Details",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFontsFamily.spaceGrotesk),
            ),
            SizedBox(height: 20),

            // First Name Field
            CustomField(
              controller: firstNameController,
              hintText: 'First Name',
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'First Name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 12),

            // Last Name Field
            CustomField(
              controller: lastNameController,
              hintText: 'Last Name',
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Last Name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Address Details',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.GreyBlackText,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            CustomField(
              controller: streetAddressController,
              hintText: 'Street Address',
              keyboardType: TextInputType.streetAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Street Address is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              iconEnabledColor: Color(0xffB4B7C5),
              items: ['City 1', 'City 2', 'City 3']
                  .map((city) => DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      ))
                  .toList(),
              onChanged: (value) {
                // Handle city selection
              },
              decoration: InputDecoration(
                hintText: 'City',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textFiledHint ?? AppColors.textFiledHint,
                  fontFamily: AppFontsFamily.spaceGrotesk,
                ),
                filled: true,
                fillColor: AppColors.textFiledColor ?? AppColors.textFiledColor,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(25), // Apply border radius of 25
                  borderSide: BorderSide.none,
                ),
              ),
              icon: Icon(Iconsax.arrow_down_1_copy),
            ),
            SizedBox(height: 12),

            DropdownButtonFormField<String>(
              iconEnabledColor: Color(0xffB4B7C5),
              items: ['State 1', 'State 2', 'State 3']
                  .map((state) => DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      ))
                  .toList(),
              onChanged: (value) {
                // Handle state selection
              },
              decoration: InputDecoration(
                hintText: 'State',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textFiledHint ?? AppColors.textFiledHint,
                  fontFamily: AppFontsFamily.spaceGrotesk,
                ),
                filled: true,
                fillColor: AppColors.textFiledColor ?? AppColors.textFiledColor,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(25), // Apply border radius of 25
                  borderSide: BorderSide.none,
                ),
              ),
              icon: Icon(Iconsax.arrow_down_1_copy),
            ),
            SizedBox(height: 20),

            Spacer(),
            Center(
              child: Text(
                'You can always change profile data from the settings.',
                style: TextStyle(
                  color: AppColors.description,
                  fontSize: AppFontSizes.small,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 14),

            // Continue Button
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ActionButton(
                text: 'Save',
                borderRadius: 30,
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
