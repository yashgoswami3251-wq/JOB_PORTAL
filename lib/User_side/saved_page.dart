import 'package:flutter/material.dart';
import 'job_details_page.dart';

class SavedPage extends StatefulWidget {
  final VoidCallback onApply;

  const SavedPage({
    super.key,
    required this.onApply,
  });

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  // ============================================================
  // COLORS
  // ============================================================

  final Color backgroundColor = const Color(0xFFFFFCF7);
  final Color navyColor = const Color(0xFF17233B);
  final Color blueColor = const Color(0xFF2864E8);
  final Color borderColor = const Color(0xFFE1E5EB);

  // ============================================================
  // SAVED JOBS
  // ============================================================

  final List<Map<String, dynamic>> savedJobs = [
    {
      "shortName": "TCS",
      "companyColor": const Color(0xFF2864E8),
      "companyBackground": const Color(0xFFEFF5FF),

      "title": "Senior React Developer",
      "company": "TCS",
      "location": "Mumbai",

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
        "Write unit and integration tests to ensure code quality.",
        "Provide technical mentorship and run comprehensive code reviews.",
      ],

      "requirements": [
        "Minimum 3-5 years of experience building modern applications with React.",
        "Expert knowledge of JavaScript, TypeScript, and React.",
        "Strong understanding of REST APIs and GraphQL.",
        "Experience with Git and modern development workflows.",
        "Good understanding of responsive web design.",
      ],
    },

    {
      "shortName": "INF",
      "companyColor": const Color(0xFF8B5CF6),
      "companyBackground": const Color(0xFFF3EEFF),

      "title": "Product Manager",
      "company": "Infosys",
      "location": "Bangalore",

      "salary": "₹15-22 LPA",
      "type": "Full Time",

      "typeColor": const Color(0xFF2864E8),
      "typeBackground": const Color(0xFFEFF5FF),

      "experience": "3-6 years",
      "postedDate": "Jan 18, 2024",

      "description":
      "We are looking for an experienced Product Manager to "
          "lead product development and work closely with design, "
          "engineering, and business teams.",

      "responsibilities": [
        "Define product vision and roadmap.",
        "Work with engineering and design teams.",
        "Analyze customer requirements.",
        "Monitor product performance.",
      ],

      "requirements": [
        "3-6 years of product management experience.",
        "Strong communication and leadership skills.",
        "Good understanding of product development.",
        "Experience working with Agile teams.",
      ],
    },

    {
      "shortName": "WIP",
      "companyColor": const Color(0xFF00A878),
      "companyBackground": const Color(0xFFE8F8F3),

      "title": "Full Stack Developer",
      "company": "Wipro",
      "location": "Pune",

      "salary": "₹10-15 LPA",
      "type": "Full Time",

      "typeColor": const Color(0xFF2864E8),
      "typeBackground": const Color(0xFFEFF5FF),

      "experience": "2-5 years",
      "postedDate": "Jan 15, 2024",

      "description":
      "Wipro is looking for a Full Stack Developer to develop "
          "modern and scalable web applications using frontend "
          "and backend technologies.",

      "responsibilities": [
        "Develop frontend and backend applications.",
        "Build REST APIs.",
        "Work with databases.",
        "Optimize application performance.",
      ],

      "requirements": [
        "Strong knowledge of JavaScript.",
        "Experience with React and Node.js.",
        "Knowledge of REST APIs.",
        "Database knowledge.",
      ],
    },
  ];

  // ============================================================
  // OPEN JOB DETAILS
  // ============================================================

  void openJobDetails(Map<String, dynamic> job) {
    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) {
          return JobDetailsPage(
            job: job,

            // When Apply Now is clicked,
            // JobDetailsPage will call this function.
            onApply: widget.onApply,
          );
        },
      ),
    );
  }

  // ============================================================
  // REMOVE SAVED JOB
  // ============================================================

  void removeSavedJob(int index) {
    setState(() {
      savedJobs.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Job removed from saved jobs"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: Column(
          children: [
            // ====================================================
            // HEADER
            // ====================================================

            Container(
              width: double.infinity,
              height: 64,

              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),

              decoration: const BoxDecoration(
                color: Color(0xFFFFFCF7),

                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE8E8E8),
                  ),
                ),
              ),

              child: Row(
                children: [
                  const Text(
                    "Saved Jobs",

                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17233B),
                    ),
                  ),

                  const Spacer(),

                  Container(
                    width: 36,
                    height: 36,

                    decoration: const BoxDecoration(
                      color: Color(0xFF3D687A),
                      shape: BoxShape.circle,
                    ),

                    child: const Center(
                      child: Text(
                        "RS",

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

            // ====================================================
            // CONTENT
            // ====================================================

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                padding: const EdgeInsets.fromLTRB(
                  20,
                  18,
                  20,
                  30,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    if (savedJobs.isEmpty)
                      _emptySavedJobs()
                    else
                      Column(
                        children: List.generate(
                          savedJobs.length,

                              (index) {
                            final job = savedJobs[index];

                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 12,
                              ),

                              child: _savedJobCard(
                                job: job,
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),

                    const SizedBox(height: 12),

                    if (savedJobs.isNotEmpty)
                      Center(
                        child: GestureDetector(
                          onTap: () {},

                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                            ),

                            child: Text(
                              "View All Saved Jobs →",

                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2864E8),
                              ),
                            ),
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
    );
  }

  // ============================================================
  // SAVED JOB CARD
  // ============================================================

  Widget _savedJobCard({
    required Map<String, dynamic> job,
    required int index,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.fromLTRB(
        13,
        13,
        13,
        12,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(
          color: borderColor,
        ),

        borderRadius: BorderRadius.circular(12),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        children: [
          // ======================================================
          // TOP
          // ======================================================

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                width: 42,
                height: 42,

                decoration: BoxDecoration(
                  color: job["companyBackground"],
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Center(
                  child: Text(
                    job["shortName"],

                    style: TextStyle(
                      color: job["companyColor"],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      job["title"],

                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17233B),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "${job["company"]} • ${job["location"]}",

                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF7B808A),
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================
              // REMOVE
              // ==================================================

              GestureDetector(
                onTap: () {
                  removeSavedJob(index);
                },

                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    top: 2,
                  ),

                  child: Text(
                    "−",

                    style: TextStyle(
                      color: Color(0xFFFF3B30),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ======================================================
          // BOTTOM
          // ======================================================

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      job["salary"],

                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17233B),
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      "Posted Saved ${job["postedDate"]}",

                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF7B808A),
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================
              // VIEW JOB
              // ==================================================

              SizedBox(
                height: 38,

                child: ElevatedButton(
                  onPressed: () {
                    openJobDetails(job);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                    foregroundColor: Colors.white,
                    elevation: 0,

                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),

                  child: const Text(
                    "View Job",

                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // EMPTY
  // ============================================================

  Widget _emptySavedJobs() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        vertical: 70,
      ),

      child: Column(
        children: [
          Icon(
            Icons.bookmark_border,
            size: 60,
            color: Colors.grey.shade400,
          ),

          const SizedBox(height: 15),

          const Text(
            "No Saved Jobs",

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF17233B),
            ),
          ),

          const SizedBox(height: 7),

          const Text(
            "Jobs you save will appear here.",

            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF7B808A),
            ),
          ),
        ],
      ),
    );
  }
}