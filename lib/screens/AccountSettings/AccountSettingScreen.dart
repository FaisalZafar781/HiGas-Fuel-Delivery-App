import 'package:flutter/material.dart';
import 'package:hi_gas/providers/LanguageProvider.dart';
import 'package:hi_gas/screens/AccountSettings/AccountDetails.dart';
import 'package:hi_gas/screens/DriverScreens/AuthenticationScreens/professional_detail_screen.dart';
import 'package:hi_gas/screens/DriverScreens/DiverPayWallScreen/dirver_paywall_screen.dart';
import 'package:hi_gas/screens/DriverScreens/ManageSubscription/manage_subscription_screen.dart';
import 'package:hi_gas/widgets/PrimaryButton/CustomPrimaryButton.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../services/utils/constants/constants.dart';
import '../../widgets/ActionButton/action_button.dart';
import '../../widgets/ToggleButton/ToggleButton.dart';
import '../DriverScreens/DriverProfessionalDetailScreen/driver_professional_detail_screen.dart';
import 'PasswordReset.dart';
import 'package:provider/provider.dart';

class AccountSetting extends StatelessWidget {
  final bool isDriver;
  const AccountSetting({super.key, required this.isDriver});

  void _showDeleteAccountSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Make the background transparent
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(
              horizontal: 16), // Add margin on left and right
          decoration: const BoxDecoration(
            color: Colors.white, // Set the modal's background color
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                    alignment: Alignment(-1.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Icon(Icons.sentiment_dissatisfied,
                          size: 50, color: Colors.grey),
                    )),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment(-1.0, 0.0),
                  child: Text(
                    "We’re sorry to see you go.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment(-1.0, 0),
                  child: Text(
                    "Deleting your profile will permanently remove your account, including all your data. Once deleted, this action cannot be undone.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: 'Keep my account',
                  onPressed: () {},
                ),
                const SizedBox(height: 8),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    // Handle account deletion logic here
                    Navigator.pop(context); // Close the modal
                  },
                  child: const Text(
                    "Delete my account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(height: 24),
            const Text(
              "Account Settings",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFontsFamily.spaceGrotesk),
            ),
            const SizedBox(height: 20),
            Consumer<LanguageProvider>(
              builder: (context, provider, child) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.containerBorderColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Iconsax.language_circle_copy,
                      color: Colors.black,
                    ),

                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // English Text
                        Text(
                          'English',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            color: provider.isGerman
                                ? AppColors.greyText
                                : AppColors.black,
                            fontWeight: provider.isGerman
                                ? FontWeight.w500
                                : FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' · ',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            color: AppColors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        // Germany Text
                        Text(
                          'Germany',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            color: provider.isGerman
                                ? AppColors.black
                                : AppColors.greyText,
                            fontWeight: provider.isGerman
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    subtitle: Text(
                      'Switch language English / German',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),

                    // Toggle Button
                    trailing: CustomToggleButton(
                      value: provider.isGerman,
                      onChanged: (bool value) {
                        provider.toggleLanguage();
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.containerBorderColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading:
                    const Icon(Iconsax.notification_copy, color: Colors.black),
                title: const Text(
                  "Notifications",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: CustomToggleButton(
                  value: true,
                  onChanged: (bool value) {},
                ),
              ),
            ),
            // Edit Account Details
            const SizedBox(
              height: 10,
            ),
            isDriver
                ? Container(
                    decoration: BoxDecoration(
                        color: AppColors.containerBorderColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: const Icon(Iconsax.setting_2_copy,
                          color: Colors.black),
                      title: const Text(
                        "Professional Details",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DriverProfessionalDetailScreen(),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            // Professional details
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.containerBorderColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const Icon(Iconsax.user_copy, color: Colors.black),
                title: const Text(
                  "Edit Account Details",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAccountDetails(),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10),
            // Change Password
            Container(
              decoration: BoxDecoration(
                  color: AppColors.containerBorderColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading:
                    const Icon(Iconsax.security_safe_copy, color: Colors.black),
                title: const Text(
                  "Change Password",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPassword(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            // Subscription
            isDriver
                ? Container(
                    decoration: BoxDecoration(
                        color: AppColors.containerBorderColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading:
                          const Icon(Iconsax.lock_copy, color: Colors.black),
                      title: const Text(
                        "Subscription",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverPaywallScreen(),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            // Edit Account Details
            const Spacer(),
            // Delete Account Button
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 16.0, left: 20, right: 20),
                child: ActionButton(
                  borderRadius: 25,
                  text: 'Delete Account',
                  backgroundColor: Colors.transparent,
                  textColor: AppColors.RedColor,
                  borderColor: AppColors.RedColor,
                  onPressed: () {
                    _showDeleteAccountSheet(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
