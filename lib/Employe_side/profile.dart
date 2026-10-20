import 'package:flutter/material.dart';
import 'package:job_portal/User_side/login.dart';

import '../User_side/edit_profile.dart';
import '../references/reference.dart';
import 'homepage.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
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
            style: TextStyle(
              color: greyColor,
              fontSize: 14,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: greyColor),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCompanyHeaderCard(context),

                    const SizedBox(height: 18),

                    _buildBusinessDetailsCard(),

                    const SizedBox(height: 18),

                    _buildAboutCard(),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _showLogoutDialog(context);
                        },
                        icon: Icon(
                          Icons.logout,
                          color: redColor,
                          size: 20,
                        ),
                        label: Text(
                          'Logout',
                          style: TextStyle(
                            color: redColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeHomePage(),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: blueColor,
            ),
          ),

          const SizedBox(width: 5),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Company Profile',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontweight,
                    color: navyColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Verify and update business information',
                  style: TextStyle(
                    fontSize: 11,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: profileSize,
            height: profileSize,
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              'TCS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyHeaderCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: navyColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'TS',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TechSolutions Pvt Ltd',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Enterprise Technology Providers',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Divider(height: 1, color: borderColor),

          const SizedBox(height: 14),

          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blueColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Edit Profile Information',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Business Details',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),

          const SizedBox(height: 14),

          _buildDetailItem(
            title: 'Industry',
            value: 'Information Technology',
          ),

          const SizedBox(height: 10),

          _buildDetailItem(
            title: 'Company Size',
            value: '250-500 Employees',
          ),

          const SizedBox(height: 10),

          _buildDetailItem(
            title: 'Location',
            value: 'Mumbai, Maharashtra',
          ),

          const SizedBox(height: 10),

          _buildDetailItem(
            title: 'Website',
            value: 'www.techsolutions.com',
            valueColor: blueColor,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: greyColor,
          ),
        ),

        const SizedBox(height: 2),

        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: valueColor ?? textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildAboutCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About TechSolutions',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'TechSolutions Pvt Ltd is an enterprise-oriented '
                'consultancy delivering innovative technology '
                'integrations, cognitive processing models, and '
                'modular software layers to international corporate '
                'clients since 2012. Our expertise spans web '
                'architecture, legacy modernization, and deep '
                'database optimization.',
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }
}