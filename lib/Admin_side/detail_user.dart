import 'package:flutter/material.dart';
import 'package:job_portal/Admin_side/edit_user.dart';
import '../references/reference.dart';

class DetailUserPage extends StatelessWidget {
  final Map<String, dynamic> user;

  const DetailUserPage({
    super.key,
    required this.user,
  });

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
    final String status = user['status'];

    return Scaffold(
      backgroundColor: backgroundColor,

      // =========================================================
      // APP BAR
      // =========================================================
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: primaryBlue,
          ),
        ),

        title: Text(
          'User Profile',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),

        actions: [
          Icon(
            Icons.notifications_none,
            color: greyColor,
            size: 22,
          ),

          const SizedBox(width: 10),

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
                  fontSize: 11,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 15),
        child: Column(
          children: [
            // =====================================================
            // PROFILE CARD
            // =====================================================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: borderColor,
                ),
              ),
              child: Column(
                children: [
                  // Avatar
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5EAF2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        user['initials'],
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Name
                  Text(
                    user['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Registered candidate
                  Text(
                    'Registered ${user['role']} (${user['userId']})',
                    style: TextStyle(
                      fontSize: 9,
                      color: greyColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Status
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
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
            ),

            const SizedBox(height: 12),

            // =====================================================
            // CONTACT INFORMATION
            // =====================================================
            buildSection(
              title: 'Contact Information',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfo(
                    'EMAIL ADDRESS',
                    user['email'],
                  ),

                  buildInfo(
                    'PHONE NUMBER',
                    user['phone'],
                  ),

                  buildInfo(
                    'LOCATION',
                    user['location'],
                  ),

                  buildInfo(
                    'JOINED DATE',
                    user['joinedDate'],
                    last: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // =====================================================
            // PERSONAL BIO
            // =====================================================
            buildSection(
              title: 'Personal Bio',
              child: Text(
                user['bio'],
                style: TextStyle(
                  fontSize: 10,
                  height: 1.5,
                  color: greyColor,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // =====================================================
            // ACTION BUTTONS
            // =====================================================
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditUserPage(user: user,)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Edit User',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: SizedBox(
                    height: 38,
                    child: OutlinedButton(
                      onPressed: () {
                        showSuspendDialog(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFE53935),
                        side: const BorderSide(
                          color: Color(0xFFE53935),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        status == 'Inactive'
                            ? 'Activate User'
                            : 'Suspend User',
                        style: const TextStyle(
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
      ),

      // =========================================================
      // BOTTOM NAVIGATION
      // =========================================================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: bottomColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        onTap: (index) {
          if (index == 1) {
            Navigator.pop(context);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center_outlined),
            label: 'Employers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_outlined),
            label: 'Companies',
          ),
        ],
      ),
    );
  }

  // =============================================================
  // SECTION CARD
  // =============================================================

  Widget buildSection({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
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
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),

          const SizedBox(height: 10),

          child,
        ],
      ),
    );
  }

  // =============================================================
  // INFORMATION ITEM
  // =============================================================

  Widget buildInfo(
      String title,
      String value, {
        bool last = false,
      }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: last ? 0 : 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: greyColor,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            value,
            style: TextStyle(
              fontSize: 10,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  // =============================================================
  // SUSPEND DIALOG
  // =============================================================

  void showSuspendDialog(BuildContext context) {
    final bool inactive = user['status'] == 'Inactive';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            inactive ? 'Activate User' : 'Suspend User',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          content: Text(
            inactive
                ? 'Do you want to activate ${user['name']}?'
                : 'Do you want to suspend ${user['name']}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                inactive ? primaryBlue : Colors.red,
              ),
              child: Text(
                inactive ? 'Activate' : 'Suspend',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}