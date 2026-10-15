import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:job_portal/User_side/profile.dart';

import '../Riverpod/profileprovider.dart';
import '../references/reference.dart';
import 'job_details_page.dart';

// ============================================================
// FILTER PROVIDER
// 0 = All Jobs
// 1 = Full Time
// 2 = Part Time
// 3 = Remote
// ============================================================

final selectedJobFilterProvider = StateProvider<int>((ref) => 0);

// ============================================================
// FIND JOBS PAGE
// ============================================================

class findjobes extends ConsumerWidget {
  final VoidCallback onApply;

  const findjobes({
    super.key,
    required this.onApply,
  });

  // ============================================================
  // APPLY JOB TYPE FILTER
  // ============================================================

  List<Map<String, dynamic>> applyJobTypeFilter(
      List<Map<String, dynamic>> jobs,
      int selectedFilter,
      ) {
    if (selectedFilter == 0) {
      return jobs;
    }

    String requiredType = '';

    if (selectedFilter == 1) {
      requiredType = 'Full Time';
    } else if (selectedFilter == 2) {
      requiredType = 'Part Time';
    } else if (selectedFilter == 3) {
      requiredType = 'Remote';
    }

    return jobs.where((job) {
      return (job['type'] ?? '').toString().trim().toLowerCase() ==
          requiredType.toLowerCase();
    }).toList();
  }

  // ============================================================
  // OPEN JOB DETAILS
  // ============================================================

  Future<void> openJobDetails(
      BuildContext context,
      Map<String, dynamic> job,
      ) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JobDetailsPage(
          job: job,
          onApply: () {},
        ),
      ),
    );

    if (result == true) {
      onApply();
    }
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Jobs already filtered by your existing search provider.
    final searchFilteredJobs = ref.watch(filteredJobsProvider);

    final selectedFilter = ref.watch(selectedJobFilterProvider);

    // IMPORTANT: Apply the selected job type filter.
    final List<Map<String, dynamic>> jobsList =
    applyJobTypeFilter(searchFilteredJobs, selectedFilter);

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // ==================================================
            // HEADER
            // ==================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border(
                  bottom: BorderSide(color: borderColor),
                ),
              ),
              child: SizedBox(
                height: 42,
                child: Row(
                  children: [
                    Text(
                      'Find Jobs',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: fontweight,
                        color: navyColor,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: avatarColor,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'RS',
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
              ),
            ),

            // ==================================================
            // CONTENT
            // ==================================================

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SEARCH FIELD
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) {
                              ref.read(searchqueryprovider.notifier).state =
                                  value;
                            },
                            decoration: InputDecoration(
                              hintText:
                              'Search by job title, company, or location',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF8A909A),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 24,
                                color: Color(0xFF687386),
                              ),
                              filled: true,
                              fillColor: backgroundColor,
                              contentPadding:
                              const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: borderColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: borderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: blueColor,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 14),

                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              // Search updates automatically through Riverpod.
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: blueColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Search Jobs',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ==================================================
                    // FILTER CHIPS
                    // ==================================================

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _filterChip(
                            ref: ref,
                            title: 'All Jobs',
                            icon: Icons.work_outline,
                            index: 0,
                            selectedFilter: selectedFilter,
                          ),

                          const SizedBox(width: 8),

                          _filterChip(
                            ref: ref,
                            title: 'Full Time',
                            icon: Icons.business_center_outlined,
                            index: 1,
                            selectedFilter: selectedFilter,
                          ),

                          const SizedBox(width: 8),

                          _filterChip(
                            ref: ref,
                            title: 'Part Time',
                            icon: Icons.schedule,
                            index: 2,
                            selectedFilter: selectedFilter,
                          ),

                          const SizedBox(width: 8),

                          _filterChip(
                            ref: ref,
                            title: 'Remote',
                            icon: Icons.home_work_outlined,
                            index: 3,
                            selectedFilter: selectedFilter,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ==================================================
                    // RESULTS COUNT
                    // ==================================================

                    Text(
                      '${jobsList.length} Jobs Found',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ==================================================
                    // JOB LIST
                    // ==================================================

                    if (jobsList.isEmpty)
                      _noJobsWidget()
                    else
                      ...jobsList.map((job) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: _jobCard(
                            context: context,
                            job: job,
                          ),
                        );
                      }),
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
  // FILTER CHIP
  // ============================================================

  Widget _filterChip({
    required WidgetRef ref,
    required String title,
    required IconData icon,
    required int index,
    required int selectedFilter,
  }) {
    final bool selected = selectedFilter == index;

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        ref.read(selectedJobFilterProvider.notifier).state = index;
      },
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: selected ? blueColor : Colors.white,
          border: Border.all(
            color: selected ? blueColor : borderColor,
          ),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 17,
              color: selected ? Colors.white : greyColor,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                color: selected ? Colors.white : greyColor,
                fontWeight:
                selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // NO JOBS FOUND
  // ============================================================

  Widget _noJobsWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            size: 55,
            color: greyColor,
          ),
          const SizedBox(height: 15),
          Text(
            'No Jobs Found',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'No jobs are available for this filter.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: greyColor,
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
    required BuildContext context,
    required Map<String, dynamic> job,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        openJobDetails(context, job);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // COMPANY LOGO
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: job['companyBackground'] ?? chipColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                job['shortName']?.toString() ?? 'JB',
                style: TextStyle(
                  color: job['companyColor'] ?? blueColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 14),

            // JOB INFORMATION
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job['title']?.toString() ?? 'Job Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    '${job['company'] ?? 'Company'} • '
                        '${job['location'] ?? 'Location'}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: greyColor,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // JOB TYPE
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: job['typeBackground'] ?? chipColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          job['type']?.toString() ?? 'Full Time',
                          style: TextStyle(
                            fontSize: 11,
                            color: job['typeColor'] ?? blueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      // SALARY
                      Text(
                        job['salary']?.toString() ?? 'Salary not specified',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
