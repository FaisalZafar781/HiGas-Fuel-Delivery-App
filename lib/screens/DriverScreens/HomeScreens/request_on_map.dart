import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_gas/providers/LocationProvider.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/submit_proposal_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/SearchScreen/search_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/WaitScreen/long_wait_time_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/WaitScreen/wait_time_screen.dart';
import 'package:hi_gas/screens/SideMenuScreens/NotificationScreen/notification_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RequestCard/request_card.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:hi_gas/widgets/UserCard/user_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

import '../../../widgets/SideBar/CustomDrawer.dart';
import '../DiverPayWallScreen/dirver_paywall_screen.dart';
import '../DriverProfessionalDetailScreen/driver_professional_detail_screen.dart';

class RequestOnMap extends StatefulWidget {
  const RequestOnMap({
    super.key,
  });

  @override
  State<RequestOnMap> createState() => _RequestOnMapState();
}

class _RequestOnMapState extends State<RequestOnMap> {
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
                onTap: () {},
                child: Container(
                  height: screenHeight * 0.35, // Height of green container
                  width: screenWidth,
                  padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CustomRoundedContainer(
                          width: 50,
                          height: 7,
                          backgroundColor: AppColors.slate400,
                          radius: 10,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Request Details',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          color: AppColors.black,
                          fontSize: AppFontSizes.title1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                                    Icons.star_rounded,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(width: 5),
                                  RichText(
                                    text: TextSpan(
                                      text: '4.5',
                                      style: TextStyle(
                                        fontFamily: AppFontsFamily.spaceGrotesk,
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
                          SizedBox(height: screenHeight * 0.005),
                          Divider(
                            color: AppColors.grey.withOpacity(0.5),
                            thickness: 1,
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Quantity',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.small,
                                      color: AppColors.textFiledHint,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    '1 Tank',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.body,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              Text(
                                ' | ',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.textFiledHint,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Fuel Brand',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.small,
                                      color: AppColors.textFiledHint,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    'Congas',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.body,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              Text(
                                ' | ',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.textFiledHint,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.small,
                                      color: AppColors.textFiledHint,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    '30 min',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.body,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              Text(
                                ' | ',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.textFiledHint,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Payment',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.small,
                                      color: AppColors.textFiledHint,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    'Cash',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.body,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Divider(
                        color: AppColors.grey.withOpacity(0.5),
                        thickness: 1,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      ActionButton(
                          borderRadius: 30,
                          text: 'Create Proposal',
                          backgroundColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                          borderColor: Colors.transparent,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SubmitProposalScreen(),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),

            // Top icons
            Positioned(
              top: 60,
              right: 16,
              child: CustomRoundedContainer(
                backgroundColor: AppColors.white,
                radius: 100,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  icon: const Icon(Icons.close),
                  iconSize: 28,
                  color: AppColors.black,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.48,
              right: 16,
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    CustomRoundedContainer(
                        padding: EdgeInsets.all(10),
                        backgroundColor: AppColors.white,
                        radius: 100,
                        onTap: () async {},
                        child: Icon(
                          Icons.add,
                          color: AppColors.black,
                        )),
                    const SizedBox(height: 10),
                    CustomRoundedContainer(
                        padding: EdgeInsets.all(10),
                        backgroundColor: AppColors.white,
                        radius: 100,
                        onTap: () async {},
                        child: Icon(
                          Icons.remove,
                          color: AppColors.black,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
