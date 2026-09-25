import 'package:flutter/material.dart';
import '../references/reference.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // ============================================================
  // FORM KEY
  // ============================================================

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ============================================================
  // RECRUITER CONTROLLERS
  // ============================================================

  final TextEditingController recruiterNameController =
  TextEditingController(text: 'Priya Mehta');

  final TextEditingController emailController =
  TextEditingController(text: 'priya@techsolutions.com');

  final TextEditingController mobileController =
  TextEditingController(text: '+91 98765 12345');

  final TextEditingController designationController =
  TextEditingController(text: 'Senior HR Manager');

  final TextEditingController locationController =
  TextEditingController(text: 'Mumbai, Maharashtra');

  // ============================================================
  // COMPANY CONTROLLERS
  // ============================================================

  final TextEditingController companyNameController =
  TextEditingController(text: 'TechSolutions Pvt Ltd');

  final TextEditingController industryController =
  TextEditingController(text: 'Information Technology');

  final TextEditingController companySizeController =
  TextEditingController(text: '250-500 Employees');

  final TextEditingController companyDescriptionController =
  TextEditingController(
    text:
    'TechSolutions Pvt Ltd is an enterprise-oriented technology consultancy '
        'delivering innovative technology integrations, cognitive processing '
        'models, and modular software layers to international corporate clients.',
  );

  final TextEditingController websiteController =
  TextEditingController(text: 'www.techsolutions.com');

  final TextEditingController companyEmailController =
  TextEditingController(text: 'info@techsolutions.com');

  final TextEditingController companyPhoneController =
  TextEditingController(text: '+91 22 1234 5678');

  final TextEditingController companyAddressController =
  TextEditingController(
    text: '123 Tech Park, Andheri East, Mumbai\n400069',
  );

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    recruiterNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    designationController.dispose();
    locationController.dispose();

    companyNameController.dispose();
    industryController.dispose();
    companySizeController.dispose();
    companyDescriptionController.dispose();
    websiteController.dispose();
    companyEmailController.dispose();
    companyPhoneController.dispose();
    companyAddressController.dispose();

    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // ==========================================================
      // BODY
      // ==========================================================

      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),

            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(5, 8, 5, 20,),
                  child: Column(
                    children: [
                      // Recruiter Information
                      _buildRecruiterInformation(),

                      const SizedBox(height: 10),

                      // Company Information
                      _buildCompanyInformation(),

                      const SizedBox(height: 14),

                      // Save Button
                      _buildSaveButton(),

                      const SizedBox(height: 6),

                      // Change Password
                      _buildChangePasswordButton(),

                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // ==========================================================
      // BOTTOM NAVIGATION
      // ==========================================================

      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 7),
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
          // Back Button
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 14,
                color: textColor,
              ),
            ),
          ),

          const SizedBox(width: 2),

          // Title
          Expanded(
            child: Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),

          // Settings
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.settings_outlined,
              size: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // RECRUITER INFORMATION
  // ============================================================

  Widget _buildRecruiterInformation() {
    return _buildSectionCard(
      title: 'Recruiter Information',
      child: Column(
        children: [
          // --------------------------------------------------------
          // RECRUITER AVATAR
          // --------------------------------------------------------

          _buildProfileAvatar(),

          const SizedBox(height: 8),

          // Recruiter Name
          _buildTextField(
            controller: recruiterNameController,
            label: 'Recruiter Name',
            validatorMessage: 'Please enter recruiter name',
          ),

          const SizedBox(height: 6),

          // Email
          _buildTextField(
            controller: emailController,
            label: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            validatorMessage: 'Please enter email address',
          ),

          const SizedBox(height: 6),

          // Mobile
          _buildTextField(
            controller: mobileController,
            label: 'Mobile Number',
            keyboardType: TextInputType.phone,
            validatorMessage: 'Please enter mobile number',
          ),

          const SizedBox(height: 6),

          // Designation
          _buildTextField(
            controller: designationController,
            label: 'Designation',
            validatorMessage: 'Please enter designation',
          ),

          const SizedBox(height: 6),

          // Location
          _buildTextField(
            controller: locationController,
            label: 'Location',
            validatorMessage: 'Please enter location',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROFILE AVATAR
  // ============================================================

  Widget _buildProfileAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: avatarColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text(
            'PM',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        // Small edit icon
        Positioned(
          right: -2,
          bottom: -1,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: blueColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.camera_alt,
              size: 8,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // COMPANY INFORMATION
  // ============================================================

  Widget _buildCompanyInformation() {
    return _buildSectionCard(
      title: 'Company Information',
      child: Column(
        children: [
          // --------------------------------------------------------
          // COMPANY LOGO
          // --------------------------------------------------------

          _buildCompanyLogo(),

          const SizedBox(height: 8),

          // Company Name
          _buildTextField(
            controller: companyNameController,
            label: 'Company Name',
            validatorMessage: 'Please enter company name',
          ),

          const SizedBox(height: 6),

          // Industry
          _buildTextField(
            controller: industryController,
            label: 'Industry',
            validatorMessage: 'Please enter industry',
          ),

          const SizedBox(height: 6),

          // Company Size
          _buildTextField(
            controller: companySizeController,
            label: 'Company Size',
            validatorMessage: 'Please enter company size',
          ),

          const SizedBox(height: 6),

          // Company Description
          _buildTextField(
            controller: companyDescriptionController,
            label: 'Company Description',
            maxLines: 4,
            validatorMessage: 'Please enter company description',
          ),

          const SizedBox(height: 6),

          // Website
          _buildTextField(
            controller: websiteController,
            label: 'Website',
            keyboardType: TextInputType.url,
            validatorMessage: 'Please enter website',
          ),

          const SizedBox(height: 6),

          // Company Email
          _buildTextField(
            controller: companyEmailController,
            label: 'Company Email',
            keyboardType: TextInputType.emailAddress,
            validatorMessage: 'Please enter company email',
          ),

          const SizedBox(height: 6),

          // Company Phone
          _buildTextField(
            controller: companyPhoneController,
            label: 'Company Phone',
            keyboardType: TextInputType.phone,
            validatorMessage: 'Please enter company phone',
          ),

          const SizedBox(height: 6),

          // Company Address
          _buildTextField(
            controller: companyAddressController,
            label: 'Company Address',
            maxLines: 2,
            validatorMessage: 'Please enter company address',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // COMPANY LOGO
  // ============================================================

  Widget _buildCompanyLogo() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: navyColor,
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: const Text(
            'TS',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        Positioned(
          right: -2,
          bottom: -2,
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: blueColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.camera_alt,
              size: 8,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SECTION CARD
  // ============================================================

  Widget _buildSectionCard({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        9,
        8,
        9,
        9,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: borderColor,
          width: 0.8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),

          const SizedBox(height: 7),

          child,
        ],
      ),
    );
  }

  // ============================================================
  // TEXT FIELD
  // ============================================================

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String validatorMessage,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Field Label
        Padding(
          padding: const EdgeInsets.only(
            left: 1,
            bottom: 3,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 7.5,
              color: greyColor,
            ),
          ),
        ),

        // Text Form Field
        SizedBox(
          height: maxLines > 1 ? null : 27,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: TextStyle(
              fontSize: 7.5,
              color: textColor,
            ),
            cursorColor: blueColor,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return validatorMessage;
              }

              return null;
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 7,
                vertical: maxLines > 1 ? 6 : 6,
              ),
              filled: true,
              fillColor: Colors.white,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: borderColor,
                  width: 0.7,
                ),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: borderColor,
                  width: 0.7,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: blueColor,
                  width: 1,
                ),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: redColor,
                  width: 0.8,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: redColor,
                  width: 1,
                ),
              ),

              errorStyle: TextStyle(
                fontSize: 7,
                color: redColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SAVE BUTTON
  // ============================================================

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        width: double.infinity,
        height: 31,
        child: ElevatedButton(
          onPressed: _saveProfile,
          style: ElevatedButton.styleFrom(
            backgroundColor: bottomColor,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text(
            'Save Changes',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // CHANGE PASSWORD
  // ============================================================

  Widget _buildChangePasswordButton() {
    return TextButton(
      onPressed: _changePassword,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        'Change Password',
        style: TextStyle(
          fontSize: 7.5,
          fontWeight: FontWeight.w500,
          color: blueColor,
        ),
      ),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  Widget _buildBottomNavigation() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: bottomColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home_outlined,
            label: 'Dashboard',
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.add_circle_outline,
            label: 'Post Job',
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.business_center_outlined,
            label: 'My Jobs',
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.people_outline,
            label: 'Applications',
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.person_outline,
            label: 'Profile',
            selected: true,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM NAV ITEM
  // ============================================================

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool selected,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Add your navigation logic here.
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 2,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: selected
                ? avatarColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 14,
                color: Colors.white,
              ),

              const SizedBox(height: 2),

              Text(
                label,
                style: const TextStyle(
                  fontSize: 5.5,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SAVE PROFILE
  // ============================================================

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Profile updated successfully',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          backgroundColor: bottomColor,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  // ============================================================
  // CHANGE PASSWORD
  // ============================================================

  void _changePassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: Text(
            'Change Password',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          content: const Text(
            'Password change functionality can be added here.',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: TextStyle(
                  color: blueColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}