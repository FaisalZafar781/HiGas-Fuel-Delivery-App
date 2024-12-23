import 'package:flutter/material.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';

import '../../services/utils/constants/constants.dart';

class TermScreen extends StatelessWidget {
  const TermScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRoundedContainer(
                onTap: () => Navigator.pop(context),
                radius: 100,
                padding: EdgeInsets.all(8),
                backgroundColor: AppColors.containerBorderColor,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Terms & Conditions',
                style: TextStyle(
                    fontFamily: AppFontsFamily.spaceGrotesk,
                    fontSize: AppFontSizes.title,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    '''Lorem ipsum dolor sit amet consectetur adipiscing elit nisi sociis, lacus eu natoque posuere tristique primis himenaeos habitasse sem potenti, ultrices taciti luctus nisl dictum in fames cursus. Aenean fusce quisque ad pulvinar et placerat metus odio luctus congue, platea augue penatibus molestie.

Quam per sagittis velit hac viverra, natoque tempor torquent magna etiam inceptos aptent aliquam ultricies. At justo odio class lacus mus duis vivamus purus, sociosqu metus placerat facilisis molestie vestibulum habitasse, velit sagittis cubilia sem ligula vel primis dui, iaculis porta blandit morbi torquent commodo.

Quam per sagittis velit hac viverra, natoque tempor torquent magna etiam inceptos aptent aliquam ultricies. At justo odio class lacus mus duis vivamus purus, sociosqu metus placerat facilisis molestie vestibulum habitasse, velit sagittis cubilia sem ligula vel primis dui, iaculis porta blandit morbi torquent commodo.

Quam per sagittis velit hac viverra, natoque tempor torquent magna etiam inceptos aptent aliquam ultricies. At justo odio class lacus mus duis vivamus purus, sociosqu metus placerat facilisis molestie vestibulum habitasse, velit sagittis cubilia sem ligula vel primis dui, iaculis porta blandit morbi torquent commodo.

Blandit erat fringilla commodo pretium dictumst id consequat integer parturient, lacinia augue massa tempor curae non aliquet gravida hac vivamus, nisi himenaeos habitasse iaculis suscipit purus dui ligula. Parturient cursus conubia convallis lectus euismod nullam metus dignissim sed posuere, non mi leo egestas potenti facilisis cubilia tortor eros, libero sagittis nunc congue arcu porttitor lacus.''',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
