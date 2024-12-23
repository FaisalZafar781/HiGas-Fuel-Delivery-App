import 'package:flutter/material.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';

import '../../widgets/UserRequestCard/RequestCard.dart';

class RequestHistory extends StatelessWidget {
  const RequestHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 20),
             Text(
              "Request History",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: AppFontsFamily.spaceGrotesk
              ),
            ),
             SizedBox(height: 20),

            // Section for November 2024
            const Text(
              "Nov 2024",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: AppFontsFamily.spaceGrotesk),
            ),
            const SizedBox(height: 10),
            const UserRequestCard(
              userName: "John Doe",
              rating: "4.5",
              rated: true,
              price: "\$61.00",
              details: "1 Tank  |  Congas  |  30 minutes",
            ),
            const SizedBox(height: 10),
            const UserRequestCard(
              userName: "John Doe",
              rating: "4.5",
              rated: false,
              price: "\$61.00",
              details: "1 Tank  |  Congas  |  30 minutes",
            ),
             SizedBox(height: 20),

            // Section for October 2024
             Text(
              "Oct 2024",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,  fontFamily: AppFontsFamily.spaceGrotesk),
            ),
             SizedBox(height: 10),
             UserRequestCard(
              userName: "John Doe",
              rating: "4.5",
              rated: true,
              price: "\$61.00",
              details: "1 Tank  |  Congas  |  30 minutes",
            ),
          ],
        ),
      ),
    );
  }
}
