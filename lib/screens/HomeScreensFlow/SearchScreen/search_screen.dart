import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hi_gas/providers/FuelRequestProvider.dart';
import 'package:hi_gas/providers/LocationProvider.dart';
import 'package:hi_gas/screens/HomeScreensFlow/FuelRequestForm/fuel_request_form.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  final bool isLocationOn;
  const SearchScreen({
    super.key,
    required this.isLocationOn,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late bool isLocationOn; // Initialize based on widget.isLocationOn
  TextEditingController _searchController = TextEditingController();
  late GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    isLocationOn = widget.isLocationOn; // Initialize from the passed value

    // Monitor location services status
    Geolocator.getServiceStatusStream().listen((status) {
      setState(() {
        isLocationOn = status == ServiceStatus.enabled;
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
      isLocationOn = isServiceEnabled;
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
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.06,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomRoundedContainer(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.all(8),
                    radius: 100,
                    backgroundColor: AppColors.textFiledColor,
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.black,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomField(
                      height: screenHeight * 0.05,
                      borderRadius: BorderRadius.circular(25),
                      controller: fuelRequestProvider.locationController,
                      hintText: 'Search location',
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(Iconsax.search_normal_1_copy),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your location';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Recent Searches',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: AppFontSizes.subtitle,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFontsFamily.spaceGrotesk),
            ),
            // const SizedBox(height: 10),

            // Search tile card
            const _searchTile(
              count: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
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
                      Text(
                        isLocationOn
                            ? '123, Melli-Beese-Rirg'
                            : 'Location access is off',
                        style: const TextStyle(
                          fontFamily: AppFontsFamily.spaceGrotesk,
                          fontSize: AppFontSizes.subtitle1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Action button on the right
                  isLocationOn
                      ? SizedBox(
                          width: screenWidth * 0.23,
                          height: screenHeight * 0.055,
                          child: ActionButton(
                            borderRadius: 25,
                            text: 'Use this',
                            backgroundColor: AppColors.containerBorderColor,
                            textColor: AppColors.black,
                            fontweight: FontWeight.bold,
                            borderColor: AppColors.white,
                            onPressed: () {
                              fuelRequestProvider.locationController.text =
                                  '123 Main St, New York, NY';
                            },
                          ),
                        )
                      : // Action button on the right
                      SizedBox(
                          width: screenWidth * 0.23,
                          height: screenHeight * 0.055,
                          child: ActionButton(
                            borderRadius: 25,
                            text: 'Turn on',
                            backgroundColor: AppColors.containerBorderColor,
                            textColor: AppColors.black,
                            fontweight: FontWeight.bold,
                            borderColor: AppColors.white,
                            onPressed: () async {
                              final locationProvider =
                                  Provider.of<LocationProvider>(context,
                                      listen: false);

                              try {
                                await locationProvider
                                    .getCurrentLocation(context);
                                setState(() {
                                  isLocationOn = true;
                                });
                                _moveToCurrentLocation(locationProvider);
                              } catch (error) {
                                print(error);
                              }
                            },
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _searchTile extends StatelessWidget {
  final int count;

  const _searchTile({
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FuelRequestForm(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 20,
                        color: AppColors.IconColors,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '123 Main St, New York, NY',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              color: AppColors.black,
                              fontSize: AppFontSizes.body,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'New York',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.spaceGrotesk,
                              color: AppColors.textFiledHint,
                              fontSize: AppFontSizes.body1,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.containerGrey,
                    thickness: 0.8,
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
