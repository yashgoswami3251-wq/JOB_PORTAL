import 'package:flutter/material.dart';
import '../references/reference.dart';
import 'edit_employe.dart';
import 'employe_detail.dart';

class EmployersPage extends StatefulWidget {
  const EmployersPage({super.key});

  @override
  State<EmployersPage> createState() => _EmployersPageState();
}

class _EmployersPageState extends State<EmployersPage> {
  final TextEditingController _searchController = TextEditingController();

  String _searchText = '';

  final List<Map<String, dynamic>> employers = [
    {
      'name': 'TechSolutions Pvt Ltd',
      'contact': 'Raj Kumar',
      'postedJobs': 12,
      'status': 'Active',
      'logo': 'T',
      'email': 'hr@techsolutions.com',
      'phone': '+91 98765 43210',
      'location': 'Ahmedabad, India',
      'companyType': 'Enterprise Employer',
    },
    {
      'name': 'InfoByte Systems',
      'contact': 'Priya Sharma',
      'postedJobs': 8,
      'status': 'Active',
      'logo': 'I',
      'email': 'hr@infobyte.com',
      'phone': '+91 98765 12345',
      'location': 'Bangalore, India',
      'companyType': 'Corporate Employer',
    },
    {
      'name': 'Wipro',
      'contact': 'HR Team',
      'postedJobs': 22,
      'status': 'Pending',
      'logo': 'W',
      'email': 'hr@wipro.com',
      'phone': '+91 80 2844 0011',
      'location': 'Bangalore, India',
      'companyType': 'Enterprise Employer',
    },
    {
      'name': 'Tech Mahindra',
      'contact': 'Verification Officer',
      'postedJobs': 15,
      'status': 'Blocked',
      'logo': 'T',
      'email': 'hr@techmahindra.com',
      'phone': '+91 20 6601 8100',
      'location': 'Pune, India',
      'companyType': 'Enterprise Employer',
    },
    {
      'name': 'Tata Consultancy Services',
      'contact': 'HR Department',
      'postedJobs': 45,
      'status': 'Active',
      'logo': 'TCS',
      'email': 'hr@tcs.com',
      'phone': '+91 22 6778 9999',
      'location': 'Mumbai, India',
      'companyType': 'Enterprise Employer',
    },
  ];

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get filteredEmployers {
    if (_searchText.isEmpty) {
      return employers;
    }

    return employers.where((employer) {
      final name = employer['name'].toString().toLowerCase();
      final contact = employer['contact'].toString().toLowerCase();
      final status = employer['status'].toString().toLowerCase();

      return name.contains(_searchText) ||
          contact.contains(_searchText) ||
          status.contains(_searchText);
    }).toList();
  }

  void _openEmployerDetails(Map<String, dynamic> employer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmployerDetailPage(
          employer: employer,
        ),
      ),
    );
  }

  Color _getStatusBackground(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return const Color(0xFFE1F8EA);

      case 'pending':
        return const Color(0xFFFFF3CD);

      case 'blocked':
        return const Color(0xFFFFE3E3);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopHeader(),
            Expanded(
              child: _buildEmployerList(),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // TOP HEADER
  // ------------------------------------------------------------

  Widget _buildTopHeader() {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
             Expanded(
              child: Text(
                'Employers',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontweight,
                  color: navyColor,
                ),
              ),
            ),

            // Notification
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

            // Profile
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
  // EMPLOYER LIST
  // ------------------------------------------------------------

  Widget _buildEmployerList() {
    final list = filteredEmployers;

    return Column(
      children: [
        // Search
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          child: Container(
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: TextField(
              controller: _searchController,
              style:  TextStyle(
                fontSize: 11,
                color: navyColor,
              ),
              decoration: InputDecoration(
                hintText: 'Search employers...',
                hintStyle: TextStyle(
                  fontSize: 11,
                  color: greyColor,
                ),
                prefixIcon: Icon(
                  Icons.circle,
                  size: 9,
                  color: greyColor,
                ),
                suffixIcon: _searchText.isNotEmpty
                    ? IconButton(
                  onPressed: () {
                    _searchController.clear();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 16,
                    color: greyColor,
                  ),
                )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: list.isEmpty
              ? _buildEmptySearch()
              : ListView.builder(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return _buildEmployerCard(list[index]);
            },
          ),
        ),

        // Footer count
        Padding(
          padding: const EdgeInsets.only(
            bottom: 7,
            top: 2,
          ),
          child: Text(
            _searchText.isEmpty
                ? 'Showing 1-${list.length} of 456 employers'
                : 'Showing ${list.length} employers',
            style: TextStyle(
              fontSize: 9.5,
              color: greyColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptySearch() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.business_outlined,
            size: 42,
            color: borderColor,
          ),
          const SizedBox(height: 10),
          Text(
            'No employers found',
            style: TextStyle(
              color: navyColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // EMPLOYER CARD
  // ------------------------------------------------------------

  Widget _buildEmployerCard(Map<String, dynamic> employer) {
    final String status = employer['status'];

    return GestureDetector(
      onTap: () {
        _openEmployerDetails(employer);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company logo
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: chipColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      employer['logo'],
                      style: TextStyle(
                        color: primaryBlue,
                        fontSize: employer['logo'] == 'TCS' ? 9 : 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Company name/contact
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          employer['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(
                            color: navyColor,
                            fontSize: 11.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Contact: ${employer['contact']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 9.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Status
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusBackground(status),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: _getStatusTextColor(status),
                        fontSize: 8.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Divider(
                height: 1,
                color: borderColor,
              ),

              const SizedBox(height: 7),

              Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Posted: ',
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 9.5,
                        ),
                        children: [
                          TextSpan(
                            text: '${employer['postedJobs']} jobs',
                            style:  TextStyle(
                              color: navyColor,
                              fontSize: 9.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Edit
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EditEmployerPage(employer: employer,)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Icon(
                        Icons.edit_outlined,
                        size: 17,
                        color: primaryBlue,
                      ),
                    ),
                  ),

                  const SizedBox(width: 7),

                  // Delete
                  InkWell(
                    onTap: () {
                      _showDeleteDialog(employer);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.delete_outline,
                        size: 17,
                        color: redColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // ------------------------------------------------------------
  // DELETE
  // ------------------------------------------------------------
  void _showDeleteDialog(Map<String, dynamic> employer) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:  Text(
            'Delete Employer',
            style: TextStyle(
              color: navyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to delete ${employer['name']}?',
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
                  employers.remove(employer);
                });

                Navigator.pop(context);
              },
              child: const Text(
                'Delete',
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