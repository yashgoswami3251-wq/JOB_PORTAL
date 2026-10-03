import 'package:flutter/material.dart';
import '../references/reference.dart';

class EmployerDetailPage extends StatefulWidget {
  final Map<String, dynamic> employer;

  const EmployerDetailPage({
    super.key,
    required this.employer,
  });

  @override
  State<EmployerDetailPage> createState() => _EmployerDetailPageState();
}

class _EmployerDetailPageState extends State<EmployerDetailPage> {
  late String currentStatus;

  @override
  void initState() {
    super.initState();

    currentStatus = widget.employer['status'];
  }

  Color _getStatusBackground(String status) {
    switch (status.toLowerCase()) {
      case 'active':return const Color(0xFFE1F8EA);

      case 'pending':return const Color(0xFFFFF3CD);

      case 'blocked':return const Color(0xFFFFE3E3);

      default:
        return lightGrey;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return greenColor;

      case 'pending':
        return const Color(0xFFB78103);

      case 'blocked':
        return const Color(0xFFD22B2B);

      default:
        return greyColor;
    }
  }

  // ------------------------------------------------------------
  // APPROVE POSTS
  // ------------------------------------------------------------

  void _approvePosts() {
    setState(() {
      currentStatus = 'Active';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Posts approved successfully'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ------------------------------------------------------------
  // BLOCK ACCOUNT
  // ------------------------------------------------------------

  void _blockAccount() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:  Text(
            'Block Account',
            style: TextStyle(
              color: navyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to block ${widget.employer['name']}?',
            style: TextStyle(
              color: greyColor,
              fontSize: 13,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: greyColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  currentStatus = 'Blocked';
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Employer account blocked'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: const Text(
                'Block',
                style: TextStyle(
                  color: redColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ------------------------------------------------------------
  // MAIN
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final employer = widget.employer;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  12,
                  12,
                  12,
                  14,
                ),
                child: Column(
                  children: [
                    _buildCompanyProfile(employer),

                    const SizedBox(height: 12),

                    _buildCorporateDetails(employer),

                    const SizedBox(height: 12),

                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // ------------------------------------------------------------
  // HEADER
  // ------------------------------------------------------------

  Widget _buildHeader() {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              splashRadius: 20,
              icon: Icon(
                Icons.arrow_back,
                color: primaryBlue,
                size: 25,
              ),
            ),

            const SizedBox(width: 1),

             Expanded(
              child: Text(
                'Employer Profile',
                style: TextStyle(
                  color: navyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            IconButton(
              onPressed: () {},
              splashRadius: 20,
              icon: Icon(
                Icons.notifications_none_outlined,
                color: greyColor,
                size: 21,
              ),
            ),

            const SizedBox(width: 2),

            Container(
              width: profileSize,
              height: profileSize,
              decoration: BoxDecoration(
                color: avatarColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Text(
                'SA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // COMPANY PROFILE
  // ------------------------------------------------------------

  Widget _buildCompanyProfile(Map<String, dynamic> employer) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 16,
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
          // Company Logo
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: chipColor,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text(
              employer['logo'],
              style: TextStyle(
                color: primaryBlue,
                fontSize: employer['logo'] == 'TCS' ? 18 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Company Name
          Text(
            employer['name'],
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: navyColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 3),

          // Company Type
          Text(
            employer['companyType'],
            style: TextStyle(
              color: greyColor,
              fontSize: 9.5,
            ),
          ),

          const SizedBox(height: 7),

          // Status
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 3,
            ),
            decoration: BoxDecoration(
              color: _getStatusBackground(currentStatus),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              currentStatus,
              style: TextStyle(
                color: _getStatusTextColor(currentStatus),
                fontSize: 8.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // CORPORATE DETAILS
  // ------------------------------------------------------------

  Widget _buildCorporateDetails(
      Map<String, dynamic> employer,
      ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        12,
        12,
        12,
        13,
      ),
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
            'Corporate Details',
            style: TextStyle(
              color: navyColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          _detailItem(
            title: 'HR CONTACT EMAIL',
            value: employer['email'],
          ),

          const SizedBox(height: 9),

          _detailItem(
            title: 'CONTACT PHONE',
            value: employer['phone'],
          ),

          const SizedBox(height: 9),

          _detailItem(
            title: 'LOCATIONS',
            value: employer['location'],
          ),

          const SizedBox(height: 9),

          _detailItem(
            title: 'POSTED JOBS COUNT',
            value: '${employer['postedJobs']} Active Jobs',
            valueColor: primaryBlue,
          ),
        ],
      ),
    );
  }

  Widget _detailItem({
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
            color: greyColor,
            fontSize: 8,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? navyColor,
            fontSize: 10.5,
            fontWeight: valueColor != null
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // ACTION BUTTONS
  // ------------------------------------------------------------

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 38,
            child: ElevatedButton(
              onPressed: _approvePosts,
              style: ElevatedButton.styleFrom(
                backgroundColor: blueColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Approve Posts',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 9),

        Expanded(
          child: SizedBox(
            height: 38,
            child: OutlinedButton(
              onPressed: _blockAccount,
              style: OutlinedButton.styleFrom(
                foregroundColor: redColor,
                side: const BorderSide(
                  color: redColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Block Account',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // BOTTOM NAVIGATION
  // ------------------------------------------------------------

  Widget _buildBottomNavigation() {
    return Container(
      height: 58,
      decoration:  BoxDecoration(
        color: bottomColor,
      ),
      child: Row(
        children: [
          _bottomItem(
            icon: Icons.dashboard_outlined,
            title: 'Dashboard',
            selected: false,
          ),
          _bottomItem(
            icon: Icons.person_outline,
            title: 'Users',
            selected: false,
          ),
          _bottomItem(
            icon: Icons.business_center_outlined,
            title: 'Employers',
            selected: true,
          ),
          _bottomItem(
            icon: Icons.business_outlined,
            title: 'Companies',
            selected: false,
          ),
        ],
      ),
    );
  }

  Widget _bottomItem({
    required IconData icon,
    required String title,
    required bool selected,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFF397184)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 19,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}