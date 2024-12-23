import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../services/utils/constants/constants.dart';

class NotificationsAlertsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "icon": Iconsax.notification_copy,
      "title": "Code doesn’t match.",
      "description": "Please contact support for this issue.",
      "actionText": "Contact Now",
      "date": "Today",
    },
    {
      "icon": Iconsax.gas_station,
      "title": "Driver arrived",
      "description": "Please add verification code to complete delivery.",
      "actionText": "Enter Verification Code",
      "date": "Today",
    },
    {
      "icon": Iconsax.notification_copy,
      "title": "Bids Received",
      "description": "Please choose what suits you best.",
      "actionText": null,
      "date": "Today",
    },
    {
      "icon": Iconsax.notification_copy,
      "title": "Delivery Completed",
      "description": "Please rate your experience.",
      "actionText": "Add Ratings",
      "date": "11 Sep 2024",
    },
    {
      "icon": Icons.directions_car_outlined,
      "title": "Driver arrived",
      "description": "Please add verification code to complete delivery.",
      "actionText": "Enter Verification Code",
      "date": "11 Sep 2024",
    },
  ];

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Noification &  Alerts",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFontsFamily.spaceGrotesk),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  final isFirstOfDate = index == 0 ||
                      notification["date"] != notifications[index - 1]["date"];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isFirstOfDate) _buildDateHeader(notification["date"]),
                      SizedBox(height: isFirstOfDate ? 16 : 0),
                      _buildNotificationCard(
                        icon: notification["icon"],
                        title: notification["title"],
                        description: notification["description"],
                        actionText: notification["actionText"],
                        onActionPressed: () {},
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.containerBorderColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          date,
          style: TextStyle(
            fontFamily: AppFontsFamily.spaceGrotesk,
            color: AppColors.black,
            fontSize: AppFontSizes.small,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required String title,
    required String description,
    String? actionText,
    VoidCallback? onActionPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.containerBorderColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(4)),
                child: Icon(
                  icon,
                  color: AppColors.white,
                  size: 25,
                ),
              ),
              SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: AppFontsFamily.spaceGrotesk,
                  fontSize: AppFontSizes.subtitle,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontFamily: AppFontsFamily.spaceGrotesk,
                  fontSize: AppFontSizes.body,
                  color: AppColors.description,
                ),
              ),
              if (actionText != null) ...[
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: onActionPressed,
                  child: Text(
                    actionText,
                    style: TextStyle(
                      fontFamily: AppFontsFamily.spaceGrotesk,
                      fontSize: AppFontSizes.body,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
