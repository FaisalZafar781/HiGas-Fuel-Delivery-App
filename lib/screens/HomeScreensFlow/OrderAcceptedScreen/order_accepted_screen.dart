import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_gas/providers/LocationProvider.dart';
import 'package:hi_gas/screens/HomeScreensFlow/HomeScreen/home_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/OrderAcceptedScreen/rate_rider_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/OrderAcceptedScreen/verification_code_screen.dart';
import 'package:hi_gas/screens/VerificationScreens/verification_code_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

class OrderAcceptedScreen extends StatefulWidget {
  final bool? isLate;
  const OrderAcceptedScreen({
    super.key,
    this.isLate = false,
  });

  @override
  State<OrderAcceptedScreen> createState() => _OrderAcceptedScreenState();
}

class _OrderAcceptedScreenState extends State<OrderAcceptedScreen> {
  bool isLocationEnabled = false;
  late GoogleMapController _mapController;
  @override
  void initState() {
    super.initState();

    // Monitor location services status
    Geolocator.getServiceStatusStream().listen((status) {
      setState(() {
        isLocationEnabled = status == ServiceStatus.enabled;
      });
    });

    // Get current location initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locationProvider =
          Provider.of<LocationProvider>(context, listen: false);
      _checkLocationAndMove(locationProvider);
    });
  }

  void _checkLocationAndMove(LocationProvider locationProvider) async {
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    setState(() {
      isLocationEnabled = isServiceEnabled;
    });

    if (isServiceEnabled) {
      _moveToCurrentLocation(locationProvider);
    }
  }

  void _moveToCurrentLocation(LocationProvider locationProvider) {
    if (locationProvider.currentLocation != null) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              locationProvider.currentLocation!.latitude!,
              locationProvider.currentLocation!.longitude!,
            ),
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.1,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Order ID: 2342',
            style: TextStyle(
              fontFamily: AppFontsFamily.spaceGrotesk,
              fontSize: AppFontSizes.title,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          CustomRoundedContainer(
            backgroundColor: AppColors.containerGrey.withOpacity(0.5),
            radius: 100,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConfirmationCodeScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.close),
              iconSize: 28,
              color: AppColors.black,
            ),
          ),
        ]),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
              zoom: 15.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            markers: locationProvider.currentLocationMarker != null
                ? {locationProvider.currentLocationMarker!}
                : {},
          ),

          // Location container
          widget.isLate == true
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.5, // Height of container
                    decoration: const BoxDecoration(
                      color: AppColors.RedContainer,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                      child: Text(
                          'We are sorry for the Inconvenience it may cause.',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          )),
                    ),
                  ),
                )
              : Container(),
          // White rounded container on top
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: widget.isLate == true
                  ? screenHeight * 0.50
                  : screenHeight * 0.45, // Height of white container
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Car Reg. No: AED-234',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.small,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            widget.isLate == true
                                ? 'Ops! time is up'
                                : 'Your fuel is on the way!',
                            style: const TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.title1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            widget.isLate == true
                                ? 'It seems like delivery time is up but driver has not arrived yet. You can cancel this request and add a new one.'
                                : 'Your fuel will reach in 15 minutes',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body1,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left icon with orange background
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: widget.isLate == true
                                      ? AppColors.RedColor
                                      : Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Iconsax.gas_station_copy,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              // Horizontal progress bar
                              Expanded(
                                child: LinearProgressIndicator(
                                    value: widget.isLate == true
                                        ? 1.0
                                        : 0.3, // Adjust this value to represent progress (0.0 to 1.0)
                                    color: widget.isLate == true
                                        ? AppColors.RedColor
                                        : AppColors
                                            .primaryColor, // Progress bar color
                                    backgroundColor: AppColors.containerGrey),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Divider(
                            color: AppColors.grey,
                            thickness: 0.5,
                          ),
                          // SizedBox(height: screenHeight * 0.00),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 12,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      const Icon(
                                        Iconsax.star_1,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(width: 5),
                                      RichText(
                                        text: TextSpan(
                                          text: '4.5',
                                          style: TextStyle(
                                            fontFamily:
                                                AppFontsFamily.spaceGrotesk,
                                            fontSize: AppFontSizes.body1,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: ' (23 Orders)',
                                              style: TextStyle(
                                                fontFamily:
                                                    AppFontsFamily.spaceGrotesk,
                                                fontSize: AppFontSizes.body1,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.textFiledHint,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              const Text(
                                'John Doe',
                                style: TextStyle(
                                  // fontFamily: AppFontsFamily.spaceGroteskBold,
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.subtitle1,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.001),
                              Text(
                                '1 Tank | Congas | 30 minutes | Cash',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.grey,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Cost Breakdown',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.spaceGrotesk,
                                    color: AppColors.textFiledHint,
                                    fontSize: AppFontSizes.body1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Icon(
                                  Iconsax.arrow_right_3_copy,
                                  color: AppColors.textFiledHint,
                                  size: 15,
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            const Text(
                              '\$61.00',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.subtitle,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        ActionButton(
                          buttonWidth: screenWidth * 0.5,
                          borderRadius: 30,
                          text: 'Cancel Order',
                          backgroundColor: AppColors.white,
                          textColor: AppColors.RedColor,
                          borderColor: AppColors.RedColor,
                          onPressed: () {
                            _openCancelDrawer(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openCancelDrawer(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Container(
            height: screenHeight * 0.53,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Iconsax.danger,
                    color: Colors.red,
                    size: 50,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Cancel Request?',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Divider(
                    color: AppColors.grey,
                    thickness: 0.5,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  widget.isLate == true
                      ? Text(
                          'We are sorry for the inconvenience it may cause. It seems like the delivery time is up but the driver has not arrived yet. Driver will have to pay a penalty fees.',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            color: AppColors.black,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    'If the rider is already on the way, cancelling may result in ',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Penalty Fee',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.body,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' before your next booking.',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.body,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              'Valid reasons will be reviewed with the driver.',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                  SizedBox(height: screenHeight * 0.02),
                  ActionButton(
                    buttonWidth: screenWidth,
                    borderRadius: 30,
                    text: 'Wait for Driver',
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.white,
                    borderColor: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  ActionButton(
                    buttonWidth: screenWidth,
                    borderRadius: 30,
                    text: 'Cancel Order',
                    backgroundColor: AppColors.white,
                    textColor: AppColors.RedColor,
                    borderColor: AppColors.RedColor,
                    onPressed: () {
                      Navigator.pop(context);
                      _openOrderCancelDrawer(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

// after preewing cancel drawer
  void _openOrderCancelDrawer(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Container(
            height: widget.isLate == true
                ? screenHeight * 0.4
                : screenHeight * 0.36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isLate == true
                        ? 'Driver has Cancelled the Request'
                        : 'Order Cancelled',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Divider(
                    color: AppColors.grey,
                    thickness: 0.5,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  widget.isLate == true
                      ? Text(
                          'We regret to inform you that the driver has cancelled to match you  this ride, We\'re already working another driver nearby.',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            color: AppColors.black,
                          ),
                        )
                      : RichText(
                          text: TextSpan(
                            text:
                                'You have cancelled this order within the delivery time. A ',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body,
                              color: AppColors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Penalty Fee',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.body,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' will apply to your next request along with the standard app fees.',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(height: screenHeight * 0.02),
                  widget.isLate == true
                      ? ActionButton(
                          buttonWidth: screenWidth,
                          borderRadius: 30,
                          text: 'Rate Driver',
                          backgroundColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                          borderColor: AppColors.primaryColor,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RatingScreen(
                                    title: "Rate your experience with Rider"),
                              ),
                            );
                          },
                        )
                      : Container(),
                  SizedBox(height: screenHeight * 0.02),
                  ActionButton(
                    buttonWidth: screenWidth,
                    borderRadius: 30,
                    text: 'Go to Home',
                    backgroundColor: AppColors.white,
                    textColor: AppColors.primaryColor,
                    borderColor: widget.isLate == true
                        ? Colors.transparent
                        : AppColors.primaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
