import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:job_portal/User_side/profile.dart';
import '../Riverpod/profileprovider.dart';
import '../references/reference.dart';
import 'job_details_page.dart';


// ============================================================
// SELECTED FILTER PROVIDER
// 0 = All Jobs
// 1 = Full Time
// 2 = Part Time
// 3 = Remote
// ============================================================

final selectedJobFilterProvider = StateProvider<int>((ref) {
  return 0;
});


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
  // FILTERED JOBS
  // ============================================================

  List<Map<String, dynamic>> filteredJobs(
      List<Map<String, dynamic>> jobs,
      int selectedFilter,
      ) {
    return jobs.where((job) {
      if (selectedFilter == 0) {
        return true;
      } else if (selectedFilter == 1) {
        return job["type"] == "Full Time";
      } else if (selectedFilter == 2) {
        return job["type"] == "Part Time";
      } else if (selectedFilter == 3) {
        return job["type"] == "Remote";
      }

      return true;
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
        builder: (context) {
          return JobDetailsPage(
            job: job,
            onApply: () {},
          );
        },
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

    final filteredJobs = ref.watch(filteredJobsProvider);

    // Read selected filter from Riverpod
    final selectedFilter = ref.watch(selectedJobFilterProvider,
    );

    // Apply filter
    final List<Map<String, dynamic>> jobsList = filteredJobs;

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Column(
          children: [

            // ======================================================
            // HEADER
            // ======================================================

            Container(
              width: double.infinity,

              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),

              decoration: const BoxDecoration(
                color: Color(0xFFFFFCF7),

                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE8E8E8),
                    width: 1,
                  ),
                ),
              ),

              child: SizedBox(
                height: 42,

                child: Row(
                  children: [

                    const Text(
                      "Find Jobs",

                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: fontweight,
                        color: Color(0xFF17233B),
                      ),
                    ),

                    const Spacer(),

                    InkWell(
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

                        decoration: const BoxDecoration(
                          color: Color(0xFF3D687A),
                          shape: BoxShape.circle,
                        ),

                        child: const Center(
                          child: Text(
                            "RS",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ======================================================
            // CONTENT
            // ======================================================

            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),

                    padding: const EdgeInsets.fromLTRB(
                      20,
                      18,
                      20,
                      40,
                    ),

                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          // ==================================================
                          // STATIC SEARCH FIELD
                          // ==================================================

                          Container(
                            width: double.infinity,

                            padding: const EdgeInsets.all(16),

                            decoration: BoxDecoration(
                              color: Colors.white,

                              border: Border.all(
                                color: borderColor,
                              ),

                              borderRadius:
                              BorderRadius.circular(14),
                            ),

                            child: Column(
                              children: [

                                TextField(
                                  onChanged: (value) {
                                    ref.read(searchqueryprovider.notifier).state = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search by job title, company, or location",

                                    hintStyle:
                                    const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF8A909A),
                                    ),

                                    prefixIcon:
                                    const Icon(
                                      Icons.search,
                                      size: 24,
                                      color: Color(0xFF687386),
                                    ),

                                    filled: true,

                                    fillColor:
                                    const Color(0xFFFFFCF7),

                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 14,
                                    ),

                                    border:
                                    OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),

                                      borderSide:
                                      const BorderSide(
                                        color: Color(0xFFDDE1E7),
                                      ),
                                    ),

                                    enabledBorder:
                                    OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),

                                      borderSide:
                                      const BorderSide(
                                        color: Color(0xFFDDE1E7),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 14),

                                SizedBox(
                                  width: double.infinity,
                                  height: 52,

                                  child: ElevatedButton(
                                    onPressed: null,

                                    style:
                                    ElevatedButton.styleFrom(
                                      backgroundColor:
                                      blueColor,

                                      disabledBackgroundColor:
                                      blueColor,

                                      disabledForegroundColor:
                                      Colors.white,

                                      elevation: 0,

                                      shape:
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                    ),

                                    child: const Text(
                                      "Search Jobs",

                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // ==================================================
                          // FILTERS
                          // ==================================================

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,

                            child: Row(
                              children: [

                                _filterChip(
                                  ref: ref,
                                  title: "All Jobs",
                                  index: 0,
                                  selectedFilter: selectedFilter,
                                ),

                                const SizedBox(width: 8),

                                _filterChip(
                                  ref: ref,
                                  title: "Full Time",
                                  index: 1,
                                  selectedFilter:
                                  selectedFilter,
                                ),

                                const SizedBox(width: 8),

                                _filterChip(
                                  ref: ref,
                                  title: "Part Time",
                                  index: 2,
                                  selectedFilter:
                                  selectedFilter,
                                ),

                                const SizedBox(width: 8),

                                _filterChip(
                                  ref: ref,
                                  title: "Remote",
                                  index: 3,
                                  selectedFilter:
                                  selectedFilter,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // ==================================================
                          // JOB LIST
                          // ==================================================

                          if (jobsList.isEmpty)
                            _noJobsWidget()
                          else
                            Column(
                              children: List.generate(
                                jobsList.length,
                                    (index) {
                                  final job =
                                  jobsList[index];

                                  return Padding(
                                    padding:
                                    const EdgeInsets.only(
                                      bottom: 14,
                                    ),

                                    child: _jobCard(
                                      context: context,
                                      job: job,
                                    ),
                                  );
                                },
                              ),
                            ),

                          const SizedBox(height: 10),

                          // ==================================================
                          // VIEW ALL JOBS
                          // ==================================================

                          if (jobsList.isNotEmpty)
                            Center(
                              child: GestureDetector(
                                onTap: () {},

                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),

                                  child: Text(
                                    "View All Jobs →",

                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight:
                                      FontWeight.w600,
                                      color: blueColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
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
    required int index,
    required int selectedFilter,
  }) {
    final bool selected =
        selectedFilter == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        ref
            .read(selectedJobFilterProvider.notifier)
            .state = index;
      },

      child: Container(
        height: 42,

        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),

        decoration: BoxDecoration(
          color: selected
              ? blueColor
              : Colors.white,

          border: Border.all(
            color: selected
                ? blueColor
                : const Color(0xFFE0E3E8),
          ),

          borderRadius:
          BorderRadius.circular(22),
        ),

        child: Center(
          child: Text(
            title,

            style: TextStyle(
              fontSize: 14,

              color: selected
                  ? Colors.white
                  : const Color(0xFF687386),

              fontWeight: selected
                  ? FontWeight.w600
                  : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // NO JOBS WIDGET
  // ============================================================

  Widget _noJobsWidget() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        vertical: 60,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(
          color: borderColor,
        ),

        borderRadius:
        BorderRadius.circular(14),
      ),

      child: Column(
        children: [

          Icon(
            Icons.search_off,
            size: 60,
            color: Colors.grey.shade400,
          ),

          const SizedBox(height: 15),

          const Text(
            "No Jobs Found",

            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF17233B),
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            "No jobs are available for this filter.",

            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF7B808A),
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
    return GestureDetector(
      onTap: () {
        openJobDetails(
          context,
          job,
        );
      },

      behavior: HitTestBehavior.opaque,

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,

          border: Border.all(
            color: borderColor,
          ),

          borderRadius:
          BorderRadius.circular(14),

          boxShadow: [
            BoxShadow(
              color:
              Colors.black.withOpacity(0.03),

              blurRadius: 5,

              offset:
              const Offset(0, 2),
            ),
          ],
        ),

        child: Row(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            // ========================================================
            // COMPANY LOGO
            // ========================================================

            Container(
              width: 52,
              height: 52,

              decoration: BoxDecoration(
                color:
                job["companyBackground"],

                borderRadius:
                BorderRadius.circular(10),
              ),

              child: Center(
                child: Text(
                  job["shortName"],

                  style: TextStyle(
                    color:
                    job["companyColor"],

                    fontSize: 15,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 14),

            // ========================================================
            // JOB INFORMATION
            // ========================================================

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    job["title"],

                    maxLines: 2,

                    overflow:
                    TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 17,

                      fontWeight:
                      FontWeight.bold,

                      color:
                      Color(0xFF17233B),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "${job["company"]} • ${job["location"]}",

                    maxLines: 2,

                    overflow:
                    TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 14,

                      color:
                      Color(0xFF7B808A),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,

                    children: [

                      // JOB TYPE

                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),

                        decoration:
                        BoxDecoration(
                          color:
                          job["typeBackground"],

                          borderRadius:
                          BorderRadius.circular(
                            15,
                          ),
                        ),

                        child: Text(
                          job["type"],

                          style: TextStyle(
                            fontSize: 11,

                            color:
                            job["typeColor"],

                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ),

                      // SALARY

                      Text(
                        job["salary"],

                        style:
                        const TextStyle(
                          fontSize: 14,

                          fontWeight:
                          FontWeight.bold,

                          color:
                          Color(0xFF17233B),
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