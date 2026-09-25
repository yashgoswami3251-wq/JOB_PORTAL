import 'package:flutter/material.dart';
import 'package:job_portal/Employe_side/settings.dart';
import '../User_side/edit_profile.dart';
import '../User_side/settings_page.dart';
import '../references/reference.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // ============================================================
            // APP BAR
            // ============================================================
            _buildHeader(context),

            // ============================================================
            // PROFILE CONTENT
            // ============================================================
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company Profile Card
                    _buildCompanyHeaderCard(context),

                    const SizedBox(height: 18),

                    // Business Details
                    _buildBusinessDetailsCard(),

                    const SizedBox(height: 18),

                    // About Company
                    _buildAboutCard(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==============================================================
  // HEADER
  // ==============================================================

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
          // ----------------------------------------------------------
          // TITLE
          // ----------------------------------------------------------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Company Profile',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontweight,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Verify and update business information',
                  style: TextStyle(
                    fontSize: 12,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),

          // ----------------------------------------------------------
          // SETTINGS BUTTON
          // ----------------------------------------------------------
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Add setting page path
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EmpSettingsPage()));
              },
              icon: const Icon(
                Icons.settings_outlined,
                size: 21,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==============================================================
  // COMPANY HEADER CARD
  // ==============================================================

  Widget _buildCompanyHeaderCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
        ),
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
          // ----------------------------------------------------------
          // COMPANY INFORMATION
          // ----------------------------------------------------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Company Logo
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

              // Company Name
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

          // Divider
          Divider(
            height: 1,
            color: borderColor,
          ),

          const SizedBox(height: 14),

          // ----------------------------------------------------------
          // EDIT PROFILE BUTTON
          // ----------------------------------------------------------
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed: () {
                // Add edit Profile page
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePage()));
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

  // ==============================================================
  // BUSINESS DETAILS CARD
  // ==============================================================

  Widget _buildBusinessDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----------------------------------------------------------
          // CARD TITLE
          // ----------------------------------------------------------
          Text(
            'Business Details',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),

          const SizedBox(height: 14),

          // Industry
          _buildDetailItem(
            title: 'Industry',
            value: 'Information Technology',
          ),

          const SizedBox(height: 10),

          // Company Size
          _buildDetailItem(
            title: 'Company Size',
            value: '250-500 Employees',
          ),

          const SizedBox(height: 10),

          // Location
          _buildDetailItem(
            title: 'Location',
            value: 'Mumbai, Maharashtra',
          ),

          const SizedBox(height: 10),

          // Website
          _buildDetailItem(
            title: 'Website',
            value: 'www.techsolutions.com',
            valueColor: blueColor,
          ),
        ],
      ),
    );
  }

  // ==============================================================
  // DETAIL ITEM
  // ==============================================================

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

  // ==============================================================
  // ABOUT COMPANY CARD
  // ==============================================================

  Widget _buildAboutCard() {
    return Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----------------------------------------------------------
          // TITLE
          // ----------------------------------------------------------
          Text(
            'About TechSolutions',
            style: TextStyle(
              fontSize: 15  ,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),

          const SizedBox(height: 10),

          // ----------------------------------------------------------
          // DESCRIPTION
          // ----------------------------------------------------------
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