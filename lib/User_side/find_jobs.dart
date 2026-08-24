import 'package:flutter/material.dart';

class findjobes extends StatefulWidget {
  const findjobes({super.key});

  @override
  State<findjobes> createState() => _FindJobsPageState();
}

class _FindJobsPageState extends State<findjobes> {
  int selectedFilter = 0;

  final TextEditingController searchController =
  TextEditingController();

  final Color backgroundColor = const Color(0xFFFFFCF7);
  final Color navyColor = const Color(0xFF17233B);
  final Color blueColor = const Color(0xFF2864E8);
  final Color borderColor = const Color(0xFFE1E5EB);

  // ============================================================
  // JOB DATA
  // ============================================================

  final List<Map<String, dynamic>> jobs = [
    {
      "shortName": "TCS",
      "companyColor": Color(0xFF2864E8),
      "companyBackground": Color(0xFFEFF5FF),
      "title": "Senior React Developer",
      "company": "TCS",
      "location": "Mumbai",
      "salary": "₹12-18 LPA",
      "type": "Full Time",
      "typeColor": Color(0xFF2864E8),
      "typeBackground": Color(0xFFEFF5FF),
    },
    {
      "shortName": "INF",
      "companyColor": Color(0xFF8B5CF6),
      "companyBackground": Color(0xFFF3EEFF),
      "title": "UI/UX Designer",
      "company": "Infosys",
      "location": "Bangalore",
      "salary": "₹8-14 LPA",
      "type": "Full Time",
      "typeColor": Color(0xFF2864E8),
      "typeBackground": Color(0xFFEFF5FF),
    },
    {
      "shortName": "WIP",
      "companyColor": Color(0xFF00A878),
      "companyBackground": Color(0xFFE8F8F3),
      "title": "Data Analyst",
      "company": "Wipro",
      "location": "Pune",
      "salary": "₹6-10 LPA",
      "type": "Part Time",
      "typeColor": Color(0xFFFF9800),
      "typeBackground": Color(0xFFFFF4E3),
    },
    {
      "shortName": "HCL",
      "companyColor": Color(0xFFFF3B30),
      "companyBackground": Color(0xFFFFEEEE),
      "title": "Backend Developer",
      "company": "HCL",
      "location": "Hyderabad",
      "salary": "₹10-16 LPA",
      "type": "Remote",
      "typeColor": Color(0xFF00A878),
      "typeBackground": Color(0xFFE8F8F3),
    },
    {
      "shortName": "TEM",
      "companyColor": Color(0xFF17233B),
      "companyBackground": Color(0xFFF0F1F3),
      "title": "Marketing Manager",
      "company": "Tech Mahindra",
      "location": "Chennai",
      "salary": "₹7-12 LPA",
      "type": "Full Time",
      "typeColor": Color(0xFF2864E8),
      "typeBackground": Color(0xFFEFF5FF),
    },
  ];

  // ============================================================
  // FILTERED JOBS
  // ============================================================

  List<Map<String, dynamic>> get filteredJobs {
    final searchText =
    searchController.text.trim().toLowerCase();

    return jobs.where((job) {
      bool matchesFilter = true;

      // ALL JOBS
      if (selectedFilter == 0) {
        matchesFilter = true;
      }

      // FULL TIME
      else if (selectedFilter == 1) {
        matchesFilter = job["type"] == "Full Time";
      }

      // PART TIME
      else if (selectedFilter == 2) {
        matchesFilter = job["type"] == "Part Time";
      }

      // REMOTE
      else if (selectedFilter == 3) {
        matchesFilter = job["type"] == "Remote";
      }

      // SEARCH
      bool matchesSearch = true;

      if (searchText.isNotEmpty) {
        matchesSearch =
            job["title"]
                .toString()
                .toLowerCase()
                .contains(searchText) ||
                job["company"]
                    .toString()
                    .toLowerCase()
                    .contains(searchText) ||
                job["location"]
                    .toString()
                    .toLowerCase()
                    .contains(searchText);
      }

      return matchesFilter && matchesSearch;
    }).toList();
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Column(
          children: [

            // ==========================================================
            // HEADER
            // ==========================================================

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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17233B),
                      ),
                    ),

                    const Spacer(),

                    Container(
                      width: 40,
                      height: 40,

                      decoration:
                      const BoxDecoration(
                        color: Color(0xFF3D687A),
                        shape: BoxShape.circle,
                      ),

                      child: const Center(
                        child: Text(
                          "RS",

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ==========================================================
            // CONTENT
            // ==========================================================

            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {

                  return SingleChildScrollView(
                    physics:
                    const BouncingScrollPhysics(),

                    keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior
                        .onDrag,

                    padding:
                    const EdgeInsets.fromLTRB(
                      20,
                      18,
                      20,
                      40,
                    ),

                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight:
                        constraints.maxHeight,
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          // ==================================================
                          // SEARCH CONTAINER
                          // ==================================================

                          Container(
                            width: double.infinity,

                            padding:
                            const EdgeInsets.all(
                              16,
                            ),

                            decoration:
                            BoxDecoration(
                              color: Colors.white,

                              border: Border.all(
                                color: borderColor,
                              ),

                              borderRadius:
                              BorderRadius.circular(
                                14,
                              ),
                            ),

                            child: Column(
                              children: [

                                // SEARCH FIELD
                                TextField(
                                  controller:
                                  searchController,

                                  onChanged: (value) {
                                    setState(() {});
                                  },

                                  textInputAction:
                                  TextInputAction.search,

                                  style:
                                  const TextStyle(
                                    fontSize: 15,
                                    color:
                                    Color(0xFF17233B),
                                  ),

                                  decoration:
                                  InputDecoration(
                                    hintText:
                                    "Search by job title, company, or location",

                                    hintStyle:
                                    const TextStyle(
                                      fontSize: 14,
                                      color:
                                      Color(0xFF8A909A),
                                    ),

                                    prefixIcon:
                                    const Icon(
                                      Icons.search,
                                      size: 24,
                                      color:
                                      Color(0xFF687386),
                                    ),

                                    suffixIcon:
                                    searchController
                                        .text
                                        .isNotEmpty
                                        ? IconButton(
                                      icon:
                                      const Icon(
                                        Icons.clear,
                                        color:
                                        Color(0xFF687386),
                                      ),
                                      onPressed:
                                          () {
                                        searchController
                                            .clear();

                                        setState(
                                              () {},
                                        );
                                      },
                                    )
                                        : null,

                                    filled: true,

                                    fillColor:
                                    const Color(
                                      0xFFFFFCF7,
                                    ),

                                    contentPadding:
                                    const EdgeInsets
                                        .symmetric(
                                      horizontal: 12,
                                      vertical: 14,
                                    ),

                                    border:
                                    OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        10,
                                      ),
                                      borderSide:
                                      const BorderSide(
                                        color:
                                        Color(
                                          0xFFDDE1E7,
                                        ),
                                      ),
                                    ),

                                    enabledBorder:
                                    OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        10,
                                      ),
                                      borderSide:
                                      const BorderSide(
                                        color:
                                        Color(
                                          0xFFDDE1E7,
                                        ),
                                      ),
                                    ),

                                    focusedBorder:
                                    OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        10,
                                      ),
                                      borderSide:
                                      BorderSide(
                                        color:
                                        blueColor,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 14,
                                ),

                                // SEARCH BUTTON
                                SizedBox(
                                  width:
                                  double.infinity,
                                  height: 52,

                                  child:
                                  ElevatedButton(
                                    onPressed: () {
                                      FocusScope.of(
                                        context,
                                      ).unfocus();

                                      setState(() {});
                                    },

                                    style:
                                    ElevatedButton
                                        .styleFrom(
                                      backgroundColor:
                                      blueColor,

                                      foregroundColor:
                                      Colors.white,

                                      elevation: 0,

                                      shape:
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                          10,
                                        ),
                                      ),
                                    ),

                                    child:
                                    const Text(
                                      "Search Jobs",

                                      style:
                                      TextStyle(
                                        color:
                                        Colors.white,
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

                          const SizedBox(
                            height: 20,
                          ),

                          // ==================================================
                          // FILTERS
                          // ==================================================

                          SizedBox(
                            width:
                            double.infinity,

                            child:
                            SingleChildScrollView(
                              scrollDirection:
                              Axis.horizontal,

                              child: Row(
                                children: [

                                  _filterChip(
                                    title:
                                    "All Jobs",
                                    index: 0,
                                  ),

                                  const SizedBox(
                                    width: 8,
                                  ),

                                  _filterChip(
                                    title:
                                    "Full Time",
                                    index: 1,
                                  ),

                                  const SizedBox(
                                    width: 8,
                                  ),

                                  _filterChip(
                                    title:
                                    "Part Time",
                                    index: 2,
                                  ),

                                  const SizedBox(
                                    width: 8,
                                  ),

                                  _filterChip(
                                    title:
                                    "Remote",
                                    index: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          // ==================================================
                          // JOB LIST
                          // ==================================================

                          if (filteredJobs.isEmpty)
                            _noJobsWidget()
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              List.generate(
                                filteredJobs.length,
                                    (index) {

                                  final job = filteredJobs[index];

                                  return Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                      bottom: 14,
                                    ),

                                    child:
                                    _jobCard(
                                      companyShortName:
                                      job[
                                      "shortName"],

                                      companyColor:
                                      job[
                                      "companyColor"],

                                      companyBackground:
                                      job[
                                      "companyBackground"],

                                      jobTitle:
                                      job[
                                      "title"],

                                      companyName:
                                      job[
                                      "company"],

                                      location:
                                      job[
                                      "location"],

                                      salary:
                                      job[
                                      "salary"],

                                      jobType:
                                      job[
                                      "type"],

                                      jobTypeColor:
                                      job[
                                      "typeColor"],

                                      jobTypeBackground:
                                      job[
                                      "typeBackground"],
                                    ),
                                  );
                                },
                              ),
                            ),

                          const SizedBox(
                            height: 10,
                          ),

                          // ==================================================
                          // VIEW ALL
                          // ==================================================

                          if (filteredJobs.isNotEmpty)
                            Center(
                              child:
                              GestureDetector(
                                onTap: () {
                                  // Navigate to all jobs page
                                },

                                child:
                                const Padding(
                                  padding:
                                  EdgeInsets
                                      .symmetric(
                                    vertical: 8,
                                  ),

                                  child: Text(
                                    "View All Jobs →",

                                    style:
                                    TextStyle(
                                      fontSize: 15,
                                      fontWeight:
                                      FontWeight
                                          .w600,
                                      color:
                                      Color(
                                        0xFF2864E8,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          const SizedBox(
                            height: 10,
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
  // NO JOBS
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
            "Try another job title, company, location or filter.",

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
  // FILTER CHIP
  // ============================================================

  Widget _filterChip({
    required String title,
    required int index,
  }) {
    final bool selected =
        selectedFilter == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        setState(() {
          selectedFilter = index;
        });
      },

      child: Container(
        height: 42,

        padding:
        const EdgeInsets.symmetric(
          horizontal: 18,
        ),

        decoration: BoxDecoration(
          color: selected
              ? blueColor
              : Colors.white,

          border: Border.all(
            color: selected
                ? blueColor
                : const Color(
              0xFFE0E3E8,
            ),
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
                  : const Color(
                0xFF687386,
              ),

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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        // Open job details page
      },

      child: Container(
        width: double.infinity,

        padding:
        const EdgeInsets.all(16),

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
              Colors.black.withOpacity(
                0.03,
              ),

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
                companyBackground,

                borderRadius:
                BorderRadius.circular(
                  10,
                ),
              ),

              child: Center(
                child: Text(
                  companyShortName,

                  style: TextStyle(
                    color: companyColor,
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
                    jobTitle,

                    maxLines: 2,

                    overflow:
                    TextOverflow.ellipsis,

                    style:
                    const TextStyle(
                      fontSize: 17,
                      fontWeight:
                      FontWeight.bold,
                      color:
                      Color(0xFF17233B),
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(
                    "$companyName • $location",

                    maxLines: 2,

                    overflow:
                    TextOverflow.ellipsis,

                    style:
                    const TextStyle(
                      fontSize: 14,
                      color:
                      Color(0xFF7B808A),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // JOB TYPE + SALARY
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,

                    children: [

                      // JOB TYPE
                      Container(
                        padding:
                        const EdgeInsets
                            .symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),

                        decoration:
                        BoxDecoration(
                          color:
                          jobTypeBackground,

                          borderRadius:
                          BorderRadius
                              .circular(
                            15,
                          ),
                        ),

                        child: Text(
                          jobType,

                          style:
                          TextStyle(
                            fontSize: 11,
                            color:
                            jobTypeColor,
                            fontWeight:
                            FontWeight
                                .w600,
                          ),
                        ),
                      ),

                      // SALARY
                      Text(
                        salary,

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