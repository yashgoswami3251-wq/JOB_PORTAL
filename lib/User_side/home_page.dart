import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  // HOME PAGE
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: Column(
          children: [

            // ==================================================
            // MAIN CONTENT
            // ==================================================

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  15,
                  10,
                  15,
                  15,
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    // ==================================================
                    // TOP HEADER
                    // ==================================================

                    Row(
                      children: [

                        const Text(
                          "HireHub",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF17233B),
                          ),
                        ),

                        const Spacer(),

                        // Profile Circle
                        Container(
                          width: 32,
                          height: 32,

                          decoration: BoxDecoration(
                            color: const Color(0xFF3D687A),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),

                          child: const Center(
                            child: Text(
                              "RS",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // ==================================================
                    // WELCOME
                    // ==================================================

                    const Text(
                      "Welcome back, Rahul!",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17233B),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "Your job search is looking great. Here is what is happening\n"
                          "with your applications today.",
                      style: TextStyle(
                        fontSize: 11,
                        height: 1.4,
                        color: Color(0xFF7B808A),
                      ),
                    ),

                    const SizedBox(height: 17),

                    // ==================================================
                    // STATISTICS
                    // ==================================================

                    Row(
                      children: [

                        Expanded(
                          child: _statCard(
                            icon: Icons.description_outlined,
                            iconColor: const Color(0xFF2864E8),
                            iconBackground:
                            const Color(0xFFEFF5FF),
                            title: "Sent",
                            value: "12",
                          ),
                        ),

                        const SizedBox(width: 7),

                        Expanded(
                          child: _statCard(
                            icon: Icons.calendar_month_outlined,
                            iconColor: const Color(0xFF00B889),
                            iconBackground:
                            const Color(0xFFE8FAF4),
                            title: "Interviews",
                            value: "3",
                          ),
                        ),

                        const SizedBox(width: 7),

                        Expanded(
                          child: _statCard(
                            icon: Icons.notifications_active_outlined,
                            iconColor: const Color(0xFFFFA000),
                            iconBackground:
                            const Color(0xFFFFF5E3),
                            title: "Job Alerts",
                            value: "5",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // ==================================================
                    // RECOMMENDED JOBS
                    // ==================================================

                    const Text(
                      "Recommended Jobs",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17233B),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Job 1
                    _jobCard(
                      companyShortName: "TCS",
                      companyColor: const Color(0xFF2864E8),
                      companyBackground:
                      const Color(0xFFEFF5FF),
                      jobTitle: "Senior React Developer",
                      companyName: "TCS",
                      location: "Mumbai",
                      salary: "₹12-18 LPA",
                      jobType: "Full Time",
                      jobTypeColor:
                      const Color(0xFF2864E8),
                      jobTypeBackground:
                      const Color(0xFFEFF5FF),
                    ),

                    const SizedBox(height: 8),

                    // Job 2
                    _jobCard(
                      companyShortName: "INF",
                      companyColor: const Color(0xFF8B5CF6),
                      companyBackground:
                      const Color(0xFFF3EEFF),
                      jobTitle: "UI/UX Designer",
                      companyName: "Infosys",
                      location: "Bangalore",
                      salary: "₹8-14 LPA",
                      jobType: "Full Time",
                      jobTypeColor:
                      const Color(0xFF2864E8),
                      jobTypeBackground:
                      const Color(0xFFEFF5FF),
                    ),

                    const SizedBox(height: 8),

                    // Job 3
                    _jobCard(
                      companyShortName: "WIP",
                      companyColor: const Color(0xFF00A878),
                      companyBackground:
                      const Color(0xFFE8F8F3),
                      jobTitle: "Data Analyst",
                      companyName: "Wipro",
                      location: "Pune",
                      salary: "₹6-10 LPA",
                      jobType: "Part Time",
                      jobTypeColor:
                      const Color(0xFFFF9800),
                      jobTypeBackground:
                      const Color(0xFFFFF4E3),
                    ),

                    const SizedBox(height: 18),

                    // ==================================================
                    // RECENT ACTIVITY
                    // ==================================================

                    Container(
                      width: double.infinity,

                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        border: Border.all(
                          color: borderColor,
                        ),

                        borderRadius:
                        BorderRadius.circular(10),
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          const Text(
                            "Recent Application Activity",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF17233B),
                            ),
                          ),

                          const SizedBox(height: 12),

                          _activityItem(
                            color: const Color(0xFF00B889),
                            title:
                            "Interview scheduled at Infosys",
                            date: "Jan 25, 2024",
                          ),

                          const SizedBox(height: 10),

                          _activityItem(
                            color: const Color(0xFF2864E8),
                            title:
                            "Applied for Senior React Developer at TCS",
                            date: "Jan 22, 2024",
                          ),

                          const SizedBox(height: 10),

                          _activityItem(
                            color: const Color(0xFFFF9800),
                            title:
                            "Shortlisted as Data Analyst at Wipro",
                            date: "Feb 1, 2024",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ==================================================
            // BOTTOM NAVIGATION
            // ==================================================

            Container(
              height: 64,

              decoration: BoxDecoration(
                color: bottomColor,

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),

              child: Container(
                height: 54,
                width: double.infinity,

                color: bottomColor,

                child: Row(
                  children: [

                    _bottomItem(
                      icon: Icons.home_outlined,
                      title: "Home",
                      index: 0,
                    ),

                    _bottomItem(
                      icon: Icons.search,
                      title: "Find Jobs",
                      index: 1,
                    ),

                    _bottomItem(
                      icon: Icons.description_outlined,
                      title: "Applied",
                      index: 2,
                    ),

                    _bottomItem(
                      icon: Icons.bookmark_border,
                      title: "Saved",
                      index: 3,
                    ),

                    _bottomItem(
                      icon: Icons.person_outline,
                      title: "Profile",
                      index: 4,
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
      height: 48,

      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(
          color: borderColor,
        ),

        borderRadius:
        BorderRadius.circular(9),
      ),

      child: Row(
        children: [

          Container(
            width: 26,
            height: 26,

            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              size: 15,
              color: iconColor,
            ),
          ),

          const SizedBox(width: 6),

          Column(
            mainAxisAlignment:
            MainAxisAlignment.center,

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                title,
                style: const TextStyle(
                  fontSize: 8,
                  color: Color(0xFF7B808A),
                ),
              ),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17233B),
                ),
              ),
            ],
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

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(
          color: borderColor,
        ),

        borderRadius:
        BorderRadius.circular(10),
      ),

      child: Column(
        children: [

          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              // Company logo
              Container(
                width: 38,
                height: 38,

                decoration: BoxDecoration(
                  color: companyBackground,
                  borderRadius:
                  BorderRadius.circular(7),
                ),

                child: Center(
                  child: Text(
                    companyShortName,

                    style: TextStyle(
                      color: companyColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Job information
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      jobTitle,
                      maxLines: 1,
                      overflow:
                      TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17233B),
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      "$companyName • $location",

                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF7B808A),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

              // Job type
              Container(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 4,
                ),

                decoration: BoxDecoration(
                  color: jobTypeBackground,

                  borderRadius:
                  BorderRadius.circular(10),
                ),

                child: Text(
                  jobType,

                  style: TextStyle(
                    fontSize: 8,
                    color: jobTypeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Salary
          Align(
            alignment: Alignment.centerLeft,

            child: Text(
              salary,

              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF17233B),
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
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        // Dot
        Container(
          margin: const EdgeInsets.only(
            top: 4,
          ),

          width: 7,
          height: 7,

          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                title,

                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF17233B),
                ),
              ),

              const SizedBox(height: 2),

              Text(
                date,

                style: const TextStyle(
                  fontSize: 9,
                  color: Color(0xFF8A909A),
                ),
              ),
            ],
          ),
        ),
      ],
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
    final bool selected =
        selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },

        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Container(
              width: 54,
              height: 29,

              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFF286078)
                    : Colors.transparent,

                borderRadius:
                BorderRadius.circular(8),
              ),

              child: Icon(
                icon,
                size: 19,

                color: selected
                    ? Colors.white
                    : const Color(0xFFB8D0DC),
              ),
            ),

            const SizedBox(height: 1),

            Text(
              title,

              style: TextStyle(
                fontSize: 8,

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
      ),
    );
  }
}