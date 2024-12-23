import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hi_gas/screens/HomeScreensFlow/HomeScreen/home_screen.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FuelPermitScreen extends StatefulWidget {
  const FuelPermitScreen({
    super.key,
  });

  @override
  State<FuelPermitScreen> createState() => _FuelPermitScreenState();
}

class _FuelPermitScreenState extends State<FuelPermitScreen> {
  XFile? frontSideImage;

  Future<void> requestPermissions() async {
    if (await Permission.camera.isDenied || await Permission.photos.isDenied) {
      PermissionStatus statusCamera = await Permission.camera.request();
      PermissionStatus statusPhotos = await Permission.photos.request();

      if (!statusCamera.isGranted || !statusPhotos.isGranted) {}
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        frontSideImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Fuel Permit",
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    color: AppColors.text,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Upload the permit from government to deliver fuel',
                  style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body1,
                      color: AppColors.description,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              const Text(
                'Permit Document',
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.body,
                    color: AppColors.text,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 13),
              frontSideImage != null
                  ? CustomRoundedContainer(
                      backgroundColor: AppColors.buttonFilled,
                      radius: 40,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.file(
                              File(frontSideImage!.path),
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: 180,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 20,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  frontSideImage =
                                      null; // Clear the selected image
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  Iconsax.trash_copy,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : // Front Side Container
                  CustomRoundedContainer(
                      height: 180,
                      onTap: () async {
                        await requestPermissions();
                        _pickImage();
                      },
                      // padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      backgroundColor: AppColors.buttonFilled,
                      radius: 40,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_upload_outlined),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              'Upload or Take photo',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppFontsFamily.spaceGrotesk,
                                fontSize: AppFontSizes.body,
                                color: AppColors.description,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          Text(
              'Please take clear image, it should not have any glare or shine over it.',
              style: TextStyle(
                  fontFamily: AppFontsFamily.spaceGrotesk,
                  fontSize: AppFontSizes.body1,
                  color: AppColors.description,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
