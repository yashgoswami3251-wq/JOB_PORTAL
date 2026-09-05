import 'package:flutter/material.dart';
import 'package:job_portal/User_side/profile.dart';

import 'home_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // ============================================================
  // COLORS
  // ============================================================

  static const Color bgColor = Color(0xFFFFFCF7);
  static const Color textColor = Color(0xFF17233B);
  static const Color greyColor = Color(0xFF737B87);
  static const Color avatarColor = Color(0xFF397184);
  static const Color buttonColor = Color(0xFF2864E8);
  static const Color borderColor = Color(0xFFE1E5E9);

  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController nameController =
  TextEditingController(text: "Rahul Sharma");

  final TextEditingController emailController =
  TextEditingController(text: "rahul@email.com");

  final TextEditingController mobileController =
  TextEditingController(text: "+91 98765 43210");

  final TextEditingController locationController =
  TextEditingController(text: "Mumbai, Maharashtra");

  final TextEditingController dobController =
  TextEditingController(text: "15 August 1996");

  final TextEditingController aboutController =
  TextEditingController(
    text:
    "Senior React Developer with a passion for clean code and responsive interfaces.",
  );

  final TextEditingController educationController =
  TextEditingController(
    text: "B.Tech in Computer Science",
  );

  final TextEditingController experienceController =
  TextEditingController(
    text: "4 years",
  );

  final TextEditingController certificationController =
  TextEditingController(
    text: "AWS Certified Cloud Practitioner",
  );

  final TextEditingController projectsController =
  TextEditingController(
    text: "E-Commerce React PWA",
  );

  final TextEditingController languagesController =
  TextEditingController(
    text: "English, Hindi",
  );

  String gender = "Male";

  // ============================================================
  // DISPOSE
  // ============================================================

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
    projectsController.dispose();
    languagesController.dispose();

    super.dispose();
  }

  // ============================================================
  // DATE PICKER
  // ============================================================

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

  // ============================================================
  // SAVE
  // ============================================================

  void saveChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Profile updated successfully",
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      body: SafeArea(
        child: Column(
          children: [

            // ======================================================
            // HEADER
            // ======================================================

            Container(
              height: 58,
              width: double.infinity,

              decoration: const BoxDecoration(
                color: bgColor,

                border: Border(
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

                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: textColor,
                    ),
                  ),

                  const Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),

                  const Spacer(),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    },
                    child: Container(
                      width: 29,
                      height: 29,

                      margin: const EdgeInsets.only(
                        right: 11,
                      ),

                      decoration:
                      const BoxDecoration(
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

            // ======================================================
            // SCROLLABLE CONTENT
            // ======================================================

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

                      // =================================================
                      // AVATAR
                      // =================================================

                      Center(
                        child: Stack(
                          clipBehavior:
                          Clip.none,

                          children: [

                            Container(
                              width: 80,
                              height: 80,

                              decoration:
                              const BoxDecoration(
                                color: avatarColor,
                                shape:
                                BoxShape.circle,
                              ),

                              child:
                              const Center(
                                child: Text(
                                  "RS",
                                  style:
                                  TextStyle(
                                    color:
                                    Colors.white,
                                    fontSize: 24,
                                    fontWeight:
                                    FontWeight
                                        .w700,
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
                                const BoxDecoration(
                                  color:
                                  buttonColor,
                                  shape:
                                  BoxShape
                                      .circle,
                                ),

                                child:
                                const Icon(
                                  Icons
                                      .camera_alt,
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

                      // =================================================
                      // FULL NAME
                      // =================================================

                      const FormLabel(
                        text: "Full Name",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        nameController,
                      ),

                      const SizedBox(height: 15),

                      // =================================================
                      // EMAIL
                      // =================================================

                      const FormLabel(
                        text: "Email Address",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        emailController,
                        keyboardType:
                        TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 15),

                      // =================================================
                      // MOBILE
                      // =================================================

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

                      // =================================================
                      // LOCATION
                      // =================================================

                      const FormLabel(
                        text: "Location",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        locationController,
                      ),

                      const SizedBox(height: 15),

                      // =================================================
                      // DATE OF BIRTH
                      // =================================================

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

                      // =================================================
                      // GENDER
                      // =================================================

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
                          DropdownButton<
                              String>(
                            value: gender,

                            isExpanded: true,

                            icon:
                            const Icon(
                              Icons
                                  .keyboard_arrow_down,
                              size: 21,
                              color: Color(
                                  0xFF697383),
                            ),

                            style:
                            const TextStyle(
                              fontSize: 13,
                              color:
                              textColor,
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
                                Text(
                                    "Female"),
                              ),
                              DropdownMenuItem(
                                value: "Other",
                                child:
                                Text(
                                    "Other"),
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

                      // =================================================
                      // ABOUT ME
                      // =================================================

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

                      // =================================================
                      // EDUCATION
                      // =================================================

                      const FormLabel(
                        text: "Education",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        educationController,
                      ),

                      const SizedBox(height: 15),

                      // =================================================
                      // EXPERIENCE
                      // =================================================

                      const FormLabel(
                        text: "Experience",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        experienceController,
                      ),

                      const SizedBox(height: 15),

                      // =================================================
                      // TECHNICAL SKILLS
                      // =================================================

                      const FormLabel(
                        text: "Technical Skills",
                      ),

                      const SizedBox(height: 8),

                      const Column(
                        children: [
                          Row(
                            children: [
                              SkillChip(
                                text: "React",
                              ),SizedBox(width: 5,),
                              SkillChip(
                                text: "JavaScript",
                              ),SizedBox(width: 5,),
                              SkillChip(
                                text: "TypeScript",
                              ),SizedBox(width: 5,),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SkillChip(
                                text: "Node.js",
                              ),SizedBox(width: 5,),
                              SkillChip(
                                text: "Python",
                              ),SizedBox(width: 5,),
                            ],
                          )
                        ],
                      ),

                      const SizedBox(height: 16),

                      // =================================================
                      // CERTIFICATIONS
                      // =================================================

                      const FormLabel(
                        text: "Certifications",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        certificationController,
                      ),

                      const SizedBox(height: 15),

                      // =================================================
                      // PROJECTS
                      // =================================================

                      const FormLabel(
                        text: "Projects",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        projectsController,
                      ),

                      const SizedBox(height: 15),

                      // =================================================
                      // LANGUAGES
                      // =================================================

                      const FormLabel(
                        text: "Languages",
                      ),

                      const SizedBox(height: 6),

                      ProfileTextField(
                        controller:
                        languagesController,
                      ),

                      const SizedBox(height: 15),

                      // =================================================
                      // RESUME
                      // =================================================

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
                                  buttonColor,

                                  side:
                                  const BorderSide(
                                    color:
                                    buttonColor,
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
                                  EdgeInsets.zero,

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
                                        0xFF7A818C),
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
                                  EdgeInsets.zero,

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

                      // =================================================
                      // SAVE CHANGES
                      // =================================================

                      SizedBox(
                        width: double.infinity,
                        height: 40,

                        child: ElevatedButton(
                          onPressed:
                          saveChanges,

                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            foregroundColor: Colors.white,

                            elevation: 0,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7,),
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

                      // =================================================
                      // CHANGE PASSWORD
                      // =================================================

                      Center(
                        child: TextButton(
                          onPressed: () {},

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

                          child: const Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight:
                              FontWeight.w500,
                              color:
                              buttonColor,
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


// ================================================================
// FORM LABEL
// ================================================================

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


// ================================================================
// TEXT FIELD
// ================================================================

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


// ================================================================
// SKILL CHIP
// ================================================================

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

        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2162E8),
        ),
      ),
    );
  }
}