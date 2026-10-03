import 'package:flutter/material.dart';
import '../references/reference.dart';

class EditUserPage extends StatefulWidget {
  final Map<String, dynamic> user;

  const EditUserPage({
    super.key,
    required this.user,
  });

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  // ============================================================
  // FORM KEY
  // ============================================================

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // ============================================================
  // CONTROLLERS
  // ============================================================

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  late TextEditingController bioController;

  // ============================================================
  // DROPDOWN VALUES
  // ============================================================

  late String selectedRole;
  late String selectedStatus;

  final List<String> roles = [
    'User',
    'Employer',
  ];

  final List<String> statuses = [
    'Active',
    'Inactive',
    'Pending',
  ];

  @override
  void initState() {
    super.initState();

    // ==========================================================
    // SET EXISTING USER DATA
    // ==========================================================

    nameController = TextEditingController(
      text: widget.user['name']?.toString() ?? '',
    );

    emailController = TextEditingController(
      text: widget.user['email']?.toString() ?? '',
    );

    phoneController = TextEditingController(
      text: widget.user['phone']?.toString() ?? '',
    );

    locationController = TextEditingController(
      text: widget.user['location']?.toString() ?? '',
    );

    bioController = TextEditingController(
      text: widget.user['bio']?.toString() ?? '',
    );

    selectedRole =
        widget.user['role']?.toString() ?? 'User';

    selectedStatus =
        widget.user['status']?.toString() ?? 'Active';

    // Safety check
    if (!roles.contains(selectedRole)) {
      selectedRole = 'User';
    }

    if (!statuses.contains(selectedStatus)) {
      selectedStatus = 'Active';
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    bioController.dispose();

    super.dispose();
  }

  // ============================================================
  // SAVE USER
  // ============================================================

  void saveUser() {
    // Validate all TextFormFields
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Create updated user
    final Map<String, dynamic> updatedUser = {
      ...widget.user,

      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'location': locationController.text.trim(),
      'role': selectedRole,
      'status': selectedStatus,
      'bio': bioController.text.trim(),

      // Generate initials again
      'initials': getInitials(
        nameController.text.trim(),
      ),
    };

    // Return updated data
    Navigator.pop(
      context,
      updatedUser,
    );
  }

  // ============================================================
  // GET INITIALS
  // ============================================================

  String getInitials(String name) {
    if (name.trim().isEmpty) {
      return '';
    }

    List<String> words = name.trim().split(' ');

    if (words.length == 1) {
      return words[0][0].toUpperCase();
    }

    return (
        words[0][0] +
            words[1][0]
    ).toUpperCase();
  }

  // ============================================================
  // VALIDATE NAME
  // ============================================================

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter name';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }

    if (value.trim().length > 50) {
      return 'Name must not exceed 50 characters';
    }

    final nameRegex = RegExp(
      r'^[a-zA-Z ]+$',
    );

    if (!nameRegex.hasMatch(value.trim())) {
      return 'Name can contain only letters';
    }

    return null;
  }

  // ============================================================
  // VALIDATE EMAIL
  // ============================================================

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter email';
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }

    return null;
  }

  // ============================================================
  // VALIDATE PHONE
  // ============================================================

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter phone number';
    }

    final phone = value.trim();

    final phoneRegex = RegExp(r'^[0-9]{10}$',);

    if (!phoneRegex.hasMatch(phone)) {
      return 'Phone number must contain 10 digits';
    }

    return null;
  }

  // ============================================================
  // VALIDATE LOCATION
  // ============================================================

  String? validateLocation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter location';
    }

    if (value.trim().length < 2) {
      return 'Location is too short';
    }

    if (value.trim().length > 100) {
      return 'Location is too long';
    }

    return null;
  }

  // ============================================================
  // VALIDATE BIO
  // ============================================================

  String? validateBio(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter bio';
    }

    if (value.trim().length < 10) {
      return 'Bio must be at least 10 characters';
    }

    if (value.trim().length > 300) {
      return 'Bio must not exceed 300 characters';
    }

    return null;
  }

  // ============================================================
  // TEXT FORM FIELD
  // ============================================================

  Widget buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    IconData? prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 6),

        TextFormField(
          controller: controller,

          keyboardType: keyboardType,

          maxLines: maxLines,

          validator: validator,

          style: TextStyle(
            color: textColor,
            fontSize: 11,
          ),

          decoration: InputDecoration(
            hintText: hint,

            hintStyle: TextStyle(
              color: greyColor,
              fontSize: 11,
            ),

            prefixIcon: prefixIcon == null
                ? null
                : Icon(
              prefixIcon,
              color: greyColor,
              size: 18,
            ),

            filled: true,

            fillColor: Colors.white,

            contentPadding:
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 11,
            ),

            border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),

              borderSide: BorderSide(
                color: borderColor,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),

              borderSide: BorderSide(
                color: borderColor,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),

              borderSide: BorderSide(
                color: blueColor,
                width: 1.2,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),

              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),

            focusedErrorBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),

              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DROPDOWN
  // ============================================================

  Widget buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 6),

        DropdownButtonFormField<String>(
          initialValue: value,

          items: items.map(
                (String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 11,
                  ),
                ),
              );
            },
          ).toList(),

          onChanged: onChanged,

          decoration: InputDecoration(
            filled: true,

            fillColor: Colors.white,

            contentPadding:
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 11,
            ),

            border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),

              borderSide: BorderSide(
                color: borderColor,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),

              borderSide: BorderSide(
                color: borderColor,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),

              borderSide: BorderSide(
                color: blueColor,
                width: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        backgroundColor: backgroundColor,

        elevation: 0,

        surfaceTintColor:
        Colors.transparent,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: Icon(
            Icons.arrow_back,
            color: primaryBlue,
          ),
        ),

        title: Text(
          'Edit User',
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ========================================================
      // BODY
      // ========================================================

      body: Form(
        key: formKey,

        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            14,
            5,
            14,
            20,
          ),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              // ==================================================
              // USER ID
              // ==================================================

              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: chipColor,

                  borderRadius:
                  BorderRadius.circular(7),

                  border: Border.all(
                    color: borderColor,
                  ),
                ),

                child: Row(
                  children: [

                    Icon(
                      Icons.badge_outlined,
                      color: blueColor,
                      size: 20,
                    ),

                    const SizedBox(width: 9),

                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          'USER ID',
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 8,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 2),

                        Text(
                          widget.user['userId']
                              ?.toString() ??
                              'N/A',

                          style: TextStyle(
                            color: textColor,
                            fontSize: 11,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // ==================================================
              // PERSONAL INFORMATION
              // ==================================================

              Text(
                'Personal Information',
                style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Name
              buildTextField(
                label: 'Full Name',
                hint: 'Enter full name',
                controller: nameController,
                validator: validateName,
                prefixIcon:
                Icons.person_outline,
              ),

              const SizedBox(height: 12),

              // Email
              buildTextField(
                label: 'Email Address',
                hint: 'Enter email address',
                controller: emailController,
                validator: validateEmail,
                keyboardType:
                TextInputType.emailAddress,
                prefixIcon:
                Icons.email_outlined,
              ),

              const SizedBox(height: 12),

              // Phone
              buildTextField(
                label: 'Phone Number',
                hint: 'Enter 10 digit phone number',
                controller: phoneController,
                validator: validatePhone,
                keyboardType:
                TextInputType.phone,
                prefixIcon:
                Icons.phone_outlined,
              ),

              const SizedBox(height: 12),

              // Location
              buildTextField(
                label: 'Location',
                hint: 'Enter location',
                controller: locationController,
                validator: validateLocation,
                prefixIcon:
                Icons.location_on_outlined,
              ),

              const SizedBox(height: 15),

              // ==================================================
              // ACCOUNT INFORMATION
              // ==================================================

              Text(
                'Account Information',
                style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [

                  // Role
                  Expanded(
                    child: buildDropdown(
                      label: 'Role',
                      value: selectedRole,
                      items: roles,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedRole =
                                value;
                          });
                        }
                      },
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Status
                  Expanded(
                    child: buildDropdown(
                      label: 'Status',
                      value: selectedStatus,
                      items: statuses,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedStatus =
                                value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // ==================================================
              // BIO
              // ==================================================

              Text(
                'About User',
                style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              buildTextField(
                label: 'Personal Bio',
                hint: 'Enter user bio',
                controller: bioController,
                validator: validateBio,
                maxLines: 5,
              ),

              const SizedBox(height: 20),

              // ==================================================
              // BUTTONS
              // ==================================================

              Row(
                children: [

                  // Cancel
                  Expanded(
                    child: SizedBox(
                      height: 42,

                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        style:
                        OutlinedButton.styleFrom(
                          foregroundColor:
                          textColor,

                          side: BorderSide(
                            color: borderColor,
                          ),

                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(6),
                          ),
                        ),

                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Save
                  Expanded(
                    child: SizedBox(
                      height: 42,

                      child: ElevatedButton(
                        onPressed: saveUser,

                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          blueColor,

                          foregroundColor:
                          Colors.white,

                          elevation: 0,

                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(6),
                          ),
                        ),

                        child: const Text(
                          'Save Changes',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}