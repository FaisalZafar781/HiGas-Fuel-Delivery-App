import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_gas/providers/LocationProvider.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/request_on_map.dart';
import 'package:hi_gas/screens/HomeScreensFlow/OrderAcceptedScreen/rate_rider_screen.dart';
import 'package:hi_gas/screens/SideMenuScreens/NotificationScreen/notification_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:hi_gas/widgets/UserCard/user_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../../widgets/LocationToogleWiget/location_toggle_widget.dart';
import '../../../widgets/SideBar/CustomDrawer.dart';

class DriverHomeScreen extends StatefulWidget {
  final bool isDriver;
  const DriverHomeScreen({super.key, required this.isDriver});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
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
      resizeToAvoidBottomInset: false,
      drawer: CustomDrawer(isDriver: widget.isDriver),
      body: Builder(
        builder: (context) => Stack(
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

            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  // proposalNotAccept(context, screenHeight, screenWidth);
                  //   rideCancel(context, screenHeight, screenWidth);
                  locationProvider.isLocationEnabled == true
                      ? _openBookingsDrawer(context, false)
                      : () async {
                          await locationProvider.getCurrentLocation(context);
                          _moveToCurrentLocation(locationProvider);
                        };
                },
                child: Container(
                  height: screenHeight * 0.07, // Height of green container
                  width: screenWidth,
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  decoration: locationProvider.isLocationEnabled == true
                      ? const BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        )
                      : const BoxDecoration(
                          color: AppColors.slate400,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                  child: Text(
                      locationProvider.isLocationEnabled == true
                          ? 'Accepting Bookings'
                          : 'You are offline',
                      style: const TextStyle(
                        fontFamily: AppFontsFamily.spaceGrotesk,
                        color: Colors.white,
                        fontSize: AppFontSizes.subtitle1,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),

            // Top icons
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRoundedContainer(
                      backgroundColor: AppColors.white,
                      radius: 100,
                      child: IconButton(
                        onPressed: () {
                          // Now the drawer will open
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(Iconsax.menu_1_copy),
                        iconSize: 28,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    CustomRoundedContainer(
                      backgroundColor: AppColors.white,
                      radius: 100,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NotificationsAlertsScreen(),
                              ));
                        },
                        icon: const Icon(Iconsax.notification_copy),
                        iconSize: 28,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            LocationToggleWidget(),
          ],
        ),
      ),
    );
  }

  void _openBookingsDrawer(BuildContext context, bool isOffline) {
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: screenHeight * 0.93, // Adjust modal height
          decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section with title
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
                child: Text(
                  'Accepting Bookings',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    color: Colors.white,
                    fontSize: AppFontSizes.subtitle1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Main content with scroll
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CustomRoundedContainer(
                                width: 60,
                                height: 5,
                                backgroundColor: AppColors.lighyGreyColor1,
                                radius: 10,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            const Text(
                              'Requests',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.title1,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            // User card
                            UserCard(
                              count: 10,
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RequestOnMap(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Floating widget
                    isOffline == false
                        ? Container()
                        : Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: CustomRoundedContainer(
                              onTap: () {
                                Navigator.pop(context);
                                proposalNotAccept(
                                    context, screenHeight, screenWidth);
                              },
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              backgroundColor: AppColors.slate700,
                              radius: 30,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Offer Expired",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontFamily: AppFontsFamily.spaceGrotesk,
                                        fontSize: AppFontSizes.subtitle1),
                                  ),
                                  Text(
                                    "Send Again",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.body,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  proposalNotAccept(
      BuildContext context, double screenHeight, double screenWidth) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  rideCancel(context, screenHeight, screenWidth);
                },
                child: Container(
                  height: screenHeight * 0.3, // Height of green container
                  width: screenWidth,
                  padding: const EdgeInsets.only(
                      left: 20, top: 15, right: 20, bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Proposal not accepted',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.title,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'We’re sorry, but the customer didnt accepted your proposal. You’ll be notified of new ride opportunities soon.',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.body,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Divider(
                        color: AppColors.greyText?.withOpacity(0.5),
                        thickness: 1,
                      ),
                      ActionButton(
                        text: "Go Back to Home",
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        borderColor: AppColors.primaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        borderRadius: 30,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  rideCancel(BuildContext context, double screenHeight, double screenWidth) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: screenHeight * 0.36, // Height of green container
                  width: screenWidth,
                  padding: const EdgeInsets.only(
                      left: 20, top: 15, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The customer has cancelled the ride.',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.title1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'We’re sorry, but the customer decided to cancel their request. You’ll be notified of new ride opportunities soon.',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.body,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Divider(
                        color: AppColors.greyText?.withOpacity(0.5),
                        thickness: 0.5,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      ActionButton(
                        text: "Rate Customer",
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        borderColor: AppColors.primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RatingScreen(
                                title: "Rate Customer",
                                isDriver: true,
                              ),
                            ),
                          );
                        },
                        borderRadius: 25,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Center(
                              child: Text(
                            "Go to Home",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFontSizes.body,
                              fontFamily: AppFontsFamily.spaceGrotesk,
                            ),
                          ))),
                      SizedBox(height: screenHeight * 0.005),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
