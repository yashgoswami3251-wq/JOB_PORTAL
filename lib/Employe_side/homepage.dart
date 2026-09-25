import 'package:flutter/material.dart';
import 'package:job_portal/Employe_side/post_new_job.dart';
import 'package:job_portal/Employe_side/profile.dart';
import '../User_side/login.dart';
import '../references/reference.dart';
import 'application.dart';
import 'my_job_posting.dart';

class EmployeeHomePage extends StatefulWidget {
  const EmployeeHomePage({super.key});

  @override
  State<EmployeeHomePage> createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {
  int selectedIndex = 0;

  // ---------------------------------------------------------
  // Dashboard Data
  // ---------------------------------------------------------

  final List<Map<String, dynamic>> dashboardStats = [
    {
      'title': 'Posted Jobs',
      'value': '12',
      'icon': Icons.business_center_outlined,
      'iconColor': Colors.blue,
      'bgColor': Color(0xFFEAF2FF),
    },
    {
      'title': 'Active Jobs',
      'value': '8',
      'icon': Icons.play_arrow_rounded,
      'iconColor': Colors.green,
      'bgColor': Color(0xFFEAFBF3),
    },
    {
      'title': 'Total Apps',
      'value': '156',
      'icon': Icons.description_outlined,
      'iconColor': Colors.orange,
      'bgColor': Color(0xFFFFF5E8),
    },
    {
      'title': 'Shortlisted',
      'value': '23',
      'icon': Icons.star_border_rounded,
      'iconColor': Colors.red,
      'bgColor': Color(0xFFFFEEEE),
    },
  ];

  // ---------------------------------------------------------
  // Bottom Navigation Pages
  // ---------------------------------------------------------

  Widget getCurrentPage() {
    switch (selectedIndex) {
      case 0:
        return _buildDashboard();

      case 1:
        return PostNewJobPage();

      case 2:
        return MyJobPostingsPage();

      case 3:
        return ApplicationPage();

      case 4:
        return CompanyProfilePage();

      default:
        return _buildDashboard();
    }
  }

  // ---------------------------------------------------------
  // Main Dashboard
  // ---------------------------------------------------------

  Widget _buildDashboard() {
    return SafeArea(
      child: Column(
        children: [
          _buildHeader(),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatistics(),

                  const SizedBox(height: 18),

                  _buildQuickActions(),

                  const SizedBox(height: 18),

                  _buildRecentUpdates(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // Header
  // ---------------------------------------------------------

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HireHub Portal',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontweight,
                    color: navyColor,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  'Welcome back, TCS Recruiter',
                  style: TextStyle(
                    fontSize: 11,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),

          // Notification
          IconButton(
            onPressed: () {
              _showMessage('No new notifications');
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            icon: Icon(
              Icons.notifications_none_rounded,
              color: navyColor,
              size: 24,
            ),
          ),

          const SizedBox(width: 4),

          // Profile Avatar
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 4;
              });
            },
            child: Container(
              width: 38,
              height: 38,
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
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // Statistics Cards
  // ---------------------------------------------------------

  Widget _buildStatistics() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dashboardStats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.95,
      ),
      itemBuilder: (context, index) {
        final item = dashboardStats[index];

        return _buildStatCard(
          title: item['title'],
          value: item['value'],
          icon: item['icon'],
          iconColor: item['iconColor'],
          bgColor: item['bgColor'],
        );
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: borderColor,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 19,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.5,
                    color: greyColor,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  value,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: navyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // Quick Actions
  // ---------------------------------------------------------

  Widget _buildQuickActions() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: navyColor,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PostNewJobPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Post New Job',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: SizedBox(
                  height: 35,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: blueColor,
                      side: BorderSide(
                        color: blueColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'View Applications',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // Recent Updates
  // ---------------------------------------------------------

  Widget _buildRecentUpdates() {
    return Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.fromLTRB(13, 13, 13, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Updates',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: navyColor,
            ),
          ),

          const SizedBox(height: 7),

          _buildUpdateItem(
            title:
            'New candidate Arjun Mehta applied for Senior React Developer',
            time: '12 mins ago',
            showDivider: true,
          ),

          _buildUpdateItem(
            title:
            'Scheduled interview with Deepika Nair for UI/UX Designer',
            time: '1 hour ago',
            showDivider: true,
          ),

          _buildUpdateItem(
            title:
            'You shortlisted Rahul Verma for Lead Developer',
            time: '3 hours ago',
            showDivider: false,
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateItem({
    required String title,
    required String time,
    required bool showDivider,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 9),
      decoration: showDivider
          ? BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 11.5,
              color: navyColor,
              height: 1.25,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            time,
            style: TextStyle(
              fontSize: 9.5,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // Other Pages
  // ---------------------------------------------------------

  Widget _simplePage({
    required String title,
    required IconData icon,
  }) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: borderColor,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontweight,
                  color: navyColor,
                ),
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 55,
                    color: iconColor,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: navyColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    '$title page',
                    style: TextStyle(
                      fontSize: 13,
                      color: greyColor,
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

  // ---------------------------------------------------------
  // Bottom Navigation
  // ---------------------------------------------------------

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: bottomColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                index: 0,
                icon: Icons.home_outlined,
                activeIcon: Icons.home_rounded,
                label: 'Dashboard',
              ),

              _buildNavItem(
                index: 1,
                icon: Icons.add_circle_outline,
                activeIcon: Icons.add_circle,
                label: 'Post Job',
              ),

              _buildNavItem(
                index: 2,
                icon: Icons.business_center_outlined,
                activeIcon: Icons.business_center,
                label: 'My Jobs',
              ),

              _buildNavItem(
                index: 3,
                icon: Icons.people_outline,
                activeIcon: Icons.people,
                label: 'Applications',
              ),

              _buildNavItem(
                index: 4,
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? avatarColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                isSelected ? activeIcon : icon,
                color: Colors.white,
                size: 19,
              ),
            ),

            const SizedBox(height: 2),

            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8.5,
                fontWeight:
                isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  // Message
  // ---------------------------------------------------------

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // ---------------------------------------------------------
  // Build
  // ---------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // Current selected page
      body: getCurrentPage(),

      // Employee Panel Bottom Navigation
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}