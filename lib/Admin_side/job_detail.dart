
import 'package:flutter/material.dart';
import '../references/reference.dart';

class JobDetailPage extends StatefulWidget {
  final Map<String, dynamic> job;

  const JobDetailPage({
    super.key,
    required this.job,
  });

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  late String _status;

  @override
  void initState() {
    super.initState();
    _status = widget.job['status']?.toString() ?? 'Active';
  }

  Future<void> _deactivateJob() async {
    final shouldChange = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          _status == 'Active' ? 'Deactivate job?' : 'Activate job?',
        ),
        content: Text(
          _status == 'Active'
              ? 'This job will be marked as closed.'
              : 'This job will be marked as active.',
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(dialogContext, true),
            child: Text(
              _status == 'Active' ? 'Deactivate' : 'Activate',
            ),
          ),
        ],
      ),
    );

    if (shouldChange == true && mounted) {
      setState(() {
        _status = _status == 'Active' ? 'Closed' : 'Active';
        widget.job['status'] = _status;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Job status updated to $_status'),
        ),
      );
    }
  }

  Future<void> _editJob() async {
    final titleController = TextEditingController(
      text: widget.job['title']?.toString() ?? '',
    );

    final companyController = TextEditingController(
      text: widget.job['company']?.toString() ?? '',
    );

    final descriptionController = TextEditingController(
      text: widget.job['description']?.toString() ?? '',
    );

    final saved = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Job Details'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Job title',
                ),
              ),
              TextField(
                controller: companyController,
                decoration: const InputDecoration(
                  labelText: 'Company',
                ),
              ),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(dialogContext, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (saved == true && mounted) {
      setState(() {
        if (titleController.text.trim().isNotEmpty) {
          widget.job['title'] = titleController.text.trim();
        }

        if (companyController.text.trim().isNotEmpty) {
          widget.job['company'] = companyController.text.trim();
        }

        if (descriptionController.text.trim().isNotEmpty) {
          widget.job['description'] =
              descriptionController.text.trim();
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Job details updated for this session'),
        ),
      );
    }

    titleController.dispose();
    companyController.dispose();
    descriptionController.dispose();
  }

  Color get _statusColor {
    switch (_status) {
      case 'Active':
        return const Color(0xFF168348);
      case 'Closed':
        return redColor;
      default:
        return const Color(0xFF9A6700);
    }
  }

  Color get _statusBackground {
    switch (_status) {
      case 'Active':
        return const Color(0xFFE5F9EC);
      case 'Closed':
        return const Color(0xFFFFEEEE);
      default:
        return const Color(0xFFFFF4D9);
    }
  }

  @override
  Widget build(BuildContext context) {
    final job = widget.job;

    final requirements =
        (job['requirements'] as List?)?.cast<String>() ??
            <String>[];

    return Scaffold(
      backgroundColor: backgroundColor,

      // APP BAR
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: blueColor,
            size: 21,
          ),
        ),
        title: Text(
          'Job Details',
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_rounded,
              color: greyColor,
              size: 21,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: avatarColor,
              child: const Text(
                'SA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      // JOB DETAILS CONTENT
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
          children: [
            // JOB INFORMATION CARD
            _DetailCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              job['title']?.toString() ??
                                  'Job title',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              job['company']?.toString() ??
                                  'Company',
                              style: TextStyle(
                                color: greyColor,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _statusBackground,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _status,
                          style: TextStyle(
                            color: _statusColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  Divider(height: 1, color: borderColor),
                  const SizedBox(height: 10),
                  _DetailLabelValue(
                    label: 'LOCATION',
                    value: job['workplace']?.toString() ??
                        job['location']?.toString() ??
                        'Not specified',
                  ),
                  const SizedBox(height: 8),
                  _DetailLabelValue(
                    label: 'SALARY PACKAGE',
                    value: job['package']?.toString() ??
                        job['salary']?.toString() ??
                        'Not specified',
                  ),
                  const SizedBox(height: 8),
                  _DetailLabelValue(
                    label: 'APPLICATIONS RECEIVED',
                    value: '${job['applicants'] ?? 0} applicants',
                    valueColor: blueColor,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // DESCRIPTION AND REQUIREMENTS
            _DetailCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Job Description',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    job['description']?.toString() ??
                        'No description provided.',
                    style: TextStyle(
                      color: greyColor,
                      fontSize: 10,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: borderColor),
                  const SizedBox(height: 10),
                  Text(
                    'Requirements',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (requirements.isEmpty)
                    Text(
                      'No requirements listed.',
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 10,
                      ),
                    )
                  else
                    ...requirements.map(
                          (requirement) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Icon(
                                Icons.circle,
                                size: 4,
                                color: greyColor,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Expanded(
                              child: Text(
                                requirement,
                                style: TextStyle(
                                  color: greyColor,
                                  fontSize: 10,
                                  height: 1.35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ACTION BUTTONS
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: ElevatedButton(
                      onPressed: _editJob,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Edit Job Details',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: OutlinedButton(
                      onPressed: _deactivateJob,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: redColor,
                        side: BorderSide(color: redColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        _status == 'Active'
                            ? 'Deactivate Job'
                            : 'Activate Job',
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

      // BOTTOM NAVIGATION
      bottomNavigationBar: _DetailBottomBar(
        onJobsTap: () => Navigator.pop(context),
      ),
    );
  }
}

// ================================================================
// DETAIL CARD
// ================================================================

class _DetailCard extends StatelessWidget {
  final Widget child;

  const _DetailCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: child,
    );
  }
}

// ================================================================
// LABEL AND VALUE
// ================================================================

class _DetailLabelValue extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailLabelValue({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: greyColor,
            fontSize: 8,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? textColor,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ================================================================
// BOTTOM NAVIGATION
// ================================================================

class _DetailBottomBar extends StatelessWidget {
  final VoidCallback onJobsTap;

  const _DetailBottomBar({
    required this.onJobsTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.dashboard_outlined, 'Dashboard'),
      (Icons.people_outline_rounded, 'Users'),
      (Icons.work_outline_rounded, 'Jobs'),
      (Icons.description_outlined, 'Apps'),
      (Icons.menu_rounded, 'More'),
    ];

    return Container(
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
          child: Row(
            children: List.generate(items.length, (index) {
              final selected = index == 2;

              return Expanded(
                child: InkWell(
                  onTap: selected
                      ? onJobsTap
                      : () {
                    Navigator.of(context).popUntil(
                          (route) => route.isFirst,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? avatarColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          items[index].$1,
                          size: 15,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          items[index].$2,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 8,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
