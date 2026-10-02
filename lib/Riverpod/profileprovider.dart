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
