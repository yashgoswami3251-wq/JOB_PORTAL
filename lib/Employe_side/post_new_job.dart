
import 'package:flutter/material.dart';
import 'package:job_portal/Employe_side/profile.dart';
import '../references/reference.dart';
import 'homepage.dart';

class PostNewJobPage extends StatefulWidget {
  const PostNewJobPage({super.key});

  @override
  State<PostNewJobPage> createState() => _PostNewJobPageState();
}

class _PostNewJobPageState extends State<PostNewJobPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController jobTitleController =
  TextEditingController();
  final TextEditingController companyController =
  TextEditingController();
  final TextEditingController locationController =
  TextEditingController();
  final TextEditingController salaryMinController =
  TextEditingController();
  final TextEditingController salaryMaxController =
  TextEditingController();
  final TextEditingController descriptionController =
  TextEditingController();
  final TextEditingController requirementsController =
  TextEditingController();
  final TextEditingController qualificationsController =
  TextEditingController();
  final TextEditingController deadlineController =
  TextEditingController();

  String selectedCategory = "IT & Software";
  String selectedJobType = "Full-time";

  final List<String> categories = [
    "IT & Software",
    "Design",
    "Marketing",
    "Finance",
    "Human Resources",
    "Sales",
    "Engineering",
    "Healthcare",
    "Education",
    "Other",
  ];

  final List<String> jobTypes = [
    "Full-time",
    "Part-time",
    "Contract",
    "Internship",
    "Remote",
  ];

  @override
  void dispose() {
    jobTitleController.dispose();
    companyController.dispose();
    locationController.dispose();
    salaryMinController.dispose();
    salaryMaxController.dispose();
    descriptionController.dispose();
    requirementsController.dispose();
    qualificationsController.dispose();
    deadlineController.dispose();
    super.dispose();
  }

  TextStyle get labelStyle => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  TextStyle get inputTextStyle => TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  InputDecoration inputDecoration({
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 12.5,
        color: greyColor,
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: blueColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    String? hintText,
    int maxLines = 1,
    TextInputType? keyboardType,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: inputTextStyle,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: inputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }

  Widget buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          style: inputTextStyle,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18,
            color: greyColor,
          ),
          decoration: inputDecoration(),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: inputTextStyle),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  String? requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? salaryMinValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter minimum salary';
    }

    final salary = double.tryParse(value.trim());

    if (salary == null || !salary.isFinite) {
      return 'Enter a valid number';
    }

    if (salary <= 0) {
      return 'Salary must be greater than 0';
    }

    return null;
  }

  String? salaryMaxValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter maximum salary';
    }

    final maxSalary = double.tryParse(value.trim());

    if (maxSalary == null || !maxSalary.isFinite) {
      return 'Enter a valid number';
    }

    if (maxSalary <= 0) {
      return 'Salary must be greater than 0';
    }

    final minSalary =
    double.tryParse(salaryMinController.text.trim());

    if (minSalary != null && maxSalary < minSalary) {
      return 'Must be >= minimum salary';
    }

    return null;
  }

  Future<void> selectDeadline() async {
    final now = DateTime.now();

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        deadlineController.text =
        "${selectedDate.day.toString().padLeft(2, '0')}/"
            "${selectedDate.month.toString().padLeft(2, '0')}/"
            "${selectedDate.year}";
      });

      _formKey.currentState?.validate();
    }
  }

  void postJob() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Job posted successfully!"),),
    );
  }

  Widget buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeHomePage(),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Post New Job",
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontweight,
                    color: navyColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Create a new job posting",
                  style: TextStyle(
                    fontSize: 11,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.notifications_none_rounded,
            size: 21,
            color: greyColor,
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompanyProfilePage(),
                ),
              );
            },
            child: Container(
              width: profileSize,
              height: profileSize,
              decoration: BoxDecoration(
                color: avatarColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Text(
                'TCS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextField(
                        label: "Job Title",
                        controller: jobTitleController,
                        hintText: "Enter job title",
                        validator: requiredValidator,
                      ),
                      const SizedBox(height: 12),

                      buildTextField(
                        label: "Company",
                        controller: companyController,
                        hintText: "Enter company name",
                        validator: requiredValidator,
                      ),
                      const SizedBox(height: 12),

                      buildDropdown(
                        label: "Category",
                        value: selectedCategory,
                        items: categories,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedCategory = value;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 12),

                      buildTextField(
                        label: "Location",
                        controller: locationController,
                        hintText: "Mumbai, Maharashtra",
                        validator: requiredValidator,
                      ),
                      const SizedBox(height: 12),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: buildTextField(
                              label: "Salary Min (₹ LPA)",
                              controller: salaryMinController,
                              hintText: "10 LPA",
                              keyboardType:
                              const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              validator: salaryMinValidator,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: buildTextField(
                              label: "Salary Max (₹ LPA)",
                              controller: salaryMaxController,
                              hintText: "18 LPA",
                              keyboardType:
                              const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              validator: salaryMaxValidator,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      buildDropdown(
                        label: "Job Type",
                        value: selectedJobType,
                        items: jobTypes,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedJobType = value;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 12),

                      buildTextField(
                        label: "Description",
                        controller: descriptionController,
                        hintText: "Describe the job position...",
                        maxLines: 4,
                        validator: requiredValidator,
                      ),
                      const SizedBox(height: 12),

                      buildTextField(
                        label: "Requirements",
                        controller: requirementsController,
                        hintText:
                        "Enter required skills and experience...",
                        maxLines: 3,
                        validator: requiredValidator,
                      ),
                      const SizedBox(height: 12),

                      buildTextField(
                        label: "Qualifications",
                        controller: qualificationsController,
                        hintText:
                        "B.Tech/B.E in Computer Science, or equivalent",
                        maxLines: 2,
                        validator: requiredValidator,
                      ),
                      const SizedBox(height: 12),

                      buildTextField(
                        label: "Deadline",
                        controller: deadlineController,
                        hintText: "Select deadline",
                        readOnly: true,
                        onTap: selectDeadline,
                        suffixIcon: Icon(
                          Icons.calendar_today_outlined,
                          size: 17,
                          color: greyColor,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please select a deadline';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 22),

                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: postJob,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            "Post Job",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
      ),
    );
  }
}
