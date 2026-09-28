import 'package:flutter/material.dart';
import 'package:job_portal/Employe_side/profile.dart';

import '../User_side/login.dart';
import '../references/reference.dart';

// ============================================================
// SETTINGS PAGE
// ============================================================

class EMPSettingsPage extends StatefulWidget {
  const EMPSettingsPage({super.key});

  @override
  State<EMPSettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<EMPSettingsPage> {
  // ==========================================================
  // VARIABLES
  // ==========================================================

  int selectedIndex = 4;

  // Which setting is currently expanded
  String? expandedSetting;

  // Switch values
  bool pushNotification = true;
  bool emailNotification = true;
  bool privateProfile = false;

  // Selected language
  String selectedLanguage = "English";

  // ==========================================================
  // EXPAND / COLLAPSE
  // ==========================================================

  void toggleSetting(String setting) {
    setState(() {
      if (expandedSetting == setting) {
        expandedSetting = null;
      } else {
        expandedSetting = setting;
      }
    });
  }

  // ==========================================================
  // BOTTOM NAVIGATION
  // ==========================================================

  void onBottomNavigationTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // ==========================================================
  // LOGOUT DIALOG
  // ==========================================================

  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Logout",
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Are you sure you want to logout?",
            style: TextStyle(
              color: greyColor,
              fontSize: 14,
            ),
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

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: redColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ==========================================================
  // DELETE ACCOUNT DIALOG
  // ==========================================================

  void showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Delete Account",
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Are you sure you want to permanently delete your account?",
            style: TextStyle(
              color: greyColor,
              fontSize: 14,
            ),
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

                // Add delete account logic here
              },
              child: Text(
                "Delete",
                style: TextStyle(
                  color: redColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,

      // ======================================================
      // APP BAR
      // ======================================================

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,

        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.045,
          ),
          child: Row(
            children: [
              // BACK BUTTON
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanyProfilePage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: blueColor,
                ),
              ),

              const SizedBox(width: 5),

              // HIREHUB
              Text(
                "HireHub",
                style: TextStyle(
                  color: textColor,
                  fontSize: size.width < 360 ? 17 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              // COMPANY AVATAR
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyProfilePage()));
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: navyColor,
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
              ),
            ],
          ),
        ),
      ),

      // ======================================================
      // BODY
      // ======================================================

      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  size.width * 0.045,
                  0,
                  size.width * 0.045,
                  20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ==================================================
                    // PAGE TITLE
                    // ==================================================

                    Text(
                      "Settings",
                      style: TextStyle(
                        color: textColor,
                        fontSize: size.width < 360 ? 23 : 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.018,
                    ),

                    // ==================================================
                    // ACCOUNT SETTINGS
                    // ==================================================

                    _buildAccountSettingsCard(),

                    SizedBox(
                      height: size.height * 0.018,
                    ),

                    // ==================================================
                    // SUPPORT
                    // ==================================================

                    _buildSupportCard(),

                    SizedBox(
                      height: size.height * 0.018,
                    ),

                    // ==================================================
                    // ACCOUNT ACTIONS
                    // ==================================================

                    _buildAccountActionsCard(),

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
  // ACCOUNT SETTINGS CARD
  // ============================================================

  Widget _buildAccountSettingsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(
        16,
        15,
        16,
        10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account Settings",
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // EDIT PROFILE
          _buildExpandableSetting(
            icon: Icons.person_outline_rounded,
            title: "Edit Profile",
            settingKey: "profile",
            child: _buildProfileDetails(),
          ),

          _buildDivider(),

          // NOTIFICATIONS
          _buildExpandableSetting(
            icon: Icons.notifications_none_rounded,
            title: "Notification Settings",
            settingKey: "notification",
            child: _buildNotificationDetails(),
          ),

          _buildDivider(),

          // PRIVACY
          _buildExpandableSetting(
            icon: Icons.shield_outlined,
            title: "Privacy Settings",
            settingKey: "privacy",
            child: _buildPrivacyDetails(),
          ),

          _buildDivider(),

          // LANGUAGE
          _buildExpandableSetting(
            icon: Icons.language_rounded,
            title: "Language",
            settingKey: "language",
            child: _buildLanguageDetails(),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SUPPORT CARD
  // ============================================================

  Widget _buildSupportCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(
        16,
        15,
        16,
        10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Support & Information",
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          _buildExpandableSetting(
            icon: Icons.help_outline_rounded,
            title: "Help & Support",
            settingKey: "support",
            child: _buildSupportDetails(),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // EXPANDABLE SETTING ROW
  // ============================================================

  Widget _buildExpandableSetting({
    required IconData icon,
    required String title,
    required String settingKey,
    required Widget child,
  }) {
    final bool isExpanded = expandedSetting == settingKey;

    return Column(
      children: [
        InkWell(
          onTap: () {
            toggleSetting(settingKey);
          },
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 55,
            child: Row(
              children: [
                // ICON
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: chipColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 14,
                    color: iconColor,
                  ),
                ),

                const SizedBox(width: 10),

                // TITLE
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // ARROW
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: greyColor,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
        ),

        // EXPANDED CONTENT
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 32,
              right: 5,
              bottom: 12,
            ),
            child: child,
          ),
          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(
            milliseconds: 220,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // PROFILE DETAILS
  // ============================================================

  Widget _buildProfileDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Manage your company profile information.",
          style: TextStyle(
            color: greyColor,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 10),

        _buildDetailItem(
          icon: Icons.business_outlined,
          title: "Company Name",
          value: "TCS",
        ),

        const SizedBox(height: 7),

        _buildDetailItem(
          icon: Icons.email_outlined,
          title: "Email",
          value: "company@tcs.com",
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 32,
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompanyProfilePage(),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: blueColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              "Edit Profile",
              style: TextStyle(
                color: blueColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // NOTIFICATION DETAILS
  // ============================================================

  Widget _buildNotificationDetails() {
    return Column(
      children: [
        _buildSwitchRow(
          title: "Push Notifications",
          subtitle: "Receive notifications about applications.",
          value: pushNotification,
          onChanged: (value) {
            setState(() {
              pushNotification = value;
            });
          },
        ),

        const SizedBox(height: 8),

        _buildSwitchRow(
          title: "Email Notifications",
          subtitle: "Receive important updates by email.",
          value: emailNotification,
          onChanged: (value) {
            setState(() {
              emailNotification = value;
            });
          },
        ),
      ],
    );
  }

  // ============================================================
  // PRIVACY DETAILS
  // ============================================================

  Widget _buildPrivacyDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSwitchRow(
          title: "Private Profile",
          subtitle: "Hide your company profile from public search.",
          value: privateProfile,
          onChanged: (value) {
            setState(() {
              privateProfile = value;
            });
          },
        ),

        const SizedBox(height: 10),

        Text(
          "Your information is protected and only shared according to your account settings.",
          style: TextStyle(
            color: greyColor,
            fontSize: 11,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // LANGUAGE DETAILS
  // ============================================================

  Widget _buildLanguageDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select your preferred language.",
          style: TextStyle(
            color: greyColor,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 8),

        _buildLanguageOption(
          "English",
        ),

        _buildLanguageOption(
          "Hindi",
        ),

        _buildLanguageOption(
          "Gujarati",
        ),
      ],
    );
  }

  // ============================================================
  // LANGUAGE OPTION
  // ============================================================

  Widget _buildLanguageOption(String language) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Row(
          children: [
            Icon(
              selectedLanguage == language
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              size: 18,
              color: selectedLanguage == language
                  ? blueColor
                  : greyColor,
            ),

            const SizedBox(width: 8),

            Text(
              language,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: selectedLanguage == language
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SUPPORT DETAILS
  // ============================================================

  Widget _buildSupportDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Need help with HireHub?",
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          "Contact our support team for assistance with your account, jobs and applications.",
          style: TextStyle(
            color: greyColor,
            fontSize: 11,
            height: 1.4,
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Icon(
              Icons.email_outlined,
              size: 16,
              color: iconColor,
            ),

            const SizedBox(width: 7),

            Text(
              "support@hirehub.com",
              style: TextStyle(
                color: blueColor,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 7),

        Row(
          children: [
            Icon(
              Icons.phone_outlined,
              size: 16,
              color: iconColor,
            ),

            const SizedBox(width: 7),

            Text(
              "+91 1800 123 4567",
              style: TextStyle(
                color: textColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // DETAIL ITEM
  // ============================================================

  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 16,
          color: iconColor,
        ),

        const SizedBox(width: 7),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: greyColor,
                  fontSize: 10,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                value,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SWITCH ROW
  // ============================================================

  Widget _buildSwitchRow({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                subtitle,
                style: TextStyle(
                  color: greyColor,
                  fontSize: 10,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 5),

        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          activeTrackColor: blueColor,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: borderColor,
          materialTapTargetSize:
          MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }

  // ============================================================
  // DIVIDER
  // ============================================================

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: borderColor,
    );
  }

  // ============================================================
  // ACCOUNT ACTIONS
  // ============================================================

  Widget _buildAccountActionsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(
        16,
        15,
        16,
        16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account Actions",
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 13),

          // LOGOUT
          SizedBox(
            width: double.infinity,
            height: 33,
            child: OutlinedButton(
              onPressed: showLogoutDialog,
              style: OutlinedButton.styleFrom(
                foregroundColor: redColor,
                side: BorderSide(
                  color: redColor,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                "Logout",
                style: TextStyle(
                  color: redColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 9),

          // DELETE ACCOUNT
          SizedBox(
            width: double.infinity,
            height: 33,
            child: ElevatedButton(
              onPressed: showDeleteAccountDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: redColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.zero,
              ),
              child: const Text(
                "Delete Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  // ============================================================
  // NAV ITEM
  // ============================================================

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          onBottomNavigationTap(index);
        },
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 62,
            height: 48,
            decoration: BoxDecoration(
              color: isSelected
                  ? avatarColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isSelected ? activeIcon : icon,
                  color: isSelected
                      ? Colors.white
                      : Colors.white70,
                  size: 19,
                ),

                const SizedBox(height: 3),

                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Colors.white70,
                    fontSize: 8,
                    fontWeight: isSelected
                        ? FontWeight.w500
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}