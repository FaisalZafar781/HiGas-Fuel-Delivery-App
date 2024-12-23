import 'package:flutter/material.dart';
import 'package:hi_gas/screens/DriverScreens/AuthenticationScreens/fuel_permit_screen.dart';
import 'package:hi_gas/screens/DriverScreens/AuthenticationScreens/licensing_details_screen.dart';
import 'package:hi_gas/screens/DriverScreens/AuthenticationScreens/professional_detail_screen.dart';
import 'package:hi_gas/screens/DriverScreens/AuthenticationScreens/profile_completed_screen.dart';
import 'package:hi_gas/screens/DriverScreens/AuthenticationScreens/vehicle_detail_screen.dart';
import 'package:hi_gas/screens/MainScreen/main_screen.dart';
import 'package:hi_gas/screens/VerificationScreens/verificaiton_email1_screen.dart';
import 'package:hi_gas/screens/VerificationScreens/verification_code_screen.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../services/utils/constants/constants.dart';
import '../SetupProfile/create_password.dart';
import '../SetupProfile/profile_setup_screen.dart';
import '../SetupProfile/you_location_screen.dart';

class VerificationPageBuilder extends StatefulWidget {
  final bool isDriver;
  final int initialPage; // New optional parameter

  VerificationPageBuilder({
    super.key,
    required this.isDriver,
    this.initialPage = 0, // Default value
  });

  @override
  _VerificationPageBuilderState createState() =>
      _VerificationPageBuilderState();
}

class _VerificationPageBuilderState extends State<VerificationPageBuilder> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Initialize the PageController with the initial page
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      VerificaitonEmail1Screen(),
      VerificationCodeScreen(),
      ProfileSetupScreen(),
      YouLocationScreen(),
      CreatePassword(),
    ];

    final List<Widget> screensDriver = [
      VerificaitonEmail1Screen(),
      VerificationCodeScreen(),
      ProfileSetupScreen(),
      YouLocationScreen(),
      CreatePassword(),
      ProfessionalDetailScreen(),
      LicensingDetailsScreen(),
      VehicleDetailScreen(),
      FuelPermitScreen(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomRoundedContainer(
            radius: 100,
            backgroundColor: AppColors.textFiledColor,
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.black,
              size: 30,
            ),
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SmoothPageIndicator(
            controller: _pageController,
            count: widget.isDriver ? screensDriver.length : screens.length,
            effect: WormEffect(
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: AppColors.black,
              dotColor: Colors.grey.shade400,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.isDriver ? screensDriver.length : screens.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewInsets.bottom,
                child: widget.isDriver ? screensDriver[index] : screens[index],
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ActionButton(
              text: "Continue",
              backgroundColor: AppColors.primaryColor,
              textColor: AppColors.white,
              borderColor: AppColors.primaryColor,
              onPressed: () {
                final nextPage = (_pageController.page?.toInt() ?? 0) + 1;
                if (nextPage <
                    (widget.isDriver ? screensDriver.length : screens.length)) {
                  _pageController.animateToPage(
                    nextPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  widget.isDriver
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileCompletedScreen(
                              isDriver: widget.isDriver,
                            ),
                          ),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(
                              isDriver: widget.isDriver,
                            ),
                          ),
                        );
                }
              },
              borderRadius: 30,
            ),
          ),
        ],
      ),
    );
  }
}
