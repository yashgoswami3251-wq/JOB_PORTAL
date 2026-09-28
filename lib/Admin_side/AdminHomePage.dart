import 'package:flutter/material.dart';

void main() {
  runApp(const HireHubApp());
}

class HireHubApp extends StatelessWidget {
  const HireHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const AdminHomePage(),
    );
  }
}

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NO BLUE BACKGROUND
      backgroundColor: const Color(0xFFFAF8F4),

      body: SafeArea(
        child: Column(
          children: [
            // ============================================================
            // HEADER
            // ============================================================
            Container(
              height: 58,
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  const Text(
                    'HireHub Portal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF202B3C),
                    ),
                  ),

                  const Spacer(),

                  Icon(
                    Icons.notifications_none_rounded,
                    size: 24,
                    color: Colors.grey.shade600,
                  ),

                  const SizedBox(width: 14),

                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFF315B70),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'SA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 1,
              color: const Color(0xFFE7E7E7),
            ),

            // ============================================================
            // MAIN CONTENT
            // ============================================================
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    18,
                    18,
                    18,
                    18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Welcome
                      const Text(
                        'Welcome back, Admin!',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF182235),
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        'Portal health and live overview for today.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF777777),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // ==================================================
                      // STATISTICS ROW 1
                      // ==================================================
                      Row(
                        children: [
                          Expanded(
                            child: _statCard(
                              icon: Icons.person_outline_rounded,
                              iconColor: const Color(0xFF4D8BFF),
                              iconBackground: const Color(0xFFEAF2FF),
                              title: 'Total Users',
                              value: '2,847',
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: _statCard(
                              icon: Icons.business_center_outlined,
                              iconColor: const Color(0xFF31C89A),
                              iconBackground: const Color(0xFFE8FAF5),
                              title: 'Employers',
                              value: '456',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // ==================================================
                      // STATISTICS ROW 2
                      // ==================================================
                      Row(
                        children: [
                          Expanded(
                            child: _statCard(
                              icon: Icons.business_center_outlined,
                              iconColor: const Color(0xFFFFA500),
                              iconBackground: const Color(0xFFFFF3DD),
                              title: 'Total Jobs',
                              value: '1,234',
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: _statCard(
                              icon: Icons.description_outlined,
                              iconColor: const Color(0xFFFF6B6B),
                              iconBackground: const Color(0xFFFFEAEA),
                              title: 'Applications',
                              value: '8,912',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // ==================================================
                      // QUICK ACTIONS
                      // ==================================================
                      _sectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Quick Actions',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF283345),
                              ),
                            ),

                            const SizedBox(height: 12),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _actionButton(
                                  title: 'Verify Employer',
                                  filled: true,
                                ),

                                _actionButton(
                                  title: 'Review Jobs',
                                  filled: false,
                                ),

                                _actionButton(
                                  title: 'System Audit',
                                  filled: false,
                                  grey: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // ==================================================
                      // RECENT ACTIVITIES
                      // ==================================================
                      _sectionCard(
                        padding: const EdgeInsets.fromLTRB(
                          15,
                          15,
                          15,
                          8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Recent Activities',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF283345),
                              ),
                            ),

                            const SizedBox(height: 9),

                            _activity(
                              title:
                              'New employer: Tech Mahindra (Awaiting verification)',
                              time: '10 mins ago',
                            ),

                            _activity(
                              title:
                              "Job post approved: 'Lead React Developer' at TCS",
                              time: '1 hour ago',
                            ),

                            _activity(
                              title:
                              'User registered: Sneha Gupta (sneha@email.com)',
                              time: '3 hours ago',
                              last: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ============================================================
            // BOTTOM NAVIGATION
            // ============================================================
            Container(
              height: 64,
              width: double.infinity,
              color: const Color(0xFF172C4D),
              child: Row(
                children: [
                  _bottomItem(
                    icon: Icons.grid_view_rounded,
                    title: 'Dashboard',
                    index: 0,
                  ),

                  _bottomItem(
                    icon: Icons.person_outline_rounded,
                    title: 'Users',
                    index: 1,
                  ),

                  _bottomItem(
                    icon: Icons.business_center_outlined,
                    title: 'Employers',
                    index: 2,
                  ),

                  _bottomItem(
                    icon: Icons.business_outlined,
                    title: 'Companies',
                    index: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================================================================
  // STAT CARD
  // ================================================================

  Widget _statCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
    required String title,
    required String value,
  }) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),

          const SizedBox(width: 10),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF7A8088),
                ),
              ),

              const SizedBox(height: 2),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF273144),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================================================================
  // SECTION CARD
  // ================================================================

  Widget _sectionCard({
    required Widget child,
    EdgeInsets padding = const EdgeInsets.all(15),
  }) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }

  // ================================================================
  // ACTION BUTTON
  // ================================================================

  Widget _actionButton({
    required String title,
    required bool filled,
    bool grey = false,
  }) {
    return Container(
      height: 31,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: filled
            ? const Color(0xFF2D6BEA)
            : grey
            ? const Color(0xFFF1F3F5)
            : Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: filled
            ? null
            : Border.all(
          color: grey
              ? const Color(0xFFE4E6E8)
              : const Color(0xFF4A83F4),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: filled
              ? Colors.white
              : grey
              ? const Color(0xFF4E5968)
              : const Color(0xFF3B76E8),
        ),
      ),
    );
  }

  // ================================================================
  // ACTIVITY
  // ================================================================

  Widget _activity({
    required String title,
    required String time,
    bool last = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: last
            ? null
            : const Border(
          bottom: BorderSide(
            color: Color(0xFFE5E5E5),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF303A4B),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            time,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF8A8F97),
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // BOTTOM NAVIGATION
  // ================================================================

  Widget _bottomItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    final bool selected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Center(
          child: Container(
            width: 80,
            height: 48,
            decoration: BoxDecoration(
              color: selected
                  ? const Color(0xFF315B70)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),

                const SizedBox(height: 3),

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
