import 'package:flutter/material.dart';
import 'job_details_page.dart';

class findjobes extends StatefulWidget {
  final VoidCallback onApply;

  const findjobes({
    super.key,
    required this.onApply,
  });

  @override
  State<findjobes> createState() => _FindJobsPageState();
}

class _FindJobsPageState extends State<findjobes> {
  int selectedFilter = 0;

  final TextEditingController searchController =
  TextEditingController();

  final Color backgroundColor =
  const Color(0xFFFFFCF7);

  final Color navyColor =
  const Color(0xFF17233B);

  final Color blueColor =
  const Color(0xFF2864E8);

  final Color borderColor =
  const Color(0xFFE1E5EB);

  // ============================================================
  // JOB DATA
  // ============================================================

  final List<Map<String, dynamic>> jobs = [
    {
      "shortName": "TCS",
      "companyColor": const Color(0xFF2864E8),
      "companyBackground": const Color(0xFFEFF5FF),
      "title": "Senior React Developer",
      "company": "TCS",
      "location": "Mumbai, Maharashtra",
      "salary": "₹12-18 LPA",
      "type": "Full Time",
      "typeColor": const Color(0xFF2864E8),
      "typeBackground": const Color(0xFFEFF5FF),
      "experience": "3-5 years",
      "postedDate": "Jan 20, 2024",
      "description":
      "We are looking for a highly skilled Senior React Developer "
          "to join our growing development team. In this role, you will "
          "be responsible for architecting, building, and deploying "
          "highly responsive, pixel-perfect user interfaces. You will "
          "work closely with product managers and designers to translate "
          "product visions into scalable frontend codebases.",
      "responsibilities": [
        "Design and build scalable and reusable React components from scratch.",
        "Collaborate with backend engineers to integrate RESTful and GraphQL APIs seamlessly.",
        "Optimize application architectures for maximum performance and cross-browser responsiveness.",
        "Write unit and integration tests to ensure code quality and prevent application regressions.",
        "Provide technical mentorship and run comprehensive code reviews for junior engineers.",
      ],
      "requirements": [
        "Minimum 3-5 years of experience building modern single-page applications with React.",
        "Expert knowledge of raw JavaScript, TypeScript, and React.",
        "Strong understanding of REST APIs and GraphQL.",
        "Experience with Git and modern development workflows.",
        "Good understanding of responsive web design.",
      ],
    },

    {
      "shortName": "INF",
      "companyColor": const Color(0xFF8B5CF6),
      "companyBackground": const Color(0xFFF3EEFF),
      "title": "UI/UX Designer",
      "company": "Infosys",
      "location": "Bangalore, Karnataka",
      "salary": "₹8-14 LPA",
      "type": "Full Time",
      "typeColor": const Color(0xFF2864E8),
      "typeBackground": const Color(0xFFEFF5FF),
      "experience": "2-4 years",
      "postedDate": "Jan 18, 2024",
      "description":
      "We are looking for a creative UI/UX Designer who can "
          "create beautiful and user-friendly digital experiences.",
      "responsibilities": [
        "Create wireframes and prototypes.",
        "Design modern and responsive interfaces.",
        "Work closely with developers and product managers.",
        "Conduct user research and usability testing.",
      ],
      "requirements": [
        "2-4 years of UI/UX experience.",
        "Strong knowledge of Figma.",
        "Good understanding of design systems.",
        "Knowledge of responsive design principles.",
      ],
    },

    {
      "shortName": "WIP",
      "companyColor": const Color(0xFF00A878),
      "companyBackground": const Color(0xFFE8F8F3),
      "title": "Data Analyst",
      "company": "Wipro",
      "location": "Pune, Maharashtra",
      "salary": "₹6-10 LPA",
      "type": "Part Time",
      "typeColor": const Color(0xFFFF9800),
      "typeBackground": const Color(0xFFFFF4E3),
      "experience": "1-3 years",
      "postedDate": "Jan 15, 2024",
      "description":
      "We are seeking a Data Analyst to analyze business data "
          "and provide meaningful insights to help our organization "
          "make better decisions.",
      "responsibilities": [
        "Analyze large datasets.",
        "Create reports and dashboards.",
        "Work with business teams.",
        "Identify trends and patterns.",
      ],
      "requirements": [
        "Knowledge of SQL.",
        "Knowledge of Excel.",
        "Basic Python knowledge.",
        "Good analytical and communication skills.",
      ],
    },

    {
      "shortName": "HCL",
      "companyColor": const Color(0xFFFF3B30),
      "companyBackground": const Color(0xFFFFEEEE),
      "title": "Backend Developer",
      "company": "HCL",
      "location": "Hyderabad, Telangana",
      "salary": "₹10-16 LPA",
      "type": "Remote",
      "typeColor": const Color(0xFF00A878),
      "typeBackground": const Color(0xFFE8F8F3),
      "experience": "2-5 years",
      "postedDate": "Jan 12, 2024",
      "description":
      "HCL is looking for a Backend Developer to build scalable "
          "and reliable server-side applications.",
      "responsibilities": [
        "Develop REST APIs.",
        "Build scalable backend services.",
        "Work with databases.",
        "Optimize backend performance.",
      ],
      "requirements": [
        "Strong knowledge of Node.js or Java.",
        "Knowledge of REST APIs.",
        "Database knowledge.",
        "Good understanding of backend architecture.",
      ],
    },

    {
      "shortName": "TEM",
      "companyColor": const Color(0xFF17233B),
      "companyBackground": const Color(0xFFF0F1F3),
      "title": "Marketing Manager",
      "company": "Tech Mahindra",
      "location": "Chennai, Tamil Nadu",
      "salary": "₹7-12 LPA",
      "type": "Full Time",
      "typeColor": const Color(0xFF2864E8),
      "typeBackground": const Color(0xFFEFF5FF),
      "experience": "3-6 years",
      "postedDate": "Jan 10, 2024",
      "description":
      "We are looking for an experienced Marketing Manager "
          "to manage marketing campaigns and improve brand visibility.",
      "responsibilities": [
        "Plan marketing campaigns.",
        "Manage digital marketing activities.",
        "Analyze marketing performance.",
        "Work with creative teams.",
      ],
      "requirements": [
        "3-6 years marketing experience.",
        "Strong communication skills.",
        "Knowledge of digital marketing.",
        "Strong leadership skills.",
      ],
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

      if (selectedFilter == 0) {
        matchesFilter = true;
      } else if (selectedFilter == 1) {
        matchesFilter = job["type"] == "Full Time";
      } else if (selectedFilter == 2) {
        matchesFilter = job["type"] == "Part Time";
      } else if (selectedFilter == 3) {
        matchesFilter = job["type"] == "Remote";
      }

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

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // ============================================================
  // OPEN JOB DETAILS
  // ============================================================

  void openJobDetails(
      Map<String, dynamic> job) async {
    final result = await Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) {
          return JobDetailsPage(
            job: job,
          );
        },
      ),
    );

    // ==========================================================
    // APPLY BUTTON CLICKED
    // ==========================================================

    if (result == true) {
      widget.onApply();
    }
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

            // ======================================================
            // CONTENT
            // ======================================================

            Expanded(
              child: LayoutBuilder(
                builder:
                    (context, constraints) {
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
                          // SEARCH
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
                                TextField(
                                  controller:
                                  searchController,

                                  onChanged: (value) {
                                    setState(() {});
                                  },

                                  textInputAction:
                                  TextInputAction
                                      .search,

                                  style:
                                  const TextStyle(
                                    fontSize: 15,
                                    color:
                                    Color(
                                      0xFF17233B,
                                    ),
                                  ),

                                  decoration:
                                  InputDecoration(
                                    hintText:
                                    "Search by job title, company, or location",

                                    hintStyle:
                                    const TextStyle(
                                      fontSize: 14,
                                      color:
                                      Color(
                                        0xFF8A909A,
                                      ),
                                    ),

                                    prefixIcon:
                                    const Icon(
                                      Icons.search,
                                      size: 24,
                                      color:
                                      Color(
                                        0xFF687386,
                                      ),
                                    ),

                                    suffixIcon:
                                    searchController
                                        .text
                                        .isNotEmpty
                                        ? IconButton(
                                      icon:
                                      const Icon(
                                        Icons
                                            .clear,
                                        color:
                                        Color(
                                          0xFF687386,
                                        ),
                                      ),
                                      onPressed:
                                          () {
                                        searchController
                                            .clear();

                                        setState(
                                                () {});
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

                                SizedBox(
                                  width:
                                  double.infinity,
                                  height: 52,

                                  child:
                                  ElevatedButton(
                                    onPressed: () {
                                      FocusScope
                                          .of(
                                        context,
                                      ).unfocus();

                                      setState(
                                              () {});
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
                                        FontWeight
                                            .w600,
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
                            width: double.infinity,

                            child:
                            SingleChildScrollView(
                              scrollDirection:
                              Axis.horizontal,

                              child: Row(
                                children: [
                                  _filterChip(
                                    title: "All Jobs",
                                    index: 0,
                                  ),

                                  const SizedBox(
                                    width: 8,
                                  ),

                                  _filterChip(
                                    title: "Full Time",
                                    index: 1,
                                  ),

                                  const SizedBox(
                                    width: 8,
                                  ),

                                  _filterChip(
                                    title: "Part Time",
                                    index: 2,
                                  ),

                                  const SizedBox(
                                    width: 8,
                                  ),

                                  _filterChip(
                                    title: "Remote",
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
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children:
                              List.generate(
                                filteredJobs.length,
                                    (index) {
                                  final job =
                                  filteredJobs[
                                  index];

                                  return Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                      bottom: 14,
                                    ),

                                    child: _jobCard(
                                      job: job,
                                    ),
                                  );
                                },
                              ),
                            ),

                          const SizedBox(
                            height: 10,
                          ),

                          if (filteredJobs.isNotEmpty)
                            Center(
                              child:
                              GestureDetector(
                                onTap: () {},

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
              fontWeight:
              FontWeight.bold,
              color:
              Color(0xFF17233B),
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            "Try another job title, company, location or filter.",

            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 13,
              color:
              Color(0xFF7B808A),
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
      behavior:
      HitTestBehavior.opaque,

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
    required Map<String, dynamic> job,
  }) {
    return GestureDetector(
      onTap: () {
        openJobDetails(job);
      },

      behavior:
      HitTestBehavior.opaque,

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
              color: Colors.black
                  .withOpacity(0.03),

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
            Container(
              width: 52,
              height: 52,

              decoration: BoxDecoration(
                color:
                job["companyBackground"],

                borderRadius:
                BorderRadius.circular(
                  10,
                ),
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

            const SizedBox(
              width: 14,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,

                children: [
                  Text(
                    job["title"],

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
                    "${job["company"]} • ${job["location"]}",

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

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,

                    children: [
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
                          job["typeBackground"],

                          borderRadius:
                          BorderRadius
                              .circular(
                            15,
                          ),
                        ),

                        child: Text(
                          job["type"],

                          style:
                          TextStyle(
                            fontSize: 11,

                            color:
                            job["typeColor"],

                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ),

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