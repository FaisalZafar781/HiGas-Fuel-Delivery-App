import 'package:flutter/material.dart';
import 'package:hi_gas/screens/AccountSettings/AccountSettingScreen.dart';
import 'package:hi_gas/screens/MainScreen/main_screen.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/PrimaryButton/CustomPrimaryButton.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../generated/assets.dart';
import '../../screens/OrderHistory/RequestHistoryScreen.dart';
import '../../screens/PrivacyPolicy/PrivacyPolicyScreen.dart';
import '../../screens/TermsAndConditions/TermsScreen.dart';
import '../../services/utils/constants/constants.dart';
import '../ToggleButton/ToggleButton.dart';

class CustomDrawer extends StatelessWidget {
  final bool? isDriver;
  const CustomDrawer({super.key, this.isDriver});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      width: MediaQuery.of(context).size.width * 0.90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color:
                        Color(0xffF6F6F8), // Set the background color to grey
                    shape: BoxShape.circle, // Make it circular
                  ),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          Icon(Icons.close, color: AppColors.black, size: 30)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.primaryColor,
                      child: const Icon(Iconsax.user_copy,
                          color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Smith Steven",
                            style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body,
                                color: AppColors.GreyBlackText,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Color(0xffF9CA10),
                                size: 15,
                              ),
                              Text(
                                " 4.9 (2 Orders)",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomRoundedContainer(
                      radius: 100,
                      borderColor: AppColors.grey,
                      height: 50,
                      width: 80,
                      backgroundColor: const Color(0xffF6F6F8),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(
                                    isDriver: true,
                                  ),
                                ));
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body,
                                color: AppColors.GreyBlackText,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading:
                      Image.asset(Assets.imagesHomeIcon, height: 26, width: 26),
                  title: Text(
                    "Home",
                    style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        fontWeight: FontWeight.w900),
                  ),
                  tileColor: Colors.white, // Ensures white background
                  onTap: () {
                    // Navigate to Home
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    Assets.imagesOrderHistory,
                    height: 26,
                    width: 26,
                  ),
                  tileColor: Colors.white,
                  title: const Text(
                    "Order History",
                    style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        fontWeight: FontWeight.w900),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RequestHistory(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    Assets.imagesSettingsIcon,
                    height: 26,
                    width: 26,
                  ),
                  title: const Text(
                    "Account Settings",
                    style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        fontWeight: FontWeight.w900),
                  ),
                  tileColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AccountSetting(isDriver: isDriver ?? false),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    Assets.imagesPrivacyIcon,
                    height: 26,
                    width: 26,
                  ),
                  title: const Text(
                    "Privacy Policy",
                    style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        fontWeight: FontWeight.w900),
                  ),
                  tileColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    Assets.imagesTermsIcon,
                    height: 26,
                    width: 26,
                  ),
                  title: const Text(
                    "Terms and Conditions",
                    style: TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        fontWeight: FontWeight.w900),
                  ),
                  tileColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermScreen(),
                      ),
                    );
                  },
                ),

              ],
            ),
          ),
          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: ActionButton(
                borderRadius: 30,
                text: (isDriver ?? false)
                    ? 'Switch to customer'
                    : 'Register as Driver',
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.white,
                borderColor: Colors.transparent,
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
