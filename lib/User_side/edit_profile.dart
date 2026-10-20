import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:job_portal/Riverpod/profileprovider.dart';
import 'package:job_portal/User_side/forgot_password.dart';
import 'package:job_portal/User_side/profile.dart';

import '../references/reference.dart';
import 'home_page.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() =>
      _EditProfilePageState();
}

class _EditProfilePageState
    extends ConsumerState<EditProfilePage> {

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController mobileController;
  late TextEditingController locationController;
  late TextEditingController dobController;
  late TextEditingController aboutController;
  late TextEditingController educationController;
  late TextEditingController experienceController;
  late TextEditingController certificationController;
  late TextEditingController projectController;
  late TextEditingController languageController;

  String gender = "Male";



  @override
  void initState() {
    super.initState();



    final profile = ref.read(profileProvider);

    nameController = TextEditingController(text: profile.fullName);

    emailController = TextEditingController(text: profile.email);

    mobileController = TextEditingController(text: profile.mobile);

    locationController = TextEditingController(text: profile.location);

    dobController = TextEditingController(text: profile.dateOfBirth);

    aboutController = TextEditingController(text: profile.aboutMe);

    educationController = TextEditingController(text: profile.education);

    experienceController = TextEditingController(text: profile.experience);

    certificationController = TextEditingController(text: profile.certifications,);

    projectController = TextEditingController(text: profile.projects);

    languageController = TextEditingController(text: profile.languages);

    gender = profile.gender;
  }



  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    locationController.dispose();
    dobController.dispose();
    aboutController.dispose();
    educationController.dispose();
    experienceController.dispose();
    certificationController.dispose();
    projectController.dispose();
    languageController.dispose();

    super.dispose();
  }


  Future<void> selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1996, 8, 15),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        dobController.text =
        "${selectedDate.day} "
            "${monthName(selectedDate.month)} "
            "${selectedDate.year}";
      });
    }
  }



  String monthName(int month) {
    const months = [
      "",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    return months[month];
  }


  void saveChanges() {
    final currentProfile = ref.read(profileProvider);


    ref.read(profileProvider.notifier).updateProfile(
      fullName: nameController.text.trim(),
      email: emailController.text.trim(),
      mobile: mobileController.text.trim(),
      location: locationController.text.trim(),
      dateOfBirth: dobController.text.trim(),
      gender: gender,
      aboutMe: aboutController.text.trim(),
      education: educationController.text.trim(),
      experience: experienceController.text.trim(),
      technicalSkills:
      currentProfile.technicalSkills,
      certifications:
      certificationController.text.trim(),
      projects:
      projectController.text.trim(),
      languages:
      languageController.text.trim(),
      resume: currentProfile.resume,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Profile updated successfully",
        ),
      ),
    );

    // Go back to Profile page
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: Column(
          children: [



            Container(
              height: 58,
              width: double.infinity,

              decoration: BoxDecoration(
                color: backgroundColor,
                border: const Border(
                  bottom: BorderSide(
                    color: Color(0xFFE3E3E3),
                    width: 1,
                  ),
                ),
              ),

              child: Row(
                children: [


                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    icon: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: textColor,
                    ),
                  ),

                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontweight,
                      color: textColor,
                    ),
                  ),

                  const Spacer(),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const HomePage(),
                        ),
                      );
                    },

                    child: Container(
                      width: 29,
                      height: 29,

                      margin:
                      const EdgeInsets.only(right: 11),

                      decoration: BoxDecoration(
                        color: avatarColor,
                        shape: BoxShape.circle,
                      ),

                      child: const Center(
                        child: Text(
                          "RS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),



            Expanded(
              child: SingleChildScrollView(
                physics:
                const BouncingScrollPhysics(),

                padding:
                const EdgeInsets.fromLTRB(
                  16,
                  15,
                  16,
                  30,
                ),

                child: Container(
                  width: double.infinity,

                  padding:
                  const EdgeInsets.fromLTRB(
                    16,
                    18,
                    16,
                    22,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(11),

                    border: Border.all(
                      color: borderColor,
                      width: 1,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [



                      Center(
                        child: Stack(
                          clipBehavior:
                          Clip.none,

                          children: [

                            Container(
                              width: 80,
                              height: 80,

                              decoration:
                              BoxDecoration(
                                color: avatarColor,
                                shape:
                                BoxShape.circle,
                              ),

                              child: const Center(
                                child: Text(
                                  "RS",
                                  style:
                                  TextStyle(
                                    color:
                                    Colors.white,
                                    fontSize: 24,
                                    fontWeight:
                                    FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),


                            Positioned(
                              right: -2,
                              bottom: -2,

                              child: Container(
                                width: 24,
                                height: 24,

                                decoration:
                                BoxDecoration(
                                  color:
                                  blueColor,
                                  shape:
                                  BoxShape.circle,
                                ),

                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 13,
                                  color:
                                  Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 19),

                      const FormLabel(
                        text: "Full Name",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller: nameController,
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "Email Address",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "Mobile Number",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        mobileController,
                        keyboardType:
                        TextInputType.phone,
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "Location",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        locationController,
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "Date of Birth",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        dobController,
                        readOnly: true,

                        suffixIcon:
                        IconButton(
                          onPressed:
                          selectDate,

                          icon: const Icon(
                            Icons.calendar_month,
                            size: 20,
                            color:
                            Color(0xFF697383),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "Gender",
                      ),

                      const SizedBox(height: 6),

                      Container(
                        height: 40,
                        width:
                        double.infinity,

                        padding:
                        const EdgeInsets
                            .symmetric(
                          horizontal: 11,
                        ),

                        decoration:
                        BoxDecoration(
                          border:
                          Border.all(
                            color:
                            borderColor,
                          ),

                          borderRadius:
                          BorderRadius
                              .circular(7),
                        ),

                        child:
                        DropdownButtonHideUnderline(
                          child:
                          DropdownButton<String>(
                            value: gender,

                            isExpanded: true,

                            icon: const Icon(
                              Icons
                                  .keyboard_arrow_down,
                              size: 21,
                              color:
                              Color(0xFF697383),
                            ),

                            style: TextStyle(
                              fontSize: 13,
                              color: textColor,
                            ),

                            items: const [
                              DropdownMenuItem(
                                value: "Male",
                                child:
                                Text("Male"),
                              ),

                              DropdownMenuItem(
                                value: "Female",
                                child:
                                Text("Female"),
                              ),

                              DropdownMenuItem(
                                value: "Other",
                                child:
                                Text("Other"),
                              ),
                            ],

                            onChanged:
                                (value) {
                              if (value !=
                                  null) {
                                setState(() {
                                  gender =
                                      value;
                                });
                              }
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "About Me",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        aboutController,
                        maxLines: 3,
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "Education",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        educationController,
                      ),

                      const SizedBox(height: 15),


                      const FormLabel(
                        text: "Experience",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        experienceController,
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "Technical Skills",
                      ),

                      const SizedBox(height: 8),

                      Wrap(
                        spacing: 6,
                        runSpacing: 8,

                        children: const [
                          SkillChip(
                            text: "React",
                          ),

                          SkillChip(
                            text: "JavaScript",
                          ),

                          SkillChip(
                            text: "TypeScript",
                          ),

                          SkillChip(
                            text: "Node.js",
                          ),

                          SkillChip(
                            text: "Python",
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      const FormLabel(
                        text: "Certifications",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        certificationController,
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "Projects",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        projectController,
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "Languages",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        languageController,
                      ),

                      const SizedBox(height: 15),

                      const FormLabel(
                        text: "Resume",
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [


                          Expanded(
                            child: SizedBox(
                              height: 36,

                              child:
                              OutlinedButton
                                  .icon(
                                onPressed: () {},

                                icon: const Icon(
                                  Icons
                                      .cloud_upload_outlined,
                                  size: 17,
                                ),

                                label:
                                const Text(
                                  "Upload New",
                                ),

                                style:
                                OutlinedButton
                                    .styleFrom(
                                  foregroundColor:
                                  blueColor,

                                  side:
                                  BorderSide(
                                    color:
                                    blueColor,
                                  ),

                                  shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      6,
                                    ),
                                  ),

                                  padding:
                                  EdgeInsets
                                      .zero,

                                  textStyle:
                                  const TextStyle(
                                    fontSize: 13,
                                    fontWeight:
                                    FontWeight
                                        .w600,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          // DOWNLOAD
                          Expanded(
                            child: SizedBox(
                              height: 36,

                              child:
                              OutlinedButton
                                  .icon(
                                onPressed: () {},

                                icon: const Icon(
                                  Icons.download,
                                  size: 17,
                                ),

                                label:
                                const Text(
                                  "Download",
                                ),

                                style:
                                OutlinedButton
                                    .styleFrom(
                                  foregroundColor:
                                  greyColor,

                                  side:
                                  const BorderSide(
                                    color:
                                    Color(
                                      0xFF7A818C,
                                    ),
                                  ),

                                  shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      6,
                                    ),
                                  ),

                                  padding:
                                  EdgeInsets
                                      .zero,

                                  textStyle:
                                  const TextStyle(
                                    fontSize: 13,
                                    fontWeight:
                                    FontWeight
                                        .w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      SizedBox(
                        width: double.infinity,
                        height: 40,

                        child:
                        ElevatedButton(
                          onPressed:
                          saveChanges,

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
                                  .circular(7),
                            ),
                          ),

                          child: const Text(
                            "Save Changes",

                            style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),


                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                const ChangePasswordPage(),
                              ),
                            );
                          },

                          style:
                          TextButton.styleFrom(
                            padding:
                            EdgeInsets.zero,

                            minimumSize:
                            Size.zero,

                            tapTargetSize:
                            MaterialTapTargetSize
                                .shrinkWrap,
                          ),

                          child: Text(
                            "Change Password",

                            style: TextStyle(
                              fontSize: 13,
                              fontWeight:
                              FontWeight.w500,
                              color:
                              blueColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FormLabel extends StatelessWidget {
  final String text;

  const FormLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF687384),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final Widget? suffixIcon;
  final int maxLines;
  final TextInputType? keyboardType;

  const ProfileTextField({
    super.key,
    required this.controller,
    this.readOnly = false,
    this.suffixIcon,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      readOnly: readOnly,

      maxLines: maxLines,

      keyboardType: keyboardType,

      style: const TextStyle(
        fontSize: 13,
        color: Color(0xFF17233B),
      ),

      decoration: InputDecoration(
        suffixIcon: suffixIcon,

        contentPadding:
        const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 10,
        ),

        isDense: true,

        filled: true,

        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(7),

          borderSide:
          const BorderSide(
            color: Color(0xFFE1E5E9),
          ),
        ),

        enabledBorder:
        OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(7),

          borderSide:
          const BorderSide(
            color: Color(0xFFE1E5E9),
          ),
        ),

        focusedBorder:
        OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(7),

          borderSide:
          const BorderSide(
            color: Color(0xFF2864E8),
          ),
        ),
      ),
    );
  }
}


class SkillChip extends StatelessWidget {
  final String text;

  const SkillChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF0F5FF),

        borderRadius:
        BorderRadius.circular(17),
      ),

      child: Text(
        text,

        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: blueColor,
        ),
      ),
    );
  }
}