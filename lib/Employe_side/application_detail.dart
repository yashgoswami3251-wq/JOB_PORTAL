import 'package:flutter/material.dart';
import '../references/reference.dart';

class ApplicationDetailsPage extends StatefulWidget {
  const ApplicationDetailsPage({super.key});

  @override
  State<ApplicationDetailsPage> createState() =>
      _ApplicationDetailsPageState();
}

class _ApplicationDetailsPageState
    extends State<ApplicationDetailsPage> {
  String currentStatus = "Shortlisted";

  final List<String> skills = [
    "React",
    "TypeScript",
    "Redux",
    "Tailwind CSS",
    "JavaScript",
    "HTML5/CSS3",
  ];

  void updateStatus(String status) {
    setState(() {
      currentStatus = status;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          status == "Scheduled"
              ? "Interview scheduled successfully"
              : "Candidate ${status.toLowerCase()} successfully",
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void downloadResume() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Resume download started"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showScheduleDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Schedule Interview",
            style: TextStyle(
              color: navyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "Do you want to schedule an interview with Rahul Verma?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: greyColor),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                updateStatus("Scheduled");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blueColor,
                foregroundColor: Colors.white,
              ),
              child: const Text("Schedule"),
            ),
          ],
        );
      },
    );
  }

  Widget skillChip(String skill) {
    return Container(
      margin: const EdgeInsets.only(
        right: 7,
        bottom: 7,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F3F7),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: navyColor,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget infoItem(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: greyColor,
              fontSize: 9,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: TextStyle(
              color: navyColor,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionCard({
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(12),
  }) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: borderColor),
      ),
      child: child,
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 9),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: borderColor),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 13,
                      color: blueColor,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "Back to Apps",
                      style: TextStyle(
                        color: blueColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Icon(
                Icons.notifications_none_outlined,
                size: 21,
                color: greyColor,
              ),
              const SizedBox(width: 12),
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF397184),
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
          const SizedBox(height: 7),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Applicant Profile",
              style: TextStyle(
                color: navyColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Detailed breakdown of candidate",
              style: TextStyle(
                color: greyColor,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileCard() {
    return sectionCard(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: const BoxDecoration(
                  color: Color(0xFF1D2B4D),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  "RV",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rahul Verma",
                      style: TextStyle(
                        color: navyColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          "Position Applied: ",
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 10,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Senior React Dev",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(height: 1, color: borderColor),
          const SizedBox(height: 12),
          Row(
            children: [
              infoItem("Email", "rahul.v@email.com"),
              infoItem("Phone", "+91 98765 43210"),
            ],
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              infoItem("Experience", "4 Years 2 Months"),
              infoItem("Current Company", "Infotech Solutions"),
            ],
          ),
        ],
      ),
    );
  }

  Widget skillsCard() {
    return sectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills",
            style: TextStyle(
              color: navyColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            children: skills.map(skillChip).toList(),
          ),
        ],
      ),
    );
  }

  Widget coverLetterCard() {
    return sectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cover Letter Summary",
            style: TextStyle(
              color: navyColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            "I am highly passionate about developing accessible "
                "and robust web interfaces. My focus over the last "
                "three years has been building composable architectures "
                "in React. I am excited about the prospect of joining "
                "TCS to deliver exceptional digital experiences.",
            style: TextStyle(
              color: greyColor,
              fontSize: 11,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget resumeCard() {
    return sectionCard(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      child: Row(
        children: [
          Icon(
            Icons.insert_drive_file_outlined,
            color: blueColor,
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rahul_Verma_Resume.pdf",
                  style: TextStyle(
                    color: navyColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "1.4 MB • PDF Document",
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: downloadResume,
            style: OutlinedButton.styleFrom(
              foregroundColor: blueColor,
              side: BorderSide(color: borderColor),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 7,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              "Download",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget statusCard() {
    if (currentStatus == "Shortlisted") {
      return const SizedBox.shrink();
    }

    final isRejected = currentStatus == "Rejected";

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: isRejected
            ? const Color(0xFFFFE1E1)
            : const Color(0xFFDDF8E6),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        "Current Status: $currentStatus",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isRejected ? Colors.red : Colors.green,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget actionButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 38,
            child: ElevatedButton(
              onPressed: () => updateStatus("Shortlisted"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF159447),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                "Shortlist",
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
            height: 38,
            child: ElevatedButton(
              onPressed: showScheduleDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: blueColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                "Schedule",
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
            height: 38,
            child: ElevatedButton(
              onPressed: () => updateStatus("Rejected"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC81717),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                "Reject",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                child: Column(
                  children: [
                    profileCard(),
                    const SizedBox(height: 16),
                    skillsCard(),
                    const SizedBox(height: 16),
                    coverLetterCard(),
                    const SizedBox(height: 16),
                    resumeCard(),
                    const SizedBox(height: 18),
                    statusCard(),
                    actionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}