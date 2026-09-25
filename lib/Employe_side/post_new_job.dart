import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Use your existing common variables file
import '../references/reference.dart';
import 'homepage.dart';

class PostNewJobPage extends StatefulWidget {
  const PostNewJobPage({super.key});

  @override
  State<PostNewJobPage> createState() => _PostNewJobPageState();
}

class _PostNewJobPageState extends State<PostNewJobPage> {

  // ------------------------------------------------------------
  // Form Key
  // ------------------------------------------------------------

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ------------------------------------------------------------
  // Controllers
  // ------------------------------------------------------------

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

  // ------------------------------------------------------------
  // Dropdown values
  // ------------------------------------------------------------

  String selectedCategory = "IT & Software";

  String selectedJobType = "Full-time";

  // ------------------------------------------------------------
  // Dropdown lists
  // ------------------------------------------------------------

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

  // ------------------------------------------------------------
  // Dispose
  // ------------------------------------------------------------

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

  // ------------------------------------------------------------
  // Common text style
  // ------------------------------------------------------------

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

  // ------------------------------------------------------------
  // Input Decoration
  // ------------------------------------------------------------

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
        borderSide: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: borderColor,
          width: 1,
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
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),

      errorStyle: const TextStyle(
        fontSize: 10.5,
        color: Colors.red,
      ),
    );
  }

  // ------------------------------------------------------------
  // Text Field
  // ------------------------------------------------------------

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
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        RichText(
          text: TextSpan(
            text: label,
            style: labelStyle,
            children: const [
              TextSpan(
                text: " *",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 6),

        TextFormField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: inputTextStyle,

          // Individual validator comes from each field
          validator: validator,

          inputFormatters: inputFormatters,

          decoration: inputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // Dropdown
  // ------------------------------------------------------------

  Widget buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        RichText(
          text: TextSpan(
            text: label,
            style: labelStyle,
            children: const [
              TextSpan(
                text: " *",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 6),

        DropdownButtonFormField<String>(
          value: value,
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
              child: Text(
                item,
                style: inputTextStyle,
              ),
            );
          }).toList(),

          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$label is required";
            }

            return null;
          },

          onChanged: onChanged,
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // Date Picker
  // ------------------------------------------------------------

  Future<void> selectDeadline() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        deadlineController.text =
        "${selectedDate.day.toString().padLeft(2, '0')}/"
            "${selectedDate.month.toString().padLeft(2, '0')}/"
            "${selectedDate.year}";
      });
    }
  }

  // ------------------------------------------------------------
  // Post Job
  // ------------------------------------------------------------

  void postJob() {

    // Run all TextFormField validators
    if (!_formKey.currentState!.validate()) {
      return;
  }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Job posted successfully!",),
      ),
    );

    // Here you can insert the job into SQLite/Firebase/API.
  }

  // ------------------------------------------------------------
  // Header
  // ------------------------------------------------------------

  Widget buildHeader() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.fromLTRB(
        16,
        10,
        16,
        10,
      ),

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
            child:  Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: blueColor,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Post New Job",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: navyColor,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  "Create a new job posting",
                  style: TextStyle(
                    fontSize: 10,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),

          // Notification icon
          Icon(
            Icons.notifications_none_rounded,
            size: 21,
            color: greyColor,
          ),

          const SizedBox(width: 12),

          // Profile circle
          Container(
            width: 29,
            height: 29,

            decoration: BoxDecoration(
              color: bottomColor,
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
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // Main UI
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: Form(
          key: _formKey,

          child: Column(
            children: [

              // Header
              buildHeader(),

              // Main scroll area
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),

                  padding: const EdgeInsets.fromLTRB(
                    16,
                    4,
                    16,
                    30,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      // ==================================================
                      // Job Title
                      // ==================================================

                      buildTextField(
                        label: "Job Title",
                        controller: jobTitleController,
                        hintText: "Enter job title",

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {

                            return "Job Title is required";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      // ==================================================
                      // Company
                      // ==================================================

                      buildTextField(
                        label: "Company",
                        controller: companyController,
                        hintText: "Enter company name",

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {

                            return "Company is required";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      // ==================================================
                      // Category
                      // ==================================================

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

                      // ==================================================
                      // Location
                      // ==================================================

                      buildTextField(
                        label: "Location",
                        controller: locationController,
                        hintText: "Mumbai, Maharashtra",

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {

                            return "Location is required";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      // ==================================================
                      // Salary
                      // ==================================================

                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          // Salary Min
                          Expanded(
                            child: buildTextField(
                              label: "Salary Min (₹ LPA)",
                              controller: salaryMinController,
                              hintText: "10 LPA",

                              keyboardType:
                              const TextInputType
                                  .numberWithOptions(
                                decimal: true,
                              ),

                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*'),
                                ),
                              ],

                              validator: (value) {

                                if (value == null ||
                                    value.trim().isEmpty) {

                                  return "Salary Min is required";
                                }

                                return null;
                              },
                            ),
                          ),

                          const SizedBox(width: 14),

                          // Salary Max
                          Expanded(
                            child: buildTextField(
                              label: "Salary Max (₹ LPA)",
                              controller: salaryMaxController,
                              hintText: "18 LPA",

                              keyboardType:
                              const TextInputType
                                  .numberWithOptions(
                                decimal: true,
                              ),

                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*'),
                                ),
                              ],

                              validator: (value) {

                                if (value == null ||
                                    value.trim().isEmpty) {

                                  return "Salary Max is required";
                                }

                                return null;
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // ==================================================
                      // Job Type
                      // ==================================================

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

                      // ==================================================
                      // Description
                      // ==================================================

                      buildTextField(
                        label: "Description",
                        controller: descriptionController,
                        hintText:
                        "Describe the job position...",
                        maxLines: 4,

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {

                            return "Description is required";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      // ==================================================
                      // Requirements
                      // ==================================================

                      buildTextField(
                        label: "Requirements",
                        controller: requirementsController,
                        hintText:
                        "Enter required skills and experience...",
                        maxLines: 3,

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {

                            return "Requirements is required";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      // ==================================================
                      // Qualifications
                      // ==================================================

                      buildTextField(
                        label: "Qualifications",
                        controller: qualificationsController,
                        hintText:
                        "B.Tech/B.E in Computer Science, or equivalent",
                        maxLines: 2,

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {

                            return "Qualifications is required";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      // ==================================================
                      // Deadline
                      // ==================================================

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

                          if (value == null ||
                              value.trim().isEmpty) {

                            return "Deadline is required";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 22),

                      // ==================================================
                      // Post Job Button
                      // ==================================================

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
                              borderRadius:
                              BorderRadius.circular(6),
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
