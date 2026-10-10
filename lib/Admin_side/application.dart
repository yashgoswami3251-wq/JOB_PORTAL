import 'package:flutter/material.dart';

import 'application_detail.dart';


class AppsPage extends StatefulWidget {
  const AppsPage({Key? key}) : super(key: key);

  @override
  State<AppsPage> createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {
  String selectedFilter = 'All';

  final List<Map<String, dynamic>> applications = [
    {
      'name': 'Amit Patel',
      'role': 'Senior React Developer',
      'initials': 'AP',
      'status': 'Pending',
      'date': 'Jan 24, 2024',
      'email': 'amit.patel@email.com',
      'phone': '+91 98765 43210',
      'resumeName': 'Amit_Patel_Resume.pdf',
      'resumeSize': 'PDF • 1.4 MB',
    },
    {
      'name': 'Sneha Reddy',
      'role': 'UI/UX Designer',
      'initials': 'SR',
      'status': 'Reviewed',
      'date': 'Jan 25, 2024',
      'email': 'sneha.reddy@email.com',
      'phone': '+91 98766 54321',
      'resumeName': 'Sneha_Reddy_Resume.pdf',
      'resumeSize': 'PDF • 2.1 MB',
    },
    {
      'name': 'Vikram Singh',
      'role': 'Marketing Manager',
      'initials': 'VS',
      'status': 'Rejected',
      'date': 'Feb 01, 2024',
      'email': 'vikram.singh@email.com',
      'phone': '+91 98767 65432',
      'resumeName': 'Vikram_Singh_Resume.pdf',
      'resumeSize': 'PDF • 1.8 MB',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredApps = selectedFilter == 'All'
        ? applications
        : applications.where((app) => app['status'] == selectedFilter).toList();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'Manage Applications',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontweight,
            color: navyColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: navyColor),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: profileSize / 2,
              backgroundColor: avatarColor,
              child: const Text(
                'SA',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search applicants...',
                  hintStyle: TextStyle(color: greyColor),
                  prefixIcon: Icon(Icons.search, color: greyColor),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Filter Chips
            Row(
              children: [
                _buildFilterChip('All'),
                const SizedBox(width: 8),
                _buildFilterChip('Pending'),
                const SizedBox(width: 8),
                _buildFilterChip('Shortlisted'),
              ],
            ),
            const SizedBox(height: 16),
            // Applications List
            Expanded(
              child: ListView.builder(
                itemCount: filteredApps.length,
                itemBuilder: (context, index) {
                  final app = filteredApps[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApplicationDetail(appData: app),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: avatarColor,
                                child: Text(
                                  app['initials'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      app['name'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      app['role'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: greyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _buildStatusBadge(app['status']),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Divider(color: borderColor, height: 1),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Applied: ${app['date']}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: greyColor,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit_outlined, size: 20, color: blueColor),
                                    onPressed: () {},
                                    constraints: const BoxConstraints(),
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    icon: Icon(Icons.delete_outline, size: 20, color: redColor),
                                    onPressed: () {},
                                    constraints: const BoxConstraints(),
                                    padding: const EdgeInsets.all(8),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = selectedFilter == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          selectedFilter = label;
        });
      },
      selectedColor: primaryBlue,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : textColor,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? primaryBlue : borderColor,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color badgeTextColor;

    if (status == 'Pending') {
      bgColor = const Color(0xFFFEF9C3);
      badgeTextColor = const Color(0xFFCA8A04);
    } else if (status == 'Reviewed') {
      bgColor = chipColor;
      badgeTextColor = blueColor;
    } else {
      bgColor = const Color(0xFFFEE2E2);
      badgeTextColor = redColor;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: badgeTextColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}