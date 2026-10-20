
import 'package:flutter/material.dart';
import 'package:job_portal/User_side/home_page.dart';

import '../references/reference.dart';

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
  static const Color hintColor = Color(0xFF7A8494);
  static const Color greenColor = Color(0xFF16845B);

  final _formKey = GlobalKey<FormState>();

  final fullNameController =
  TextEditingController(text: "Rahul Sharma");
  final emailController =
  TextEditingController(text: "rahulsharma@gmail.com");
  final phoneController =
  TextEditingController(text: "+91 98765 43210");
  final salaryController = TextEditingController();
  final dateController = TextEditingController();
  final coverLetterController = TextEditingController();

  final String staticResumeName = "Rahul_Sharma_Resume.pdf";

  String get jobTitle =>
      widget.job?['title'] ?? "Senior React Developer";

  String get companyName => widget.job?['company'] ?? "TCS";

  String get location =>
      widget.job?['location'] ?? "Mumbai, Maharashtra";

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

  Future<void> selectDate() async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
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

  void submitApplication() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final application = <String, dynamic>{
      'title': jobTitle,
      'company': companyName,
      'location': location,
      'status': 'Applied',
      'fullName': fullNameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'salary': salaryController.text.trim(),
      'startDate': dateController.text,
      'coverLetter': coverLetterController.text.trim(),
      'resume': staticResumeName,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Application submitted successfully!"),
        behavior: SnackBarBehavior.floating,
      ),
    );

    Navigator.pop(context, application);
  }

  TextStyle get labelStyle => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: navyColor,
  );

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
      filled: true,
      fillColor: const Color(0xFFFAFBFD),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: blueColor,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
    );
  }

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
        Text(label, style: labelStyle),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          readOnly: readOnly,
          onTap: onTap,
          style: TextStyle(
            fontSize: 14,
            color: navyColor,
          ),
          decoration: inputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }

  Widget buildSectionTitle({
    required String number,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: blueColor.withOpacity(0.09),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: blueColor,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: navyColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: hintColor,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildResponsiveRow({
    required Widget first,
    required Widget second,
    required bool isWide,
  }) {
    if (!isWide) {
      return Column(
        children: [
          first,
          const SizedBox(height: 20),
          second,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: first),
        const SizedBox(width: 22),
        Expanded(child: second),
      ],
    );
  }

  Widget buildResumeCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFDCE6FA),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEEEE),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.picture_as_pdf_rounded,
              color: Color(0xFFE34D4D),
              size: 27,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  staticResumeName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: navyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Resume attached",
                  style: TextStyle(
                    color: hintColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.check_circle,
            color: greenColor,
            size: 22,
          ),
        ],
      ),
    );
  }

  Widget buildButtons({required bool isWide}) {
    return Flex(
      direction: isWide ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment:
      isWide ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 49,
          width: isWide ? null : double.infinity,
          child: ElevatedButton.icon(
            onPressed: submitApplication,
            icon: const Icon(
              Icons.send_rounded,
              size: 18,
            ),
            label: const Text(
              "Submit Application",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: blueColor,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(
          width: isWide ? 12 : 0,
          height: isWide ? 0 : 10,
        ),
        SizedBox(
          height: 49,
          width: isWide ? null : double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: navyColor,
              side: BorderSide(color: borderColor),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, viewport) {
            final isWide = viewport.maxWidth >= 700;
            final pagePadding = isWide ? 32.0 : 18.0;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: pagePadding,
                vertical: 22,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 900,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 3,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.arrow_back_rounded,
                                size: 19,
                                color: blueColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Back to Job Details",
                                style: TextStyle(
                                  color: blueColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(isWide ? 28 : 20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF0F5FF),
                              Color(0xFFFFFCF7),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: const Color(0xFFE0E8F7),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 11,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFFDCE6FA),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.work_outline_rounded,
                                    color: blueColor,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    "JOB APPLICATION",
                                    style: TextStyle(
                                      color: blueColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 17),
                            Text(
                              "Apply for $jobTitle",
                              style: TextStyle(
                                fontSize: isWide ? 27 : 23,
                                height: 1.25,
                                fontWeight: FontWeight.w800,
                                color: navyColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "$companyName • $location",
                              style: const TextStyle(
                                fontSize: 14,
                                color: hintColor,
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Complete your details below to apply for this position.",
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.6,
                                color: Color(0xFF596273),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(isWide ? 30 : 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: borderColor),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.025),
                              blurRadius: 18,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildSectionTitle(
                                number: "01",
                                title: "Personal Information",
                                subtitle:
                                "Share your contact details with the hiring team.",
                              ),
                              const SizedBox(height: 24),
                              buildResponsiveRow(
                                isWide: isWide,
                                first: buildField(
                                  label: "Full Name",
                                  controller: fullNameController,
                                  hintText: "Enter your full name",
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty) {
                                      return "Please enter your name";
                                    }
                                    return null;
                                  },
                                ),
                                second: buildField(
                                  label: "Email Address",
                                  controller: emailController,
                                  hintText: "you@example.com",
                                  keyboardType:
                                  TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty) {
                                      return "Please enter email";
                                    }

                                    if (!RegExp(
                                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                    ).hasMatch(value.trim())) {
                                      return "Enter a valid email";
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              buildResponsiveRow(
                                isWide: isWide,
                                first: buildField(
                                  label: "Phone Number",
                                  controller: phoneController,
                                  hintText: "Enter phone number",
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty) {
                                      return "Please enter phone number";
                                    }

                                    final digits = value.replaceAll(
                                      RegExp(r'\D'),
                                      '',
                                    );

                                    if (digits.length < 10 ||
                                        digits.length > 15) {
                                      return "Enter a valid phone number";
                                    }

                                    return null;
                                  },
                                ),
                                second: buildField(
                                  label: "Expected Salary (LPA)",
                                  controller: salaryController,
                                  hintText: "e.g. 8 or 8.5",
                                  keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty) {
                                      return "Please enter expected salary";
                                    }

                                    final salary =
                                    double.tryParse(value.trim());

                                    if (salary == null || salary <= 0) {
                                      return "Enter a valid salary";
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              Divider(color: borderColor),
                              const SizedBox(height: 24),
                              buildSectionTitle(
                                number: "02",
                                title: "Availability & Documents",
                                subtitle:
                                "Tell the employer when you can start and review your resume.",
                              ),
                              const SizedBox(height: 24),
                              buildField(
                                label: "Available Start Date",
                                controller: dateController,
                                hintText: "Select your start date",
                                readOnly: true,
                                onTap: selectDate,
                                suffixIcon: Icon(
                                  Icons.calendar_month_rounded,
                                  color: blueColor,
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty) {
                                    return "Please select start date";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 22),
                              Text(
                                "Resume",
                                style: labelStyle,
                              ),
                              const SizedBox(height: 9),
                              buildResumeCard(),
                              const SizedBox(height: 30),
                              Divider(color: borderColor),
                              const SizedBox(height: 24),
                              buildSectionTitle(
                                number: "03",
                                title: "Cover Letter",
                                subtitle:
                                "Introduce yourself and explain why you're a good fit.",
                              ),
                              const SizedBox(height: 24),
                              buildField(
                                label: "Your Message",
                                controller: coverLetterController,
                                hintText:
                                "Write a short introduction about your skills, experience, and interest in this role...",
                                maxLines: 5,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty) {
                                    return "Please write a cover letter";
                                  }

                                  if (value.trim().length < 20) {
                                    return "Please write at least 20 characters";
                                  }

                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              buildButtons(isWide: isWide),
                              const SizedBox(height: 15),
                              const Center(
                                child: Text(
                                  "Please review your information before submitting.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: hintColor,
                                    fontSize: 12,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: Text(
                          "HireHub • Connect Talent With Opportunity",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
