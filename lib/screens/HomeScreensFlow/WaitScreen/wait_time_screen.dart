import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_gas/providers/LocationProvider.dart';
import 'package:hi_gas/screens/HomeScreensFlow/SearchScreen/search_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/DriverCard/driver_card.dart';
import 'package:hi_gas/widgets/RequestCard/request_card.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class WaitScreen extends StatefulWidget {
  const WaitScreen({super.key});

  @override
  State<WaitScreen> createState() => _WaitScreenState();
}

class _WaitScreenState extends State<WaitScreen> {
  late GoogleMapController _mapController;
  @override
  void initState() {
    super.initState();

    // Get the user's current location and move to it
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locationProvider =
          Provider.of<LocationProvider>(context, listen: false);

      _moveToCurrentLocation(locationProvider);
    });
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

          // White rounded container on top
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.42, // Height of white container
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
                        const EdgeInsets.only(left: 15, top: 20, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.search),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'We\'re collecting bids for your fuel request.',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.title1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'Hang tight! We are connecting you with the nearby drivers to fulfil your request.',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            color: AppColors.black.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomRoundedContainer(
                          onTap: () {
                            _openDriverListDrawer(context);
                          },
                          borderColor: AppColors.customBorder,
                          showBorder: true,
                          backgroundColor: AppColors.textFiledColor,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.57,
                                    child: Text(
                                      'Home - 23 Main St, New York, NY',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: AppFontsFamily.spaceGrotesk,
                                        fontSize: AppFontSizes.subtitle1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: screenWidth * 0.04,
                                  // ),
                                  Spacer(),
                                  Text(
                                    '\$12.80/tank',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.spaceGrotesk,
                                      fontSize: AppFontSizes.body,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '1 Tank | Congas | 30 minutes',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.body1,
                                  color: AppColors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        ActionButton(
                            text: 'Cancel',
                            backgroundColor: AppColors.white,
                            textColor: AppColors.CancelRed,
                            borderColor: AppColors.CancelRed,
                            borderRadius: 30,
                            onPressed: () {})
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Top icons
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomRoundedContainer(
                    backgroundColor: AppColors.white,
                    radius: 100,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                      iconSize: 28,
                      color: AppColors.black,
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

  void _openDriverListDrawer(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.9, // Start with almost full height
            minChildSize: 0.5, // Minimum height (half screen)
            maxChildSize: 0.9, // Maximum height (almost full screen)
            builder: (context, ScrollController) {
              return Container(
                height: screenHeight *
                    0.92, // Ensure the drawer takes up most of the screen
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Drawer handle for closing the drawer
                    Center(
                      child: Container(
                        height: 6,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(
                              0.6), // Slight transparency for the handle
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Driver',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.title1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body1,
                            color: AppColors.textFiledHint,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'Terminal 1 Berlin Brandenburg Airport Melli-Beese-Rirg',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.subtitle1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Content to be scrolled
                    DriverCard(),
                  ],
                ),
              );
            });
      },
    );
  }
}
