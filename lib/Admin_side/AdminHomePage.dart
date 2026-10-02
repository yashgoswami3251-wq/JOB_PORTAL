import 'package:flutter/material.dart';
import '../references/reference.dart';
import 'admin_profile.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: backgroundColor,

        // ==============================
        // APP BAR
        // ==============================
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          surfaceTintColor: Colors.transparent,

          title: Text(
            "HireHub Portal",
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfilePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 14),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: avatarColor,
                  child: const Text(
                    "SA",
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

        // ==============================
        // BODY
        // ==============================
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            DashboardTab(),
           /* UsersTab(),
            EmployersTab(),
            CompaniesTab(),*/
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: bottomColor,
            border: Border(
              top: BorderSide(
                color: borderColor,
                width: 0.5,
              ),
            ),
          ),
          child: SafeArea(
            child: TabBar(
              indicator: BoxDecoration(
                color: avatarColor,
                borderRadius: BorderRadius.circular(8),
              ),

              indicatorSize: TabBarIndicatorSize.tab,

              indicatorPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),

              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,

              labelStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),

              unselectedLabelStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),

              tabs: const [
                Tab(
                  icon: Icon(
                    Icons.dashboard_outlined,
                    size: 21,
                  ),
                  text: "Dashboard",
                ),

                Tab(
                  icon: Icon(
                    Icons.person_outline_rounded,
                    size: 21,
                  ),
                  text: "Users",
                ),

                Tab(
                  icon: Icon(
                    Icons.business_center_outlined,
                    size: 21,
                  ),
                  text: "Employers",
                ),

                Tab(
                  icon: Icon(
                    Icons.business_outlined,
                    size: 21,
                  ),
                  text: "Companies",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// DASHBOARD TAB
// ============================================================

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ==============================
            // WELCOME
            // ==============================

            Text(
              "Welcome back, Admin!",
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              "Portal health and live overview for today.",
              style: TextStyle(
                color: greyColor,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 14),

            // ==============================
            // STAT CARDS
            // ==============================

            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: "Total Users",
                    value: "2,847",
                    icon: Icons.person_outline_rounded,
                    iconBackground: chipColor,
                    iconColor: blueColor,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: _StatCard(
                    title: "Employers",
                    value: "456",
                    icon: Icons.business_center_outlined,
                    iconBackground: const Color(0xFFE8F9F2),
                    iconColor: const Color(0xFF16A979),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: "Total Jobs",
                    value: "1,234",
                    icon: Icons.work_outline_rounded,
                    iconBackground: const Color(0xFFFFF5E5),
                    iconColor: const Color(0xFFF59E0B),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: _StatCard(
                    title: "Applications",
                    value: "8,912",
                    icon: Icons.description_outlined,
                    iconBackground: const Color(0xFFFFEEEE),
                    iconColor: redColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // ==============================
            // QUICK ACTIONS
            // ==============================

            _SectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Quick Actions",
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
                          title: "Verify Employer",
                          filled: true,
                          onTap: () {},
                        ),
                      ),

                      const SizedBox(width: 7),

                      Expanded(
                        child: _ActionButton(
                          title: "Review Jobs",
                          filled: false,
                          onTap: () {},
                        ),
                      ),

                      const SizedBox(width: 7),

                      Expanded(
                        child: _ActionButton(
                          title: "System Audit",
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

            // ==============================
            // RECENT ACTIVITIES
            // ==============================

            _SectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Recent Activities",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  _ActivityItem(
                    title:
                    "New employer: Tech Mahindra (Awaiting verification)",
                    time: "10 mins ago",
                  ),

                  _ActivityItem(
                    title:
                    "Job post approved: 'Lead React Developer' at TCS",
                    time: "1 hour ago",
                  ),

                  _ActivityItem(
                    title:
                    "User registered: Sneha Gupta (sneha@email.com)",
                    time: "3 hours ago",
                    showDivider: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// STAT CARD
// ============================================================

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

// ============================================================
// SECTION CONTAINER
// ============================================================

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

// ============================================================
// ACTION BUTTON
// ============================================================

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

          side: BorderSide(
            color: filled ? blueColor : blueColor,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),

          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
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

// ============================================================
// ACTIVITY ITEM
// ============================================================

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
          padding: const EdgeInsets.symmetric(
            vertical: 9,
          ),

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

// ============================================================
// SIMPLE TAB PAGE
// ============================================================

class _SimpleTabPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SimpleTabPage({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: 70,
                width: 70,

                decoration: BoxDecoration(
                  color: chipColor,
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  icon,
                  color: blueColor,
                  size: 32,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: greyColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}