import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, UserProfile>((ref) {
  return ProfileNotifier();
},
);

class UserProfile {
  final String fullName;
  final String email;
  final String mobile;
  final String location;
  final String dateOfBirth;
  final String gender;
  final String aboutMe;
  final String education;
  final String experience;
  final List<String> technicalSkills;
  final String certifications;
  final String projects;
  final String languages;
  final String resume;

  UserProfile({
    required this.fullName,
    required this.email,
    required this.mobile,
    required this.location,
    required this.dateOfBirth,
    required this.gender,
    required this.aboutMe,
    required this.education,
    required this.experience,
    required this.technicalSkills,
    required this.certifications,
    required this.projects,
    required this.languages,
    required this.resume,
  });

  UserProfile copyWith({
    String? fullName,
    String? email,
    String? mobile,
    String? location,
    String? dateOfBirth,
    String? gender,
    String? aboutMe,
    String? education,
    String? experience,
    List<String>? technicalSkills,
    String? certifications,
    String? projects,
    String? languages,
    String? resume,
  }) {
    return UserProfile(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      location: location ?? this.location,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      aboutMe: aboutMe ?? this.aboutMe,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      technicalSkills: technicalSkills ?? this.technicalSkills,
      certifications: certifications ?? this.certifications,
      projects: projects ?? this.projects,
      languages: languages ?? this.languages,
      resume: resume ?? this.resume,
    );
  }
}

class ProfileNotifier extends StateNotifier<UserProfile> {
  ProfileNotifier() : super(
    UserProfile(
      fullName: "Yashgiri Gauswami",
      email: "rahul@email.com",
      mobile: "+91 98765 43210",
      location: "Mumbai, Maharashtra",
      dateOfBirth: "15 August 1996",
      gender: "Male",
      aboutMe:
      "Senior React Developer with a passion for clean code and responsive interfaces.",
      education: "B.Tech in Computer Science",
      experience: "4 years",
      technicalSkills: [
        "React",
        "JavaScript",
        "TypeScript",
        "Node.js",
        "Python",
      ],
      certifications: "AWS Certified Cloud Practitioner",
      projects: "E-Commerce React PWA",
      languages: "English, Hindi",
      resume: "Yashgiri_Resume.pdf",
    ),
  );

  void updateProfile({
    required String fullName,
    required String email,
    required String mobile,
    required String location,
    required String dateOfBirth,
    required String gender,
    required String aboutMe,
    required String education,
    required String experience,
    required List<String> technicalSkills,
    required String certifications,
    required String projects,
    required String languages,
    required String resume,
  }) {
    state = state.copyWith(
      fullName: fullName,
      email: email,
      mobile: mobile,
      location: location,
      dateOfBirth: dateOfBirth,
      gender: gender,
      aboutMe: aboutMe,
      education: education,
      experience: experience,
      technicalSkills: technicalSkills,
      certifications: certifications,
      projects: projects,
      languages: languages,
      resume: resume,
    );
  }
}


/*
final employeeprofileProvider = StateNotifierProvider(<empprofileNotifier, employeeprofile>(ref){
  return empprofileNotifier();
},);

class employeeprofile{

}

class empprofileNotifier extends StateNotifier<employeeprofile>{

}*/


/// Search field on user panel find jobs

final searchqueryprovider = StateProvider<String>((ref) {
  return '';
});
final selectedfilterprovider = StateProvider<int>((ref) {
  return 0;
});
final jobsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
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
      "We are looking for a highly skilled Senior React Developer to join our growing development team.",
      "responsibilities": [
        "Design and build scalable and reusable React components from scratch.",
        "Collaborate with backend engineers to integrate RESTful and GraphQL APIs seamlessly.",
        "Optimize application architectures for maximum performance.",
        "Write unit and integration tests.",
        "Provide technical mentorship."
      ],
      "requirements": [
        "Minimum 3-5 years of experience.",
        "Expert knowledge of JavaScript, TypeScript, and React.",
        "Strong understanding of REST APIs and GraphQL.",
        "Experience with Git.",
        "Good understanding of responsive web design."
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
      "We are looking for a creative UI/UX Designer.",
      "responsibilities": [
        "Create wireframes and prototypes.",
        "Design modern and responsive interfaces.",
        "Work closely with developers.",
        "Conduct user research."
      ],
      "requirements": [
        "2-4 years of UI/UX experience.",
        "Strong knowledge of Figma.",
        "Good understanding of design systems.",
        "Knowledge of responsive design."
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
      "We are seeking a Data Analyst to analyze business data.",
      "responsibilities": [
        "Analyze large datasets.",
        "Create reports and dashboards.",
        "Work with business teams.",
        "Identify trends and patterns."
      ],
      "requirements": [
        "Knowledge of SQL.",
        "Knowledge of Excel.",
        "Basic Python knowledge.",
        "Good analytical and communication skills."
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
      "HCL is looking for a Backend Developer.",
      "responsibilities": [
        "Develop REST APIs.",
        "Build scalable backend services.",
        "Work with databases.",
        "Optimize backend performance."
      ],
      "requirements": [
        "Strong knowledge of Node.js or Java.",
        "Knowledge of REST APIs.",
        "Database knowledge.",
        "Good understanding of backend architecture."
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
      "We are looking for an experienced Marketing Manager.",
      "responsibilities": [
        "Plan marketing campaigns.",
        "Manage digital marketing activities.",
        "Analyze marketing performance.",
        "Work with creative teams."
      ],
      "requirements": [
        "3-6 years marketing experience.",
        "Strong communication skills.",
        "Knowledge of digital marketing.",
        "Strong leadership skills."
      ],
    },
  ];
});
final filteredJobsProvider =
Provider<List<Map<String, dynamic>>>((ref) {
  final jobs = ref.watch(jobsProvider);

  final searchQuery = ref.watch(searchqueryprovider).trim().toLowerCase();

  final selectedFilter = ref.watch(selectedfilterprovider);

  return jobs.where((job) {

    final title = job["title"].toString().toLowerCase();

    final company = job["company"].toString().toLowerCase();

    final location = job["location"].toString().toLowerCase();

    final matchesSearch =
        searchQuery.isEmpty ||
            title.contains(searchQuery) ||
            company.contains(searchQuery) ||
            location.contains(searchQuery);

    bool matchesFilter = true;

    // 0 = All Jobs
    if (selectedFilter == 0) {
      matchesFilter = true;
    }

    // 1 = Full Time
    else if (selectedFilter == 1) {
      matchesFilter = job["type"] == "Full Time";
    }

    // 2 = Part Time
    else if (selectedFilter == 2) {
      matchesFilter = job["type"] == "Part Time";
    }

    // 3 = Remote
    else if (selectedFilter == 3) {
      matchesFilter = job["type"] == "Remote";
    }

    return matchesSearch && matchesFilter;
  }).toList();
});
