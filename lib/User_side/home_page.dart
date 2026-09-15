import 'package:flutter/material.dart';

import 'saved_page.dart';
import 'applied_page.dart';
import 'find_jobs.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // ============================================================
  // SELECTED BOTTOM NAVIGATION INDEX
  // ============================================================

  int selectedIndex = 0;

  // ============================================================
  // COLORS
  // ============================================================

  final Color backgroundColor = const Color(0xFFFFFCF7);
  final Color navyColor = const Color(0xFF17233B);
  final Color blueColor = const Color(0xFF2864E8);
  final Color bottomColor = const Color(0xFF17445B);
  final Color borderColor = const Color(0xFFE1E5EB);

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  void _onBottomItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // ============================================================
  // APPLY JOB
  // ============================================================

  void _goToAppliedPage() {
    setState(() {
      selectedIndex = 2;
    });
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // ========================================================
      // BODY
      // ========================================================

      body: IndexedStack(
        index: selectedIndex,

        children: [

          // ======================================================
          // HOME
          // ======================================================

          _buildHomePage(),

          // ======================================================
          // FIND JOBS
          // ======================================================

          findjobes(
            onApply: _goToAppliedPage,
          ),

          // ======================================================
          // APPLIED
          // ======================================================

          const AppliedPages(),

          // ======================================================
          // SAVED
          // ======================================================

          SavedPage(
            onApply: _goToAppliedPage,
          ),

          // ======================================================
          // PROFILE
          // ======================================================

          const ProfilePage(),
        ],
      ),

      // ========================================================
      // BOTTOM NAVIGATION BAR
      // ========================================================

      bottomNavigationBar: Container(
        height: 72,
        width: double.infinity,

        decoration: BoxDecoration(
          color: bottomColor,

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),

        child: Row(
          children: [

            // ==================================================
            // HOME
            // ==================================================

            Expanded(
              child: _bottomItem(
                icon: Icons.home_outlined,
                title: "Home",
                index: 0,
              ),
            ),

            // ==================================================
            // FIND JOBS
            // ==================================================

            Expanded(
              child: _bottomItem(
                icon: Icons.search,
                title: "Find Jobs",
                index: 1,
              ),
            ),

            // ==================================================
            // APPLIED
            // ==================================================

            Expanded(
              child: _bottomItem(
                icon: Icons.description_outlined,
                title: "Applied",
                index: 2,
              ),
            ),

            // ==================================================
            // SAVED
            // ==================================================

            Expanded(
              child: _bottomItem(
                icon: Icons.bookmark_border,
                title: "Saved",
                index: 3,
              ),
            ),

            // ==================================================
            // PROFILE
            // ==================================================

            Expanded(
              child: _bottomItem(
                icon: Icons.person_outline,
                title: "Profile",
                index: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HOME PAGE
  // ============================================================

  Widget _buildHomePage() {
    return SafeArea(
      child: Column(
        children: [

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              padding: const EdgeInsets.fromLTRB(
                15,
                10,
                15,
                20,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // ==================================================
                  // HEADER
                  // ==================================================

                  Row(
                    children: [

                      // ==================================================
                      // HIREHUB
                      // ==================================================

                      Text(
                        "HireHub",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: navyColor,
                        ),
                      ),

                      const Spacer(),

                      // ==================================================
                      // PROFILE ICON
                      // ==================================================

                      GestureDetector(
                        onTap: () {

                          // IMPORTANT:
                          // ProfilePage is already inside IndexedStack.
                          // So don't use Navigator.push() here.

                          setState(() {
                            selectedIndex = 4;
                          });
                        },

                        child: Container(
                          width: 40,
                          height: 40,

                          decoration: const BoxDecoration(
                            color: Color(0xFF3D687A),
                            shape: BoxShape.circle,
                          ),

                          child: const Center(
                            child: Text(
                              "RS",
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

                  const SizedBox(height: 22),

                  // ==================================================
                  // WELCOME
                  // ==================================================

                  Text(
                    "Welcome back, Rahul!",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: navyColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Your job search is looking great. Here is what is "
                        "happening with your applications today.",
                    style: TextStyle(
                      fontSize: 14.5,
                      height: 1.4,
                      color: Color(0xFF7B808A),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // ==================================================
                  // STATISTICS
                  // ==================================================

                  Row(
                    children: [

                      // SENT
                      Expanded(
                        child: _statCard(
                          icon: Icons.description_outlined,
                          iconColor: const Color(0xFF2864E8),
                          iconBackground: const Color(0xFFEFF5FF),
                          title: "Sent",
                          value: "12",
                        ),
                      ),

                      const SizedBox(width: 8),

                      // INTERVIEWS
                      Expanded(
                        child: _statCard(
                          icon: Icons.calendar_month_outlined,
                          iconColor: const Color(0xFF00B889),
                          iconBackground: const Color(0xFFE8FAF4),
                          title: "Interviews",
                          value: "3",
                        ),
                      ),

                      const SizedBox(width: 8),

                      // JOB ALERTS
                      Expanded(
                        child: _statCard(
                          icon: Icons.notifications_active_outlined,
                          iconColor: const Color(0xFFFFA000),
                          iconBackground: const Color(0xFFFFF5E3),
                          title: "Job Alerts",
                          value: "5",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // ==================================================
                  // RECOMMENDED JOBS
                  // ==================================================

                  Text(
                    "Recommended Jobs",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: navyColor,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ==================================================
                  // TCS
                  // ==================================================

                  _jobCard(
                    companyShortName: "TCS",
                    companyColor: const Color(0xFF2864E8),
                    companyBackground: const Color(0xFFEFF5FF),
                    jobTitle: "Senior React Developer",
                    companyName: "TCS",
                    location: "Mumbai",
                    salary: "₹12-18 LPA",
                    jobType: "Full Time",
                    jobTypeColor: const Color(0xFF2864E8),
                    jobTypeBackground: const Color(0xFFEFF5FF),
                  ),

                  const SizedBox(height: 10),

                  // ==================================================
                  // INFOSYS
                  // ==================================================

                  _jobCard(
                    companyShortName: "INF",
                    companyColor: const Color(0xFF8B5CF6),
                    companyBackground: const Color(0xFFF3EEFF),
                    jobTitle: "UI/UX Designer",
                    companyName: "Infosys",
                    location: "Bangalore",
                    salary: "₹8-14 LPA",
                    jobType: "Full Time",
                    jobTypeColor: const Color(0xFF2864E8),
                    jobTypeBackground: const Color(0xFFEFF5FF),
                  ),

                  const SizedBox(height: 10),

                  // ==================================================
                  // WIPRO
                  // ==================================================

                  _jobCard(
                    companyShortName: "WIP",
                    companyColor: const Color(0xFF00A878),
                    companyBackground: const Color(0xFFE8F8F3),
                    jobTitle: "Data Analyst",
                    companyName: "Wipro",
                    location: "Pune",
                    salary: "₹6-10 LPA",
                    jobType: "Part Time",
                    jobTypeColor: const Color(0xFFFF9800),
                    jobTypeBackground: const Color(0xFFFFF4E3),
                  ),

                  const SizedBox(height: 22),

                  // ==================================================
                  // RECENT ACTIVITY
                  // ==================================================

                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      border: Border.all(
                        color: borderColor,
                      ),

                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(
                          "Recent Application Activity",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: navyColor,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // ACTIVITY 1
                        _activityItem(
                          color: const Color(0xFF00B889),
                          title: "Interview scheduled at Infosys",
                          date: "Jan 25, 2024",
                        ),

                        const SizedBox(height: 12),

                        // ACTIVITY 2
                        _activityItem(
                          color: const Color(0xFF2864E8),
                          title:
                          "Applied for Senior React Developer at TCS",
                          date: "Jan 22, 2024",
                        ),

                        const SizedBox(height: 12),

                        // ACTIVITY 3
                        _activityItem(
                          color: const Color(0xFFFF9800),
                          title:
                          "Shortlisted as Data Analyst at Wipro",
                          date: "Feb 1, 2024",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION ITEM
  // ============================================================

  Widget _bottomItem({
    required IconData icon,
    required String title,
    required int index,
  }) {

    final bool selected = selectedIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        _onBottomItemTap(index);
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          // ==================================================
          // ICON BACKGROUND
          // ==================================================

          Container(
            width: 60,
            height: 32,

            decoration: BoxDecoration(
              color: selected
                  ? const Color(0xFF286078)
                  : Colors.transparent,

              borderRadius: BorderRadius.circular(9),
            ),

            child: Icon(
              icon,
              size: 21,

              color: selected
                  ? Colors.white
                  : const Color(0xFFB8D0DC),
            ),
          ),

          const SizedBox(height: 2),

          // ==================================================
          // TITLE
          // ==================================================

          Text(
            title,

            style: TextStyle(
              fontSize: 10,

              color: selected
                  ? Colors.white
                  : const Color(0xFFB8D0DC),

              fontWeight: selected
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STAT CARD
  // ============================================================

  Widget _statCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
    required String title,
    required String value,
  }) {

    return Container(
      height: 68,

      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(
          color: borderColor,
        ),

        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          // ==================================================
          // ICON
          // ==================================================

          Container(
            width: 30,
            height: 30,

            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              size: 17,
              color: iconColor,
            ),
          ),

          const SizedBox(width: 7),

          // ==================================================
          // TEXT
          // ==================================================

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  title,

                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF7B808A),
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  value,

                  style: TextStyle(
                    fontSize: 16,
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

  // ============================================================
  // JOB CARD
  // ============================================================

  Widget _jobCard({
    required String companyShortName,
    required Color companyColor,
    required Color companyBackground,
    required String jobTitle,
    required String companyName,
    required String location,
    required String salary,
    required String jobType,
    required Color jobTypeColor,
    required Color jobTypeBackground,
  }) {

    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(
          color: borderColor,
        ),

        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // ==================================================
              // COMPANY ICON
              // ==================================================

              Container(
                width: 52,
                height: 52,

                decoration: BoxDecoration(
                  color: companyBackground,
                  borderRadius: BorderRadius.circular(9),
                ),

                child: Center(
                  child: Text(
                    companyShortName,

                    style: TextStyle(
                      color: companyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // ==================================================
              // JOB INFORMATION
              // ==================================================

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      jobTitle,

                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: navyColor,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "$companyName • $location",

                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF7B808A),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 6),

              // ==================================================
              // JOB TYPE
              // ==================================================

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  color: jobTypeBackground,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Text(
                  jobType,

                  style: TextStyle(
                    fontSize: 10,
                    color: jobTypeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 13),

          // ==================================================
          // SALARY
          // ==================================================

          Align(
            alignment: Alignment.centerLeft,

            child: Text(
              salary,

              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: navyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACTIVITY ITEM
  // ============================================================

  Widget _activityItem({
    required Color color,
    required String title,
    required String date,
  }) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        // ==================================================
        // DOT
        // ==================================================

        Container(
          margin: const EdgeInsets.only(top: 5),

          width: 9,
          height: 9,

          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 11),

        // ==================================================
        // TEXT
        // ==================================================

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                title,

                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF17233B),
                ),
              ),

              const SizedBox(height: 3),

              Text(
                date,

                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF8A909A),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}