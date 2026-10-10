import 'package:flutter/material.dart';
import '../references/reference.dart';
import 'job_detail.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _jobs = [
    {
      'title': 'Senior Software Engineer',
      'company': 'TechSolutions Pvt Ltd',
      'location': 'Mumbai',
      'salary': '₹12–18 LPA',
      'posted': 'Jan 24, 2024',
      'applicants': 23,
      'status': 'Active',
      'type': 'Full Time',
      'workplace': 'Bangalore, India (Hybrid)',
      'package': '₹8,00,000 – ₹15,00,000 / year',
      'description':
      'We are looking for an experienced engineer to build secure, scalable backend architectures and robust APIs. You will work on microservices, serverless components, and drive optimal engineering standards.',
      'requirements': [
        '3+ years building production Node.js or C# backend services.',
        'In-depth knowledge of database schemas (SQL / NoSQL).',
        'Familiarity with cloud infrastructure (AWS or Azure preferred).',
      ],
    },
    {
      'title': 'UI/UX Designer',
      'company': 'InnoTech Industries',
      'location': 'Bangalore',
      'salary': '₹8–12 LPA',
      'posted': 'Jan 23, 2024',
      'applicants': 14,
      'status': 'Active',
      'type': 'Full Time',
      'workplace': 'Bangalore, India (On-site)',
      'package': '₹8,00,000 – ₹12,00,000 / year',
      'description':
      'We are looking for a creative UI/UX Designer to design simple, accessible, and engaging digital experiences. You will collaborate with product managers and developers.',
      'requirements': [
        'Experience with Figma or similar design tools.',
        'Understanding of user research and wireframing.',
        'A portfolio showing web or mobile app designs.',
      ],
    },
    {
      'title': 'Data Analyst',
      'company': 'DataCorp',
      'location': 'Pune',
      'salary': '₹6–10 LPA',
      'posted': 'Jan 20, 2024',
      'applicants': 9,
      'status': 'Closed',
      'type': 'Full Time',
      'workplace': 'Pune, India (On-site)',
      'package': '₹6,00,000 – ₹10,00,000 / year',
      'description':
      'Analyze business data, build reports, and communicate insights that help teams make informed decisions.',
      'requirements': [
        'Good SQL and spreadsheet skills.',
        'Knowledge of Power BI, Tableau, or similar tools.',
        'Strong analytical and communication skills.',
      ],
    },
    {
      'title': 'Frontend Developer',
      'company': 'BrightWeb Solutions',
      'location': 'Ahmedabad',
      'salary': '₹5–8 LPA',
      'posted': 'Jan 18, 2024',
      'applicants': 18,
      'status': 'Pending',
      'type': 'Full Time',
      'workplace': 'Ahmedabad, India (Hybrid)',
      'package': '₹5,00,000 – ₹8,00,000 / year',
      'description':
      'Build responsive web interfaces and work closely with the design and backend teams to deliver high-quality products.',
      'requirements': [
        'Good knowledge of HTML, CSS, and JavaScript.',
        'Experience with responsive layouts.',
        'Familiarity with Git and REST APIs.',
      ],
    },
  ];

  List<Map<String, dynamic>> get _filteredJobs {
    final query = _searchController.text.trim().toLowerCase();
    return _jobs.where((job) {
      final matchesQuery = query.isEmpty ||
          job['title'].toString().toLowerCase().contains(query) ||
          job['company'].toString().toLowerCase().contains(query) ||
          job['location'].toString().toLowerCase().contains(query);
      final matchesFilter = _selectedFilter == 'All' ||
          job['status'].toString().toLowerCase() ==
              _selectedFilter.toLowerCase();
      return matchesQuery && matchesFilter;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Color _statusBackground(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFFE5F9EC);
      case 'Closed':
        return const Color(0xFFFFEEEE);
      default:
        return const Color(0xFFFFF4D9);
    }
  }

  Color _statusForeground(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFF168348);
      case 'Closed':
        return redColor;
      default:
        return const Color(0xFF9A6700);
    }
  }

  void _openDetails(Map<String, dynamic> job) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => JobDetailPage(job: job)),
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final filters = ['All', 'Active', 'Closed', 'Pending'];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 16,
        title: Text(
          'Manage Jobs',
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded,
                color: greyColor, size: 22),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: avatarColor,
              child: const Text('SA',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 2, 14, 10),
            child: TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              style: TextStyle(color: textColor, fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Search jobs...',
                hintStyle: TextStyle(color: greyColor, fontSize: 12),
                prefixIcon: Icon(Icons.search_rounded,
                    color: greyColor, size: 18),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: borderColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: borderColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: blueColor)),
              ),
            ),
          ),
          SizedBox(
            height: 31,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 6),
              itemBuilder: (context, index) {
                final filter = filters[index];
                final selected = _selectedFilter == filter;
                return ChoiceChip(
                  label: Text(filter),
                  selected: selected,
                  onSelected: (_) => setState(() => _selectedFilter = filter),
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : textColor,
                    fontSize: 10,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: blueColor,
                  side: BorderSide(color: selected ? blueColor : borderColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _filteredJobs.isEmpty
                ? Center(
              child: Text('No jobs found',
                  style: TextStyle(color: greyColor, fontSize: 13)),
            )
                : ListView.separated(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
              itemCount: _filteredJobs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 9),
              itemBuilder: (context, index) {
                final job = _filteredJobs[index];
                return _JobCard(
                  job: job,
                  statusBackground: _statusBackground(job['status']),
                  statusForeground: _statusForeground(job['status']),
                  onTap: () => _openDetails(job),
                  onEdit: () => _openDetails(job),
                  onDelete: () => _confirmDelete(job),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(Map<String, dynamic> job) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete job?'),
        content: Text('Are you sure you want to remove "${job['title']}"?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Delete', style: TextStyle(color: Colors.red))),
        ],
      ),
    );
    if (confirm == true && mounted) {
      setState(() => _jobs.remove(job));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Job removed from this demo list')),
      );
    }
  }
}

class _JobCard extends StatelessWidget {
  final Map<String, dynamic> job;
  final Color statusBackground;
  final Color statusForeground;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _JobCard({
    required this.job,
    required this.statusBackground,
    required this.statusForeground,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job['title'], maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: textColor, fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 2),
                      Text(job['company'], maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: greyColor, fontSize: 10)),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(color: statusBackground,
                      borderRadius: BorderRadius.circular(3)),
                  child: Text(job['status'], style: TextStyle(
                      color: statusForeground, fontSize: 9,
                      fontWeight: FontWeight.w600)),
                ),
              ]),
              const SizedBox(height: 10),
              Divider(height: 1, color: borderColor),
              const SizedBox(height: 7),
              Row(children: [
                Expanded(child: _InfoText(label: 'Location: ', value: job['location'])),
                _InfoText(label: 'Salary: ', value: job['salary'], alignEnd: true),
              ]),
              const SizedBox(height: 4),
              Row(children: [
                Expanded(child: _InfoText(label: 'Posted: ', value: job['posted'])),
                Text('${job['applicants']} apps', style: TextStyle(
                    color: blueColor, fontSize: 9, fontWeight: FontWeight.w600)),
              ]),
              const SizedBox(height: 7),
              Divider(height: 1, color: borderColor),
              const SizedBox(height: 5),
              Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onTap,
                    child: Text('View Details', style: TextStyle(
                        color: blueColor, fontSize: 10,
                        fontWeight: FontWeight.w500)),
                  ),
                ),
                IconButton(
                  onPressed: onEdit,
                  visualDensity: VisualDensity.compact,
                  constraints: const BoxConstraints(minWidth: 30, minHeight: 28),
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.edit_outlined, size: 16, color: blueColor),
                ),
                IconButton(
                  onPressed: onDelete,
                  visualDensity: VisualDensity.compact,
                  constraints: const BoxConstraints(minWidth: 26, minHeight: 28),
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.delete_outline_rounded, size: 17, color: redColor),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  final String label;
  final String value;
  final bool alignEnd;

  const _InfoText({required this.label, required this.value, this.alignEnd = false});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: label, style: TextStyle(color: greyColor, fontSize: 9)),
        TextSpan(text: value, style: TextStyle(color: textColor, fontSize: 9,
            fontWeight: FontWeight.w500)),
      ]),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: alignEnd ? TextAlign.end : TextAlign.start,
    );
  }
}
