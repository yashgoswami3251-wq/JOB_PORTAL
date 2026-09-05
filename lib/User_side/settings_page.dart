import 'package:flutter/material.dart';
import 'package:job_portal/User_side/home_page.dart';
import 'package:job_portal/User_side/login.dart';
import 'edit_profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  // ============================================================
  // COLORS
  // ============================================================

  static const Color bgColor = Color(0xFFFFFCF7);
  static const Color textColor = Color(0xFF17233B);
  static const Color greyColor = Color(0xFF737B87);
  static const Color iconColor = Color(0xFF397184);
  static const Color borderColor = Color(0xFFE1E5E9);
  static const Color redColor = Color(0xFFF04444);

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

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                child: Row(
                  children: [

                    // ==================================================
                    // HIREHUB
                    // ==================================================

                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        },
                        child: Icon(Icons.exit_to_app)
                    ),

                    SizedBox(width: 10,),

                    const Text(
                      "HireHub",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                        letterSpacing: -0.3,
                      ),
                    ),

                    const Spacer(),

                    // ==================================================
                    // PROFILE CIRCLE
                    // ==================================================

                    Container(
                      width: 30,
                      height: 30,

                      decoration: const BoxDecoration(
                        color: Color(0xFF397184),
                        shape: BoxShape.circle,
                      ),

                      child: const Center(
                        child: Text(
                          "RS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ======================================================
            // SCROLLABLE CONTENT
            // ======================================================

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                padding: const EdgeInsets.fromLTRB(
                  19,
                  13,
                  19,
                  25,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    // ==================================================
                    // SETTINGS TITLE
                    // ==================================================

                    const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                        letterSpacing: -0.4,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ==================================================
                    // ACCOUNT SETTINGS
                    // ==================================================

                    SettingsSection(
                      title: "Account Settings",

                      children: [

                        SettingsItem(
                          icon: Icons.person_outline,
                          title: "Edit Profile",

                          information:
                          "Update your personal information, profile "
                              "photo, contact details and professional "
                              "information.",

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilePage(),
                              ),
                            );
                          },
                        ),

                        SettingsItem(
                          icon: Icons.notifications_none,
                          title: "Notification Settings",

                          information:
                          "Manage your notification preferences and "
                              "choose which job alerts and application "
                              "updates you want to receive.",
                        ),

                        SettingsItem(
                          icon: Icons.shield_outlined,
                          title: "Privacy Settings",

                          information:
                          "Control your privacy preferences and "
                              "manage how your profile and personal "
                              "information is displayed.",
                        ),

                        SettingsItem(
                          icon: Icons.language,
                          title: "Language",

                          information:
                          "Choose the language you want to use "
                              "throughout the HireHub application.",
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // ==================================================
                    // SUPPORT & INFORMATION
                    // ==================================================

                    SettingsSection(
                      title: "Support & Information",

                      children: [

                        SettingsItem(
                          icon: Icons.help_outline,
                          title: "Help & Support",

                          information:
                          "Need help? Find answers to common "
                              "questions or contact our support team "
                              "for assistance.",
                        ),

                        SettingsItem(
                          icon: Icons.info_outline,
                          title: "About Us",

                          information:
                          "HireHub is a job platform designed to "
                              "help job seekers discover opportunities "
                              "and connect with employers.",
                        ),

                        SettingsItem(
                          icon: Icons.mail_outline,
                          title: "Contact Us",

                          information:
                          "For questions or assistance, contact "
                              "the HireHub support team through the "
                              "available support channels.",
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // ==================================================
                    // LEGAL
                    // ==================================================

                    SettingsSection(
                      title: "Legal",

                      children: [

                        SettingsItem(
                          icon: Icons.description_outlined,
                          title: "Terms & Conditions",

                          information:
                          "These terms explain the rules and "
                              "conditions for using the HireHub "
                              "application and its services.",
                        ),

                        SettingsItem(
                          icon: Icons.lock_outline,
                          title: "Privacy Policy",

                          information:
                          "Our privacy policy explains how your "
                              "personal information is collected, "
                              "used and protected.",
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // ==================================================
                    // ACCOUNT ACTIONS
                    // ==================================================

                    Container(
                      width: double.infinity,

                      padding: const EdgeInsets.fromLTRB(
                        16,
                        14,
                        16,
                        16,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(10),

                        border: Border.all(
                          color: borderColor,
                          width: 1,
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          // ==================================================
                          // TITLE
                          // ==================================================

                          const Text(
                            "Account Actions",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: textColor,
                            ),
                          ),

                          const SizedBox(height: 13),

                          // ==================================================
                          // LOGOUT
                          // ==================================================

                          SizedBox(
                            width: double.infinity,
                            height: 32,

                            child: OutlinedButton(
                              onPressed: () {
                                _showLogoutDialog(context);
                              },

                              style: OutlinedButton.styleFrom(
                                foregroundColor: redColor,

                                side: const BorderSide(
                                  color: redColor,
                                  width: 1,
                                ),

                                padding: EdgeInsets.zero,

                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(5),
                                ),
                              ),

                              child: const Text(
                                "Logout",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // ==================================================
                          // DELETE ACCOUNT
                          // ==================================================

                          SizedBox(
                            width: double.infinity,
                            height: 32,

                            child: ElevatedButton(
                              onPressed: () {
                                _showDeleteDialog(context);
                              },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: redColor,
                                foregroundColor: Colors.white,

                                elevation: 0,

                                padding: EdgeInsets.zero,

                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(5),
                                ),
                              ),

                              child: const Text(
                                "Delete Account",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),
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
  // LOGOUT DIALOG
  // ============================================================

  void _showLogoutDialog(BuildContext context) {

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,

          title: const Text(
            "Logout",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),

          content: const Text(
            "Are you sure you want to logout?",
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: greyColor,
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },

              child: const Text(
                "Logout",
                style: TextStyle(
                  color: redColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // DELETE ACCOUNT DIALOG
  // ============================================================

  void _showDeleteDialog(BuildContext context) {

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,

          title: const Text(
            "Delete Account",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),

          content: const Text(
            "Are you sure you want to delete your account? "
                "This action cannot be undone.",
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: greyColor,
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);

                // Add your delete account logic here
              },

              child: const Text(
                "Delete",
                style: TextStyle(
                  color: redColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}


// ==================================================================
// SETTINGS SECTION
// ==================================================================

class SettingsSection extends StatelessWidget {

  final String title;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(10),

        border: Border.all(
          color: const Color(0xFFE1E5E9),
          width: 1,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          16,
          14,
          16,
          0,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // ========================================================
            // SECTION TITLE
            // ========================================================

            Text(
              title,

              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: Color(0xFF17233B),
              ),
            ),

            const SizedBox(height: 5),

            // ========================================================
            // ITEMS
            // ========================================================

            ...children,
          ],
        ),
      ),
    );
  }
}


// ==================================================================
// SETTINGS ITEM
// ==================================================================

class SettingsItem extends StatefulWidget {

  final IconData icon;
  final String title;
  final String information;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.information,
    this.onTap,
  });

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        // ============================================================
        // MAIN ROW
        // ============================================================

        InkWell(
          onTap: () {

            // If Edit Profile has navigation,
            // navigate instead of expanding.

            if (widget.onTap != null) {
              widget.onTap!();
              return;
            }

            setState(() {
              isExpanded = !isExpanded;
            });
          },

          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 13,
            ),

            child: Row(
              children: [

                // ==================================================
                // ICON CIRCLE
                // ==================================================

                Container(
                  width: 22,
                  height: 22,

                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F6FA),
                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    widget.icon,
                    size: 17,
                    color: const Color(0xFF397184),
                  ),
                ),

                const SizedBox(width: 10),

                // ==================================================
                // TITLE
                // ==================================================

                Expanded(
                  child: Text(
                    widget.title,

                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF17233B),
                    ),
                  ),
                ),

                // ==================================================
                // ARROW
                // ==================================================

                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,

                  duration:
                  const Duration(milliseconds: 200),

                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 27,
                    color: Color(0xFF737B87),
                  ),
                ),
              ],
            ),
          ),
        ),

        // ============================================================
        // EXPANDED INFORMATION
        // ============================================================

        AnimatedCrossFade(
          firstChild: const SizedBox(
            width: double.infinity,
          ),

          secondChild: Container(
            width: double.infinity,

            margin: const EdgeInsets.only(
              left: 32,
              right: 5,
              bottom: 12,
            ),

            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FC),

              borderRadius: BorderRadius.circular(6),
            ),

            child: Text(
              widget.information,

              style: const TextStyle(
                fontSize: 11,
                height: 1.5,
                color: Color(0xFF737B87),
              ),
            ),
          ),

          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,

          duration:
          const Duration(milliseconds: 200),
        ),

        // ============================================================
        // DIVIDER
        // ============================================================

        if (!isExpanded)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE8EBEE),
          ),
      ],
    );
  }
}