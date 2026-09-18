import 'package:flutter/material.dart';
import 'package:job_portal/User_side/home_page.dart';

class ApplyJobPage extends StatefulWidget {
  final Map<String, dynamic>? job;

  const ApplyJobPage({
    super.key,
    this.job,
  });

  @override
  State<ApplyJobPage> createState() => _ApplyJobPageState();
}

class _ApplyJobPageState extends State<ApplyJobPage> {
  // ============================================================
  // COLORS - HIREHUB THEME
  // ============================================================

  static const Color backgroundColor = Color(0xFFFFFCF7);
  static const Color navyColor = Color(0xFF17233B);
  static const Color blueColor = Color(0xFF2864E8);
  static const Color borderColor = Color(0xFFE1E5EB);
  static const Color hintColor = Color(0xFF7A8494);

  // ============================================================
  // FORM CONTROLLERS
  // ============================================================

  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController =
  TextEditingController(text: "Rahul Sharma");

  final TextEditingController emailController =
  TextEditingController(text: "rahulsharma@gmail.com");

  final TextEditingController phoneController =
  TextEditingController(text: "+91 98765 43210");

  final TextEditingController salaryController =
  TextEditingController();

  final TextEditingController dateController =
  TextEditingController();

  final TextEditingController coverLetterController =
  TextEditingController();

  // ============================================================
  // STATIC RESUME
  // ============================================================

  final String staticResumeName = "Rahul_Sharma_Resume.pdf";

  // ============================================================
  // JOB DATA
  // ============================================================

  String get jobTitle {
    return widget.job?['title'] ?? "Senior React Developer";
  }

  String get companyName {
    return widget.job?['company'] ?? "TCS";
  }

  String get location {
    return widget.job?['location'] ?? "Mumbai, Maharashtra";
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    salaryController.dispose();
    dateController.dispose();
    coverLetterController.dispose();

    super.dispose();
  }

  // ============================================================
  // DATE PICKER
  // ============================================================

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: blueColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: navyColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text =
        "${pickedDate.day.toString().padLeft(2, '0')}/"
            "${pickedDate.month.toString().padLeft(2, '0')}/"
            "${pickedDate.year}";
      });
    }
  }

  // ============================================================
  // SUBMIT APPLICATION
  // ============================================================

  void submitApplication() {
    // Validate only the normal form fields.
    // Resume has NO validation.
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Application submitted successfully!",
        ),
      ),
    );

    // Return application data to previous page.
    Navigator.pop(
      context,
      {
        'title': jobTitle,
        'company': companyName,
        'location': location,
        'status': 'Applied',
        'fullName': fullNameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'salary': salaryController.text,
        'startDate': dateController.text,
        'coverLetter': coverLetterController.text,

        // Static resume
        'resume': staticResumeName,
      },
    );
  }

  // ============================================================
  // TEXT STYLE
  // ============================================================

  TextStyle get labelStyle {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: navyColor,
    );
  }

  TextStyle get inputTextStyle {
    return const TextStyle(
      fontSize: 14,
      color: navyColor,
    );
  }

  // ============================================================
  // INPUT DECORATION
  // ============================================================

  InputDecoration inputDecoration({
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: hintColor,
        fontSize: 14,
      ),
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 15,
      ),
      filled: true,
      fillColor: Colors.white,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: borderColor,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: blueColor,
          width: 1.5,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
    );
  }

  // ============================================================
  // FIELD
  // ============================================================

  Widget buildField({
    required String label,
    required TextEditingController controller,
    String? hintText,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
    Widget? suffixIcon,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle,
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          readOnly: readOnly,
          onTap: onTap,
          style: inputTextStyle,
          decoration: inputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // STATIC RESUME
  // ============================================================

  Widget buildResumeUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Resume",
          style: labelStyle,
        ),

        const SizedBox(height: 8),

        Container(
          width: double.infinity,
          height: 125,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: borderColor,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.picture_as_pdf_outlined,
                size: 30,
                color: blueColor,
              ),

              const SizedBox(height: 8),

              Text(
                staticResumeName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: navyColor,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Resume attached",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: hintColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // BACK BUTTON
  // ============================================================

  Widget buildBackButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(5),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back,
              size: 18,
              color: blueColor,
            ),

            SizedBox(width: 5),

            Text(
              "Back to Job Details",
              style: TextStyle(
                color: blueColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BUTTONS
  // ============================================================

  Widget buildButtons() {
    return Row(
      children: [
        SizedBox(
          height: 42,
          child: ElevatedButton(
            onPressed: submitApplication,
            style: ElevatedButton.styleFrom(
              backgroundColor: blueColor,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              "Submit Application",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(width: 25),

        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
          style: TextButton.styleFrom(
            foregroundColor: hintColor,
          ),
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontSize: 13,
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

      body: SafeArea(
        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              32,
              18,
              32,
              35,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ==================================================
                // BACK
                // ==================================================

                buildBackButton(),

                const SizedBox(height: 18),

                // ==================================================
                // TITLE
                // ==================================================

                Text(
                  "Apply for $jobTitle",
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "$companyName • $location",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF596273),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 20),

                // ==================================================
                // FORM CONTAINER
                // ==================================================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    20,
                    20,
                    25,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: borderColor,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ============================================
                      // ROW 1
                      // ============================================

                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth >= 650) {
                            return Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: buildField(
                                    label: "Full Name",
                                    controller:
                                    fullNameController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "Please enter your name";
                                      }

                                      return null;
                                    },
                                  ),
                                ),

                                const SizedBox(width: 25),

                                Expanded(
                                  child: buildField(
                                    label: "Email Address",
                                    controller:
                                    emailController,
                                    keyboardType:
                                    TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "Please enter email";
                                      }

                                      if (!RegExp(
                                        r'^[^@]+@[^@]+\.[^@]+',
                                      ).hasMatch(value)) {
                                        return "Enter a valid email";
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            );
                          }

                          return Column(
                            children: [
                              buildField(
                                label: "Full Name",
                                controller:
                                fullNameController,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty) {
                                    return "Please enter your name";
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(height: 18),

                              buildField(
                                label: "Email Address",
                                controller:
                                emailController,
                                keyboardType:
                                TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty) {
                                    return "Please enter email";
                                  }

                                  if (!RegExp(
                                    r'^[^@]+@[^@]+\.[^@]+',
                                  ).hasMatch(value)) {
                                    return "Enter a valid email";
                                  }

                                  return null;
                                },
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 18),

                      // ============================================
                      // ROW 2
                      // ============================================

                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth >= 650) {
                            return Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: buildField(
                                    label: "Phone Number",
                                    controller:
                                    phoneController,
                                    keyboardType:
                                    TextInputType.phone,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "Please enter phone number";
                                      }

                                      return null;
                                    },
                                  ),
                                ),

                                const SizedBox(width: 25),

                                Expanded(
                                  child: buildField(
                                    label:
                                    "Expected Salary (LPA)",
                                    controller:
                                    salaryController,
                                    hintText: "e.g. 15 LPA",
                                    keyboardType:
                                    TextInputType.number,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "Please enter expected salary";
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            );
                          }

                          return Column(
                            children: [
                              buildField(
                                label: "Phone Number",
                                controller:
                                phoneController,
                                keyboardType:
                                TextInputType.phone,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty) {
                                    return "Please enter phone number";
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(height: 18),

                              buildField(
                                label:
                                "Expected Salary (LPA)",
                                controller:
                                salaryController,
                                hintText: "e.g. 15 LPA",
                                keyboardType:
                                TextInputType.number,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty) {
                                    return "Please enter expected salary";
                                  }

                                  return null;
                                },
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 18),

                      // ============================================
                      // AVAILABLE START DATE
                      // ============================================

                      buildField(
                        label: "Available Start Date",
                        controller: dateController,
                        hintText: "DD/MM/YYYY",
                        readOnly: true,
                        onTap: selectDate,
                        suffixIcon: const Icon(
                          Icons.calendar_today_outlined,
                          size: 19,
                          color: hintColor,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return "Please select start date";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // ============================================
                      // COVER LETTER
                      // ============================================

                      buildField(
                        label: "Cover Letter",
                        controller:
                        coverLetterController,
                        hintText:
                        "Write your cover letter here to introduce yourself to the hiring team...",
                        maxLines: 6,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return "Please write a cover letter";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // ============================================
                      // STATIC RESUME
                      // ============================================

                      buildResumeUpload(),

                      const SizedBox(height: 25),

                      // ============================================
                      // BUTTONS
                      // ============================================

                      buildButtons(),
                    ],
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