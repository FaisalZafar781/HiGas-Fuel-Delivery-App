import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_gas/providers/LocationProvider.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:provider/provider.dart';

class LongWaitTimeScreen extends StatefulWidget {
  final bool? isFind;
  final bool? isAccepted;
  const LongWaitTimeScreen({
    super.key,
    this.isFind = false,
    this.isAccepted = false,
  });

  @override
  State<LongWaitTimeScreen> createState() => _LongWaitTimeScreenState();
}

class _LongWaitTimeScreenState extends State<LongWaitTimeScreen> {
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
          // Background grey container
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth,
              height: widget.isFind!
                  ? screenHeight * 0.50
                  : screenHeight * 0.50, // Height of container
              decoration: BoxDecoration(
                color: widget.isFind!
                    ? AppColors.greenContainer
                    : AppColors.containerBorderColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: widget.isFind!
                    ? Text(
                        'ETA: ~50 Secs',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.body,
                          color: AppColors.black.withOpacity(0.7),
                        ),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.6,
                            child: Text(
                              (widget.isAccepted ?? false)
                                  ? 'Try again or adjust your location for better results.'
                                  : 'Modify your prefrences and try again.',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body,
                                color: AppColors.black.withOpacity(0.7),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Edit Location',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontSize: AppFontSizes.body1,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          // White rounded container on top
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: widget.isFind!
                  ? screenHeight * 0.45
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
                        const EdgeInsets.only(left: 15, top: 10, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.isFind! ? Icon(Icons.search) : Container(),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          (widget.isFind ?? false)
                              ? 'We\'re collecting bids for your fuel request.'
                              : (widget.isAccepted ?? false)
                                  ? 'No Drivers in the Area'
                                  : 'Ops! Seems like no driver is accepting your request.',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.title1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          (widget.isFind ?? false)
                              ? 'Hang tight! We are connecting you with the nearby drivers to fulfil your request.'
                              : (widget.isAccepted ?? false)
                                  ? 'No drivers are available in your area at the moment. We\'re expanding our coverage and will notify you when drivers become available.'
                                  : 'Consider adjusting your delivery preferences to increase your chances.',
                          style: TextStyle(
                            fontFamily: AppFontsFamily.spaceGrotesk,
                            fontSize: AppFontSizes.body,
                            color: AppColors.black.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomRoundedContainer(
                          radius: 15,
                          onTap: () {},
                          borderColor: AppColors.customBorder,
                          showBorder: true,
                          backgroundColor: AppColors.textFiledColor,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Priority Mode: Normal',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.spaceGrotesk,
                                  fontSize: AppFontSizes.body1,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
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
                            text: 'Cancel Request',
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
}
