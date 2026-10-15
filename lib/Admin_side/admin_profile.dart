
import 'package:flutter/material.dart';

import '../User_side/login.dart';
import '../references/reference.dart';
import 'edit_profile.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'Logout',
          style: TextStyle(
            color: textColor,
            fontWeight: fontweight,
          ),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: greyColor),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: greyColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: redColor,
              elevation: 0,
            ),
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: textColor,
            fontWeight: fontweight,
            fontSize: fontSize,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: textColor,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              top: 8,
              bottom: 8,
            ),
            child: CircleAvatar(
              backgroundColor: avatarColor,
              child: const Text(
                'SA',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Identity Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: avatarColor,
                    child: const Text(
                      'SK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Suresh Kumar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: fontweight,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    'Super Admin • HireHub HQ',
                    style: TextStyle(
                      fontSize: 14,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Personal Details Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: fontweight,
                      color: textColor,
                    ),
                  ),

                  Divider(
                    height: 24,
                    thickness: 1,
                    color: borderColor,
                  ),

                  _buildDetailItem(
                    'EMAIL ADDRESS',
                    'suresh.kumar@hirehub.com',
                  ),

                  const SizedBox(height: 16),

                  _buildDetailItem(
                    'PHONE NUMBER',
                    '+91 98765 43210',
                  ),

                  const SizedBox(height: 16),

                  _buildDetailItem(
                    'ROLE TIER',
                    'Super Administrator',
                  ),

                  const SizedBox(height: 16),

                  _buildDetailItem(
                    'JOINED ON',
                    'January 15, 2023',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Edit Profile Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(),
                    ),
                  );
                },
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Logout Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: redColor,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: redColor,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: redColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: greyColor,
            letterSpacing: 0.5,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
