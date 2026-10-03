import 'package:flutter/material.dart';
import '../references/reference.dart';
import 'detail_user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final TextEditingController searchController = TextEditingController();

  int selectedFilter = 0;

  final List<Map<String, dynamic>> users = [
    {
      'initials': 'RS',
      'name': 'Rahul Sharma',
      'email': 'rahul@email.com',
      'role': 'User',
      'status': 'Active',
      'userId': 'USR-001',
      'phone': '+91 98765 43210',
      'location': 'Mumbai, Maharashtra',
      'joinedDate': 'January 15, 2024',
      'bio':
      'Rahul is a seasoned Full Stack Engineer based in Mumbai. He is actively seeking job opportunities in React, Node.js, and .NET web application development. Currently holds 4 completed application submissions.',
    },
    {
      'initials': 'PS',
      'name': 'Priya Sharma',
      'email': 'priya@email.com',
      'role': 'User',
      'status': 'Active',
      'userId': 'USR-002',
      'phone': '+91 98765 12345',
      'location': 'Ahmedabad, Gujarat',
      'joinedDate': 'February 10, 2024',
      'bio':
      'Priya is a passionate software developer looking for opportunities in modern web and mobile application development.',
    },
    {
      'initials': 'AK',
      'name': 'Amit Kumar',
      'email': 'amit@email.com',
      'role': 'Employer',
      'status': 'Active',
      'userId': 'EMP-001',
      'phone': '+91 99887 66554',
      'location': 'Pune, Maharashtra',
      'joinedDate': 'March 05, 2024',
      'bio':
      'Amit is an employer looking for talented developers and professionals for his organization.',
    },
    {
      'initials': 'SG',
      'name': 'Sneha Gupta',
      'email': 'sneha@email.com',
      'role': 'User',
      'status': 'Inactive',
      'userId': 'USR-003',
      'phone': '+91 98765 99887',
      'location': 'Delhi, India',
      'joinedDate': 'April 18, 2024',
      'bio':
      'Sneha is a software professional with experience in frontend development and UI design.',
    },
    {
      'initials': 'NV',
      'name': 'Neha Verma',
      'email': 'neha@email.com',
      'role': 'Employer',
      'status': 'Pending',
      'userId': 'EMP-002',
      'phone': '+91 98765 44321',
      'location': 'Bangalore, Karnataka',
      'joinedDate': 'May 22, 2024',
      'bio':
      'Neha recently registered as an employer and is waiting for account verification.',
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get filteredUsers {
    String search = searchController.text.toLowerCase().trim();

    return users.where((user) {
      final matchesSearch =
          user['name'].toString().toLowerCase().contains(search) ||
              user['email'].toString().toLowerCase().contains(search);

      bool matchesFilter = true;

      if (selectedFilter == 1) {
        matchesFilter = user['status'] == 'Active';
      } else if (selectedFilter == 2) {
        matchesFilter = user['status'] == 'Inactive';
      }

      return matchesSearch && matchesFilter;
    }).toList();
  }

  void openUserDetails(Map<String, dynamic> user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailUserPage(user: user),
      ),
    );
  }

  Color getStatusBackground(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFFDDF8E8);

      case 'Inactive':
        return const Color(0xFFFFDDDD);

      case 'Pending':
        return const Color(0xFFFFF1B8);

      default:
        return Colors.grey.shade200;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFF1B9B54);

      case 'Inactive':
        return const Color(0xFFD93636);

      case 'Pending':
        return const Color(0xFF9A7900);

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // =========================================================
      // APP BAR
      // =========================================================
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Manage Users',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontweight,
            color: textColor,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications_none,
            color: greyColor,
            size: 23,
          ),
          const SizedBox(width: 10),

          // Profile Circle
          Container(
            width: 34,
            height: 34,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'SA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      // =========================================================
      // BODY
      // =========================================================
      body: Column(
        children: [
          // Search + Add button
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: borderColor,
                      ),
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (_) {
                        setState(() {});
                      },
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        hintText: 'Search users...',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: greyColor,
                        ),
                        prefixIcon: Icon(
                          Icons.circle,
                          size: 9,
                          color: greyColor,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Add Button
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Add user functionality
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // =====================================================
          // FILTER TABS
          // =====================================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3F6),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  buildFilterButton('All', 0),
                  buildFilterButton('Active', 1),
                  buildFilterButton('Inactive', 2),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // =====================================================
          // USER LIST
          // =====================================================
          Expanded(
            child: filteredUsers.isEmpty
                ? Center(
              child: Text(
                'No users found',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                ),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];

                return buildUserCard(user);
              },
            ),
          ),

          // =====================================================
          // FOOTER COUNT
          // =====================================================
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Showing ${filteredUsers.length} of ${users.length} users',
              style: TextStyle(
                fontSize: 10,
                color: greyColor,
              ),
            ),
          ),
        ],
      ),

    );
  }

  // =============================================================
  // FILTER BUTTON
  // =============================================================

  Widget buildFilterButton(String title, int index) {
    final bool selected = selectedFilter == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight:
                selected ? FontWeight.bold : FontWeight.normal,
                color: selected ? textColor : greyColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // =============================================================
  // USER CARD
  // =============================================================

  Widget buildUserCard(Map<String, dynamic> user) {
    final String status = user['status'];

    return GestureDetector(
      onTap: () {
        openUserDetails(user);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Column(
          children: [
            // -----------------------------------------------------
            // TOP SECTION
            // -----------------------------------------------------
            Row(
              children: [
                // Avatar
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6EBF3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      user['initials'],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Name + Email
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user['name'],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        user['email'],
                        style: TextStyle(
                          fontSize: 9,
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                ),

                // Status
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusBackground(status),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: getStatusTextColor(status),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 9),

            Divider(
              height: 1,
              color: borderColor,
            ),

            const SizedBox(height: 7),

            // -----------------------------------------------------
            // BOTTOM SECTION
            // -----------------------------------------------------
            Row(
              children: [
                Text(
                  'Role: ',
                  style: TextStyle(
                    fontSize: 9,
                    color: greyColor,
                  ),
                ),
                Text(
                  user['role'],
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),

                const Spacer(),

                // Edit
                GestureDetector(
                  onTap: () {
                    // Edit functionality
                  },
                  child: Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: primaryBlue,
                  ),
                ),

                const SizedBox(width: 12),

                // Delete
                GestureDetector(
                  onTap: () {
                    showDeleteDialog(user);
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    size: 18,
                    color: Color(0xFFE53935),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // =============================================================
  // DELETE DIALOG
  // =============================================================

  void showDeleteDialog(Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Delete User',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to delete ${user['name']}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  users.remove(user);
                });

                Navigator.pop(context);
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}