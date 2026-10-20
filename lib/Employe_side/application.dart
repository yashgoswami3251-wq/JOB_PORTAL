import 'package:flutter/material.dart';
import 'package:job_portal/Employe_side/profile.dart';

import '../references/reference.dart';
import 'homepage.dart';

// ============================================================
// APPLICANT MODEL
// ============================================================

class Applicant {
  String name;
  String initials;
  String appliedDate;
  String experience;
  String skills;
  String status;
  String email;
  String phone;
  String currentCompany;
  String position;
  List<String> skillList;
  String coverLetter;

  Applicant({
    required this.name,
    required this.initials,
    required this.appliedDate,
    required this.experience,
    required this.skills,
    required this.status,
    required this.email,
    required this.phone,
    required this.currentCompany,
    required this.position,
    required this.skillList,
    required this.coverLetter,
  });
}

// ============================================================
// APPLICATION PAGE
// ============================================================

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  String selectedFilter = "All";

  final List<Applicant> applicants = [
    Applicant(
      name: "Rahul Verma",
      initials: "RV",
      appliedDate: "Jan 22, 2026",
      experience: "4.2 Years",
      skills: "React, TS, Redux",
      status: "Shortlisted",
      email: "rahul.v@email.com",
      phone: "+91 98765 43210",
      currentCompany: "Infotech Solutions",
      position: "Senior React Dev",
      skillList: [
        "React",
        "TypeScript",
        "Redux",
        "Tailwind CSS",
        "JavaScript",
        "HTML5/CSS3",
      ],
      coverLetter:
      "I am highly passionate about developing accessible and robust web interfaces. My focus over the last three years has been building composable architectures in React. I am excited about the prospect of joining TCS to deliver exceptional digital experiences.",
    ),
    Applicant(
      name: "Deepika Nair",
      initials: "DN",
      appliedDate: "Jan 25, 2026",
      experience: "3.5 Years",
      skills: "Figma, Design, Prototyping",
      status: "Interview Scheduled",
      email: "deepika.nair@email.com",
      phone: "+91 98765 12345",
      currentCompany: "Creative Studio",
      position: "UI/UX Designer",
      skillList: [
        "Figma",
        "UI Design",
        "UX Design",
        "Prototyping",
        "Wireframing",
      ],
      coverLetter:
      "I enjoy creating clean and user-friendly digital experiences. My experience includes designing responsive interfaces, prototypes and user journeys while working closely with development teams.",
    ),
    Applicant(
      name: "Arjun Mehta",
      initials: "AM",
      appliedDate: "Feb 01, 2026",
      experience: "1.8 Years",
      skills: "JavaScript, CSS, HTML",
      status: "Rejected",
      email: "arjun.mehta@email.com",
      phone: "+91 98765 67890",
      currentCompany: "Web Solutions",
      position: "Frontend Developer",
      skillList: [
        "JavaScript",
        "CSS",
        "HTML",
        "Bootstrap",
        "Git",
      ],
      coverLetter:
      "I am interested in frontend development and enjoy creating responsive web applications. I have worked on multiple projects using JavaScript, HTML and CSS.",
    ),
  ];

  List<Applicant> get filteredApplicants {
    switch (selectedFilter) {
      case "New":
        return applicants
            .where(
              (a) =>
          a.status != "Shortlisted" &&
              a.status != "Rejected",
        )
            .toList();

      case "Shortlisted":
        return applicants
            .where((a) => a.status == "Shortlisted")
            .toList();

      case "Rejected":
        return applicants
            .where((a) => a.status == "Rejected")
            .toList();

      default:
        return applicants;
    }
  }

  void updateApplicantStatus(
      Applicant applicant,
      String newStatus,
      ) {
    setState(() {
      applicant.status = newStatus;
    });
  }

  void openApplicantDetails(Applicant applicant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApplicantProfilePage(
          applicant: applicant,
          onStatusChanged: (newStatus) {
            updateApplicantStatus(applicant, newStatus);
          },
        ),
      ),
    ).then((_) {
      if (mounted) setState(() {});
    });
  }

  Widget filterButton(String title) {
    final isSelected = selectedFilter == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF17445B)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF17445B) : borderColor,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : greyColor,
          ),
        ),
      ),
    );
  }

  Widget statusBadge(String status) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case "Shortlisted":
        bgColor = const Color(0xFFDCEBFF);
        textColor = blueColor;
        break;
      case "Rejected":
        bgColor = const Color(0xFFFFDDDD);
        textColor = redColor;
        break;
      case "Interview Scheduled":
        bgColor = const Color(0xFFD7F7E5);
        textColor = greenColor;
        break;
      default:
        bgColor = const Color(0xFFECEFF3);
        textColor = greyColor;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  Widget applicantCard(Applicant applicant) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: const Color(0xFFE8EBF0),
                child: Text(
                  applicant.initials,
                  style: TextStyle(
                    color: navyColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      applicant.name,
                      style: TextStyle(
                        color: navyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Applied on ${applicant.appliedDate}",
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: greyColor,
                fontSize: 10,
              ),
              children: [
                const TextSpan(text: "Experience: "),
                TextSpan(
                  text: applicant.experience,
                  style: TextStyle(
                    color: navyColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: " • ${applicant.skills}",
                  style: TextStyle(
                    color: navyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Divider(height: 1, color: borderColor),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: statusBadge(applicant.status)),
              GestureDetector(
                onTap: () => openApplicantDetails(applicant),
                child: Row(
                  children: [
                    Text(
                      "View Details",
                      style: TextStyle(
                        color: blueColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Icon(
                      Icons.arrow_forward,
                      size: 13,
                      color: blueColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget topBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 7, 12, 9),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: borderColor,
            width: 0.7,
          ),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeHomePage(),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: blueColor,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Applications",
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontweight,
                    color: navyColor,
                  ),
                ),
                Text(
                  "Senior React Developer",
                  style: TextStyle(
                    fontSize: 10,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.notifications_none,
            size: 21,
            color: greyColor,
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompanyProfilePage(),
                ),
              );
            },
            child: Container(
              width: profileSize,
              height: profileSize,
              decoration: BoxDecoration(
                color: avatarColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Text(
                "TCS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            topBar(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    filterButton("All"),
                    const SizedBox(width: 7),
                    filterButton("New"),
                    const SizedBox(width: 7),
                    filterButton("Shortlisted"),
                    const SizedBox(width: 7),
                    filterButton("Rejected"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: filteredApplicants.isEmpty
                  ? Center(
                child: Text(
                  "No applications found",
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 12,
                  ),
                ),
              )
                  : ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 2,
                ),
                itemCount: filteredApplicants.length,
                itemBuilder: (context, index) {
                  return applicantCard(
                    filteredApplicants[index],
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

// ============================================================
// APPLICANT PROFILE PAGE
// ============================================================

class ApplicantProfilePage extends StatefulWidget {
  final Applicant applicant;
  final Function(String) onStatusChanged;

  const ApplicantProfilePage({
    super.key,
    required this.applicant,
    required this.onStatusChanged,
  });

  @override
  State<ApplicantProfilePage> createState() =>
      _ApplicantProfilePageState();
}

class _ApplicantProfilePageState
    extends State<ApplicantProfilePage> {
  final Color greenColor = const Color(0xFF138A43);

  void changeStatus(String status) {
    setState(() {
      widget.applicant.status = status;
    });

    widget.onStatusChanged(status);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${widget.applicant.name} marked as $status",
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Widget topBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 7, 12, 9),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: borderColor,
            width: 0.7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      "Back to Apps",
                      style: TextStyle(
                        color: blueColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Icon(
                Icons.notifications_none,
                size: 21,
                color: greyColor,
              ),
              const SizedBox(width: 10),
              const CircleAvatar(
                radius: 13,
                backgroundColor: Color(0xFF397184),
                child: Text(
                  "TCS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            "Applicant Profile",
            style: TextStyle(
              color: navyColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Detailed breakdown of candidate",
            style: TextStyle(
              color: greyColor,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  Widget infoItem(String title, String value) {
    return Column(
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
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget profileInformationCard() {
    final applicant = widget.applicant;

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 9, 12, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 21,
                backgroundColor: navyColor,
                child: Text(
                  applicant.initials,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      applicant.name,
                      style: TextStyle(
                        color: navyColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 9,
                        ),
                        children: [
                          const TextSpan(
                            text: "Position Applied: ",
                          ),
                          TextSpan(
                            text: applicant.position,
                            style: TextStyle(
                              color: blueColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Divider(height: 1, color: borderColor),
          const SizedBox(height: 11),
          Row(
            children: [
              Expanded(
                child: infoItem("Email", applicant.email),
              ),
              Expanded(
                child: infoItem("Phone", applicant.phone),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              Expanded(
                child: infoItem(
                  "Experience",
                  applicant.experience,
                ),
              ),
              Expanded(
                child: infoItem(
                  "Current Company",
                  applicant.currentCompany,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget skillsCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 9, 12, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: borderColor),
      ),
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
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: widget.applicant.skillList.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
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
                    fontSize: 9,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget coverLetterCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 9, 12, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: borderColor),
      ),
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
          const SizedBox(height: 8),
          Text(
            widget.applicant.coverLetter,
            style: TextStyle(
              color: greyColor,
              fontSize: 10,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget resumeCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 9, 12, 0),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Icon(
            Icons.insert_drive_file_outlined,
            color: blueColor,
            size: 19,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.applicant.name.replaceAll(" ", "_")}_Resume.pdf",
                  style: TextStyle(
                    color: navyColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "1.4 MB • PDF Document",
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: borderColor),
            ),
            child: Text(
              "Download",
              style: TextStyle(
                color: blueColor,
                fontSize: 9,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget actionButtons() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 9, 12, 9),
      color: backgroundColor,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 33,
              child: ElevatedButton(
                onPressed: () => changeStatus("Shortlisted"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "Shortlist",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: SizedBox(
              height: 33,
              child: ElevatedButton(
                onPressed: () =>
                    changeStatus("Interview Scheduled"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "Schedule",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: SizedBox(
              height: 33,
              child: ElevatedButton(
                onPressed: () => changeStatus("Rejected"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: redColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "Reject",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            topBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    profileInformationCard(),
                    skillsCard(),
                    coverLetterCard(),
                    resumeCard(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            actionButtons(),
          ],
        ),
      ),
    );
  }
}
