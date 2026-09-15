import 'package:flutter/material.dart';
import 'package:job_portal/User_side/settings_page.dart';
import 'edit_profile.dart';
import 'resume_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // ============================================================
  // COLORS
  // ============================================================

  static const Color bgColor = Color(0xFFFFFCF7);
  static const Color textColor = Color(0xFF17233B);
  static const Color greyColor = Color(0xFF737B87);
  static const Color avatarColor = Color(0xFF397184);
  static const Color buttonColor = Color(0xFF2864E8);
  static const Color borderColor = Color(0xFFE1E5E9);
  static const Color chipColor = Color(0xFFF0F5FF);

  @override
  Widget build(BuildContext context) {
    // ============================================================
    // FIX:
    // Use Scaffold instead of Container.
    // This provides the Material widget required by
    // InkWell, ElevatedButton, etc.
    // ============================================================

    return Scaffold(
      backgroundColor: bgColor,

      body: SafeArea(
        top: true,
        bottom: false,

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

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                child: Row(
                  children: [

                    const Text(
                      "HireHub",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                        letterSpacing: -0.3,
                      ),
                    ),

                    const Spacer(),

                    // SETTINGS BUTTON
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SettingsPage(),
                          ),
                        );
                      },

                      child: Container(
                        width: 32,
                        height: 32,

                        decoration: const BoxDecoration(
                          color: Color(0xFF376B7D),
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.settings,
                          size: 19,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ======================================================
            // PAGE CONTENT
            // ======================================================

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    13,
                    16,
                    24,
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      // ==================================================
                      // MY PROFILE
                      // ==================================================

                      const Text(
                        "My Profile",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                          letterSpacing: -0.4,
                        ),
                      ),

                      const SizedBox(height: 15),

                      // ==================================================
                      // PROFILE CARD
                      // ==================================================

                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.fromLTRB(
                          20,
                          20,
                          20,
                          18,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                          BorderRadius.circular(10),

                          border: Border.all(
                            color: borderColor,
                            width: 1,
                          ),
                        ),

                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,

                          children: [

                            // ==========================================
                            // AVATAR
                            // ==========================================

                            Container(
                              width: 75,
                              height: 75,

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
                                    fontSize: 23,
                                    fontWeight:
                                    FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            // ==========================================
                            // NAME
                            // ==========================================

                            const Text(
                              "Rahul Sharma",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: textColor,
                                letterSpacing: -0.2,
                              ),
                            ),

                            const SizedBox(height: 3),

                            // ==========================================
                            // SUBTITLE
                            // ==========================================

                            const Text(
                              "Job Seeker • Senior React Developer",
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: greyColor,
                              ),
                            ),

                            const SizedBox(height: 12),

                            // ==========================================
                            // EDIT BUTTON
                            // ==========================================

                            SizedBox(
                              width: 104,
                              height: 34,

                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfilePage(),
                                    ),
                                  );
                                },

                                style:
                                ElevatedButton.styleFrom(
                                  backgroundColor:
                                  buttonColor,
                                  foregroundColor:
                                  Colors.white,
                                  elevation: 0,
                                  padding: EdgeInsets.zero,

                                  shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                      6,
                                    ),
                                  ),
                                ),

                                child: const Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight:
                                    FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // ==========================================
                            // DIVIDER
                            // ==========================================

                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0xFFE6E6E6),
                            ),

                            const SizedBox(height: 17),

                            // ==========================================
                            // PROFILE INFORMATION
                            // ==========================================

                            const Align(
                              alignment:
                              Alignment.centerLeft,

                              child: Text(
                                "Profile Information",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight:
                                  FontWeight.w700,
                                  color: textColor,
                                ),
                              ),
                            ),

                            const SizedBox(height: 13),

                            // EMAIL

                            const ProfileDetail(
                              title: "Email Address",
                              value: "rahul@email.com",
                            ),

                            const SizedBox(height: 10),

                            // PHONE

                            const ProfileDetail(
                              title: "Phone Number",
                              value:
                              "+91 98765 43210",
                            ),

                            const SizedBox(height: 10),

                            // LOCATION

                            const ProfileDetail(
                              title: "Location",
                              value:
                              "Mumbai, Maharashtra",
                            ),

                            const SizedBox(height: 10),

                            // EXPERIENCE

                            const ProfileDetail(
                              title: "Total Experience",
                              value: "4 years",
                            ),

                            const SizedBox(height: 16),

                            // ==========================================
                            // SECOND DIVIDER
                            // ==========================================

                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0xFFE6E6E6),
                            ),

                            const SizedBox(height: 16),

                            // ==========================================
                            // TECHNICAL SKILLS
                            // ==========================================

                            const Align(
                              alignment:
                              Alignment.centerLeft,

                              child: Text(
                                "Technical Skills",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight:
                                  FontWeight.w700,
                                  color: textColor,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            // ==========================================
                            // FIXED SKILLS
                            //
                            // Changed Row -> Wrap.
                            // This prevents horizontal overflow.
                            // ==========================================

                            const Align(
                              alignment:
                              Alignment.centerLeft,

                              child: Wrap(
                                spacing: 5,
                                runSpacing: 10,

                                children: [

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
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      // ==================================================
                      // MY RESUME SECTION
                      // ==================================================

                      const Text(
                        "My Resume",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // ==================================================
                      // RESUME CARD
                      // ==================================================

                      InkWell(
                        borderRadius:
                        BorderRadius.circular(10),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const ResumePage(),
                            ),
                          );
                        },

                        child: Container(
                          width: double.infinity,

                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius:
                            BorderRadius.circular(10),

                            border: Border.all(
                              color: borderColor,
                              width: 1,
                            ),
                          ),

                          child: Row(
                            children: [

                              // PDF ICON
                              Container(
                                width: 44,
                                height: 44,

                                decoration: BoxDecoration(
                                  color:
                                  const Color(
                                    0xFFF0F5FF,
                                  ),

                                  borderRadius:
                                  BorderRadius.circular(
                                    8,
                                  ),
                                ),

                                child: const Icon(
                                  Icons
                                      .picture_as_pdf_outlined,
                                  color:
                                  Color(0xFF2864E8),
                                  size: 24,
                                ),
                              ),

                              const SizedBox(width: 12),

                              // TEXT
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                                  children: [

                                    Text(
                                      "My Resume",
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight:
                                        FontWeight.w600,
                                        color:
                                        textColor,
                                      ),
                                    ),

                                    SizedBox(height: 4),

                                    Text(
                                      "View and manage your resume",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                        greyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // ARROW
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color:
                                Color(0xFF737B87),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
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


// ==================================================================
// PROFILE DETAIL
// ==================================================================

class ProfileDetail extends StatelessWidget {
  final String title;
  final String value;

  const ProfileDetail({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF7A818C),
            ),
          ),

          const SizedBox(height: 3),

          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF17233B),
            ),
          ),
        ],
      ),
    );
  }
}


// ==================================================================
// SKILL CHIP
// ==================================================================

class SkillChip extends StatelessWidget {
  final String text;

  const SkillChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF0F5FF),
        borderRadius:
        BorderRadius.circular(16),
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