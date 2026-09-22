import 'package:flutter/material.dart';
import '../references/reference.dart';

class MyJobPostingsPage extends StatefulWidget {
  const MyJobPostingsPage({super.key});

  @override
  State<MyJobPostingsPage> createState() => _MyJobPostingsPageState();
}

class _MyJobPostingsPageState extends State<MyJobPostingsPage> {
  // ------------------------------------------------------------
  // Selected Filter
  // ------------------------------------------------------------

  String selectedFilter = "All";

  // ------------------------------------------------------------
  // Job Data
  // ------------------------------------------------------------

  final List<Map<String, dynamic>> jobs = [
    {
      "title": "Senior React Developer",
      "location": "Mumbai",
      "salary": "₹10-18 LPA",
      "applications": "24 Applications",
      "status": "Active",
    },
    {
      "title": "UI/UX Designer",
      "location": "Bangalore",
      "salary": "₹8-14 LPA",
      "applications": "18 Applications",
      "status": "Active",
    },
    {
      "title": "Data Analyst",
      "location": "Pune",
      "salary": "₹6-10 LPA",
      "applications": "12 Applications",
      "status": "Closed",
    },
    {
      "title": "Backend Developer",
      "location": "Remote",
      "salary": "₹12-20 LPA",
      "applications": "31 Applications",
      "status": "Draft",
    },
  ];

  // ------------------------------------------------------------
  // Filter Count
  // ------------------------------------------------------------

  int getCount(String filter) {
    if (filter == "All") {
      return jobs.length;
    }

    return jobs.where((job) {
      return job["status"] == filter;
    }).length;
  }

  // ------------------------------------------------------------
  // Filter Jobs
  // ------------------------------------------------------------

  List<Map<String, dynamic>> get filteredJobs {
    if (selectedFilter == "All") {
      return jobs;
    }

    return jobs.where((job) {
      return job["status"] == selectedFilter;
    }).toList();
  }

  // ------------------------------------------------------------
  // Header
  // ------------------------------------------------------------

  Widget buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        16,
        10,
        16,
        10,
      ),
      color: backgroundColor,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Job Postings",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: navyColor,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  "Manage and track your job postings",
                  style: TextStyle(
                    fontSize: 10,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),

          // Notification
          Icon(
            Icons.notifications_none_rounded,
            size: 21,
            color: greyColor,
          ),

          const SizedBox(width: 12),

          // Profile
          Container(
            width: 29,
            height: 29,
            decoration: BoxDecoration(
              color: bottomColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              "TCS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // Filter Tabs
  // ------------------------------------------------------------

  Widget buildFilterTabs() {
    final filters = [
      "All",
      "Active",
      "Closed",
      "Draft",
    ];

    return SizedBox(
      height: 43,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        itemCount: filters.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 11,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? bottomColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isSelected
                      ? bottomColor
                      : borderColor,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  "$filter (${getCount(filter)})",
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color: isSelected
                        ? Colors.white
                        : greyColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ------------------------------------------------------------
  // Status Badge
  // ------------------------------------------------------------

  Widget buildStatusBadge(String status) {
    Color background;
    Color text;

    if (status == "Active") {
      background = const Color(0xFFDDF7E7);
      text = const Color(0xFF16803C);
    } else if (status == "Closed") {
      background = const Color(0xFFFFDFDF);
      text = const Color(0xFFD62828);
    } else {
      background = const Color(0xFFFFE9B8);
      text = const Color(0xFFB77900);
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: text,
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // Job Card
  // ------------------------------------------------------------

  Widget buildJobCard(
      Map<String, dynamic> job,
      ) {
    final String title = job["title"];
    final String location = job["location"];
    final String salary = job["salary"];
    final String applications = job["applications"];
    final String status = job["status"];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // ------------------------------------------------------
          // Top Section
          // ------------------------------------------------------

          Padding(
            padding: const EdgeInsets.fromLTRB(
              12,
              12,
              8,
              10,
            ),
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: navyColor,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                buildStatusBadge(status),
              ],
            ),
          ),

          // ------------------------------------------------------
          // Job Information
          // ------------------------------------------------------

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Row(
              children: [
                // Location
                Flexible(
                  child: Text(
                    location,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      color: greyColor,
                    ),
                  ),
                ),

                // Dot
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Text(
                    "•",
                    style: TextStyle(
                      fontSize: 10,
                      color: greyColor,
                    ),
                  ),
                ),

                // Salary
                Flexible(
                  child: Text(
                    salary,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      color: greyColor,
                    ),
                  ),
                ),

                // Dot
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Text(
                    "•",
                    style: TextStyle(
                      fontSize: 10,
                      color: greyColor,
                    ),
                  ),
                ),

                // Applications
                Flexible(
                  child: Text(
                    applications,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: blueColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // ------------------------------------------------------
          // Divider
          // ------------------------------------------------------

          Divider(
            height: 1,
            thickness: 1,
            color: borderColor,
          ),

          // ------------------------------------------------------
          // Bottom Actions
          // ------------------------------------------------------

          SizedBox(
            height: 35,
            child: Row(
              children: [
                // Edit
                Expanded(
                  child: InkWell(
                    onTap: () {
                      editJob(job);
                    },
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 12),

                        Icon(
                          Icons.edit_outlined,
                          size: 15,
                          color: blueColor,
                        ),

                        const SizedBox(width: 4),

                        Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                            color: blueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Deactivate
                Expanded(
                  child: InkWell(
                    onTap: () {
                      deactivateJob(job);
                    },
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.end,
                      children: [
                        Icon(
                          status == "Active"
                              ? Icons.delete_outline
                              : Icons.delete_outline,
                          size: 16,
                          color: const Color(0xFFD62828),
                        ),

                        const SizedBox(width: 4),

                        Text(
                          status == "Active"
                              ? "Deactivate"
                              : "Delete",
                          style: const TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFD62828),
                          ),
                        ),

                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // Edit Job
  // ------------------------------------------------------------

  void editJob(Map<String, dynamic> job) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Edit ${job["title"]}",
        ),
        duration: const Duration(seconds: 1),
      ),
    );

    // You can navigate here:
    //
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => EditJobPage(job: job),
    //   ),
    // );
  }

  // ------------------------------------------------------------
  // Deactivate Job
  // ------------------------------------------------------------

  void deactivateJob(Map<String, dynamic> job) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Deactivate Job",
          ),

          content: Text(
            "Are you sure you want to deactivate "
                "${job["title"]}?",
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: greyColor,
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);

                setState(() {
                  job["status"] = "Closed";
                });

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Job deactivated successfully",
                    ),
                  ),
                );
              },
              child: const Text(
                "Deactivate",
                style: TextStyle(
                  color: Color(0xFFD62828),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ------------------------------------------------------------
  // Empty State
  // ------------------------------------------------------------

  Widget buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 80,
        ),
        child: Column(
          children: [
            Icon(
              Icons.work_outline,
              size: 45,
              color: borderColor,
            ),

            const SizedBox(height: 12),

            Text(
              "No job postings found",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: navyColor,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "There are no $selectedFilter job postings.",
              style: TextStyle(
                fontSize: 10,
                color: greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // Main Build
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: Column(
          children: [
            // Header
            buildHeader(),

            const SizedBox(height: 3),

            // Filter tabs
            buildFilterTabs(),

            const SizedBox(height: 4),

            // Job list
            Expanded(
              child: filteredJobs.isEmpty
                  ? buildEmptyState()
                  : ListView.builder(
                physics:
                const BouncingScrollPhysics(),

                padding: const EdgeInsets.fromLTRB(
                  16,
                  5,
                  16,
                  20,
                ),

                itemCount: filteredJobs.length,

                itemBuilder: (context, index) {
                  return buildJobCard(
                    filteredJobs[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}