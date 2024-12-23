import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_gas/providers/LocationProvider.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/driver_verification_code_screen.dart';
import 'package:hi_gas/screens/DriverScreens/HomeScreens/submit_proposal_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/FuelDeliveryTimer/fuel_delivery_timer.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:provider/provider.dart';
import '../../../widgets/DestinationBottomSheet/destinationBottomSheet.dart';

class RequestWithTimerMapScreen extends StatefulWidget {
  const RequestWithTimerMapScreen({
    super.key,
  });

  @override
  State<RequestWithTimerMapScreen> createState() =>
      _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestWithTimerMapScreen> {
  bool isLocationEnabled = false;
  late GoogleMapController _mapController;
  @override
  void initState() {
    super.initState();

    Geolocator.getServiceStatusStream().listen((status) {
      setState(() {
        isLocationEnabled = status == ServiceStatus.enabled;
      });
    });

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
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              markers: locationProvider.currentLocationMarker != null
                  ? {locationProvider.currentLocationMarker!}
                  : {},
            ),
            DestinationBottomSheet(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              driveToDestinationText: 'Drive to ride destination',
              userName: 'John Doe',
              startPointText: 'Terminal I Berlin Brandenburg Airpor... (You)',
              endPointText: 'Schoenfeld Berlin Central Station',
              instructionText:
                  'Mark arrived once you reach your customer destination.',
              buttonText: 'Mark Arrived',
              onMarkArrived: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DriverVerificationCodeScreen(),
                  ),
                );
              },
            ),
            const Positioned(
                top: 60,
                left: 16,
                right: 16,
                child: FuelDeliveryTimer(
                  deliverMessage: "Please deliver fuel on time.",
                  cancelRideText: "Cancel Ride",
                  timerText: "29:56",
                  amountMessage: "Amount to be collected.",
                  costBreakdownText: "Cost Breakdown",
                  amountText: "\$61.23",
                )),
            Positioned(
              top: screenHeight * 0.58,
              left: 16,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CustomRoundedContainer(
                    padding: const EdgeInsets.all(12),
                    backgroundColor: AppColors.white,
                    radius: 100,
                    child: const Column(
                      children: [
                        Text(
                          "Get Directions",
                          style: TextStyle(
                              fontSize: AppFontSizes.subtitle1,
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ),
            ),
            Positioned(
              top: screenHeight * 0.52,
              right: 16,
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
          ],
        ),
      ),
    );
  }
}
