import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_gas/providers/FuelRequestProvider.dart';
import 'package:hi_gas/providers/LocationProvider.dart';
import 'package:hi_gas/screens/HomeScreensFlow/FuelRequestForm/fuel_request_form.dart';
import 'package:hi_gas/screens/HomeScreensFlow/SearchScreen/search_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/WaitScreen/long_wait_time_screen.dart';
import 'package:hi_gas/screens/HomeScreensFlow/WaitScreen/wait_time_screen.dart';
import 'package:hi_gas/screens/SideMenuScreens/NotificationScreen/notification_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RequestCard/request_card.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../../widgets/SideBar/CustomDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    final fuelRequestProvider =
        Provider.of<FuelRequestProvider>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const CustomDrawer(),
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
            isLocationEnabled == false
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.53, // Height of container
                      decoration: BoxDecoration(
                        color: AppColors.containerGrey,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            // White rounded container on top
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHeight * 0.45, // Height of white container
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: AppFontSizes.title1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          CustomField(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchScreen(
                                    isLocationOn: isLocationEnabled,
                                  ),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(5),
                            borderColor: AppColors.black,
                            controller: fuelRequestProvider.locationController,
                            hintText: 'Where you want to get fuel delivered?',
                            keyboardType: TextInputType.text,
                            prefixIcon:
                                const Icon(Iconsax.search_normal_1_copy),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your location';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          ActionButton(
                            text: 'Create New Request',
                            borderRadius: 25,
                            backgroundColor: AppColors.primaryColor,
                            textColor: AppColors.white,
                            borderColor: Colors.transparent,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FuelRequestForm(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Divider
                    Divider(
                      color: AppColors.lighyGreyColor1,
                      thickness: 0.8,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Recent Requests',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: AppFontSizes.subtitle,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // ListView.builder for recent requests
                    const RequestCard(),
                  ],
                ),
              ),
            ),
            // Content inside the primary container
            isLocationEnabled == true
                ? const SizedBox()
                : Positioned(
                    bottom: screenHeight * 0.46 + 6,
                    left: 20,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Column with text on the left
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Location',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                color: AppColors.grey,
                                fontSize: AppFontSizes.body1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Location access is off',
                              style: TextStyle(
                                fontSize: AppFontSizes.subtitle1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Action button on the right
                        SizedBox(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.05,
                          child: ActionButton(
                            borderRadius: 25,
                            text: 'Turn on',
                            backgroundColor: AppColors.white,
                            textColor: AppColors.black,
                            fontweight: FontWeight.bold,
                            borderColor: AppColors.white,
                            onPressed: () {
                              final locationProvider =
                                  Provider.of<LocationProvider>(context,
                                      listen: false);

                              // Update isLocationEnabled immediately
                              isLocationEnabled = true;

                              // Request location access and handle completion
                              locationProvider
                                  .getCurrentLocation(context)
                                  .then((_) {
                                // Any additional actions after location is fetched
                                _moveToCurrentLocation(locationProvider);
                              }).catchError((error) {
                                // Handle errors and reset if needed
                                isLocationEnabled = false;
                              });
                            },
                          ),
                        )
                      ],
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
            Positioned(
              top: isLocationEnabled == true
                  ? screenHeight * 0.47
                  : screenHeight * 0.40,
              right: 16,
              child: Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () async {
                    await locationProvider.getCurrentLocation(context);
                    _moveToCurrentLocation(locationProvider);
                  },
                  child: Icon(
                    isLocationEnabled == true
                        ? Icons.my_location_rounded
                        : Icons.location_disabled_outlined,
                    color: isLocationEnabled == true
                        ? AppColors.IconColors
                        : AppColors.CancelRed,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
