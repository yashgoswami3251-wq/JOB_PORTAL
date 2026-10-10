
import 'package:flutter/material.dart';
import 'package:job_portal/Admin_side/users.dart';
import '../references/reference.dart';
import 'admin_profile.dart';
import 'application.dart';
import 'categories.dart';
import 'employers.dart';
import 'jobs.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: backgroundColor,

        // ================= BODY =================
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            DashboardTab(),
            UsersPage(),
            EmployersPage(),
            JobsPage(),
            AppsPage(),
            CategoriesPage(),
          ],
        ),

        // ============== BOTTOM NAVIGATION ==============
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: bottomColor,
            border: Border(
              top: BorderSide(
                color: blueColor,
                width: 1.2,
              ),
            ),
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: 48,
              child: TabBar(
                indicator: BoxDecoration(
                  color: avatarColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(
                  horizontal: 3,
                  vertical: 4,
                ),
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                labelPadding: EdgeInsets.zero,
                labelStyle: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.dashboard_outlined,
                      size: 16,
                    ),
                    text: 'Dashboard',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.people_outline_rounded,
                      size: 16,
                    ),
                    text: 'Users',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person_2_outlined,
                      size: 16,
                    ),
                    text: 'Employee',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.work_outline_rounded,
                      size: 16,
                    ),
                    text: 'Jobs',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.description_outlined,
                      size: 16,
                    ),
                    text: 'Apps',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.category,
                      size: 16,
                    ),
                    text: 'Categorie',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================================================================
// DASHBOARD TAB
// ================================================================

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'HireHub Portal',
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontweight,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_rounded,
              color: greyColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfilePage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: avatarColor,
                child: const Text(
                  'SA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome
              Text(
                'Welcome back, Admin!',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Portal health and live overview for today.',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 14),

              // Statistics row 1
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      title: 'Total Users',
                      value: '2,847',
                      icon: Icons.person_outline_rounded,
                      iconBackground: chipColor,
                      iconColor: blueColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _StatCard(
                      title: 'Employers',
                      value: '456',
                      icon: Icons.business_center_outlined,
                      iconBackground: const Color(0xFFE8F9F2),
                      iconColor: const Color(0xFF16A979),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Statistics row 2
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      title: 'Total Jobs',
                      value: '1,234',
                      icon: Icons.work_outline_rounded,
                      iconBackground: const Color(0xFFFFF5E5),
                      iconColor: const Color(0xFFF59E0B),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _StatCard(
                      title: 'Applications',
                      value: '8,912',
                      icon: Icons.description_outlined,
                      iconBackground: const Color(0xFFFFEEEE),
                      iconColor: redColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Quick actions
              _SectionContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Actions',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _ActionButton(
                            title: 'Verify Employer',
                            filled: true,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: _ActionButton(
                            title: 'Review Jobs',
                            filled: false,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: _ActionButton(
                            title: 'System Audit',
                            filled: false,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Recent activities
              _SectionContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activities',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    _ActivityItem(
                      title:
                      'New employer: Tech Mahindra (Awaiting verification)',
                      time: '10 mins ago',
                    ),
                    _ActivityItem(
                      title:
                      "Job post approved: 'Lead React Developer' at TCS",
                      time: '1 hour ago',
                    ),
                    _ActivityItem(
                      title:
                      'User registered: Sneha Gupta (sneha@email.com)',
                      time: '3 hours ago',
                      showDivider: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

// ================================================================
// STAT CARD
// ================================================================

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 19,
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// SECTION CONTAINER
// ================================================================

class _SectionContainer extends StatelessWidget {
  final Widget child;

  const _SectionContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: child,
    );
  }
}

// ================================================================
// ACTION BUTTON
// ================================================================

class _ActionButton extends StatelessWidget {
  final String title;
  final bool filled;
  final VoidCallback onTap;

  const _ActionButton({
    required this.title,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: filled ? blueColor : Colors.white,
          foregroundColor: filled ? Colors.white : blueColor,
          side: BorderSide(color: blueColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// ================================================================
// ACTIVITY ITEM
// ================================================================

class _ActivityItem extends StatelessWidget {
  final String title;
  final String time;
  final bool showDivider;

  const _ActivityItem({
    required this.title,
    required this.time,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                time,
                style: TextStyle(
                  color: greyColor,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 0.7,
            color: borderColor,
          ),
      ],
    );
  }
}

