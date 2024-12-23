import 'package:flutter/material.dart';
import 'package:hi_gas/screens/DriverScreens/AuthenticationScreens/licensing_details_screen.dart';
import 'package:hi_gas/screens/DriverScreens/AuthenticationScreens/professional_detail_screen.dart';
import 'package:hi_gas/screens/DriverScreens/AuthenticationScreens/vehicle_detail_screen.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/driver_home_screen.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../services/utils/constants/constants.dart';

class DriverProfessionalPageBuilderScreen extends StatefulWidget {
  final int initialPage; // New optional parameter

  DriverProfessionalPageBuilderScreen({
    super.key,
    this.initialPage = 0, // Default value
  });

  @override
  _VerificationPageBuilderState createState() =>
      _VerificationPageBuilderState();
}

class _VerificationPageBuilderState extends State<DriverProfessionalPageBuilderScreen> {
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
      ProfessionalDetailScreen(),
      LicensingDetailsScreen(),
      VehicleDetailScreen(),
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
            count: screens.length,
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
            itemCount: screens.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewInsets.bottom,
                child: screens[index],
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
                if (nextPage < screens.length) {
                  _pageController.animateToPage(
                    nextPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pop(context);
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
