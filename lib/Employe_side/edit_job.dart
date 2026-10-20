import 'package:flutter/material.dart';
import '../references/reference.dart';
import 'profile.dart';

class EditJobPage extends StatefulWidget {
  final String jobTitle;
  final String company;
  final String location;
  final String salaryMin;
  final String salaryMax;
  final String category;
  final String jobType;
  final String description;
  final String requirements;
  final String qualifications;
  final String deadline;
  final String status;

  const EditJobPage({
    super.key,
    this.jobTitle = 'Senior React Developer',
    this.company = 'TCS',
    this.location = 'Mumbai',
    this.salaryMin = '12',
    this.salaryMax = '18',
    this.category = 'IT & Software',
    this.jobType = 'Full-time',
    this.description =
    'Develop and maintain modern web applications using React.',
    this.requirements = 'React, JavaScript, HTML, CSS, REST APIs',
    this.qualifications =
    'B.Tech / B.E in Computer Science or equivalent',
    this.deadline = '',
    this.status = 'Active',
  });

  @override
  State<EditJobPage> createState() => _EditJobPageState();
}

class _EditJobPageState extends State<EditJobPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController titleController;
  late final TextEditingController companyController;
  late final TextEditingController locationController;
  late final TextEditingController minSalaryController;
  late final TextEditingController maxSalaryController;
  late final TextEditingController descriptionController;
  late final TextEditingController requirementsController;
  late final TextEditingController qualificationsController;
  late final TextEditingController deadlineController;

  late String selectedCategory;
  late String selectedJobType;
  late String selectedStatus;

  final List<String> categories = [
    'IT & Software',
    'Design',
    'Marketing',
    'Finance',
    'Human Resources',
    'Sales',
    'Engineering',
    'Healthcare',
    'Education',
    'Other',
  ];

  final List<String> jobTypes = [
    'Full-time',
    'Part-time',
    'Contract',
    'Internship',
    'Remote',
  ];

  final List<String> statuses = [
    'Active',
    'Closed',
    'Draft',
  ];

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.jobTitle);
    companyController = TextEditingController(text: widget.company);
    locationController = TextEditingController(text: widget.location);
    minSalaryController = TextEditingController(text: widget.salaryMin);
    maxSalaryController = TextEditingController(text: widget.salaryMax);
    descriptionController =
        TextEditingController(text: widget.description);
    requirementsController =
        TextEditingController(text: widget.requirements);
    qualificationsController =
        TextEditingController(text: widget.qualifications);
    deadlineController = TextEditingController(text: widget.deadline);

    selectedCategory = categories.contains(widget.category)
        ? widget.category
        : 'Other';

    selectedJobType = jobTypes.contains(widget.jobType)
        ? widget.jobType
        : 'Full-time';

    selectedStatus = statuses.contains(widget.status)
        ? widget.status
        : 'Active';
  }

  @override
  void dispose() {
    titleController.dispose();
    companyController.dispose();
    locationController.dispose();
    minSalaryController.dispose();
    maxSalaryController.dispose();
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

  TextStyle get inputStyle => TextStyle(
    fontSize: 12.5,
    color: textColor,
  );

  InputDecoration decoration({
    String? hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 12,
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

  Widget buildField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    String? hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          style: inputStyle,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: decoration(
            hint: hint,
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
          style: inputStyle,
          decoration: decoration(),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: greyColor,
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: inputStyle,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  String? validateMinSalary(String? value) {
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

  String? validateMaxSalary(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter maximum salary';
    }

    final maxSalary = double.tryParse(value.trim());
    final minSalary =
    double.tryParse(minSalaryController.text.trim());

    if (maxSalary == null || !maxSalary.isFinite) {
      return 'Enter a valid number';
    }

    if (maxSalary <= 0) {
      return 'Salary must be greater than 0';
    }

    if (minSalary != null && maxSalary < minSalary) {
      return 'Must be >= minimum salary';
    }

    return null;
  }

  Future<void> selectDeadline() async {
    final now = DateTime.now();

    DateTime initialDate = now;

    final parts = deadlineController.text.split('/');

    if (parts.length == 3) {
      final day = int.tryParse(parts[0]);
      final month = int.tryParse(parts[1]);
      final year = int.tryParse(parts[2]);

      if (day != null && month != null && year != null) {
        final parsed = DateTime(year, month, day);

        if (parsed.year == year &&
            parsed.month == month &&
            parsed.day == day &&
            !parsed.isBefore(
              DateTime(now.year, now.month, now.day),
            )) {
          initialDate = parsed;
        }
      }
    }

    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(2100),
    );

    if (date != null && mounted) {
      setState(() {
        deadlineController.text =
        '${date.day.toString().padLeft(2, '0')}/'
            '${date.month.toString().padLeft(2, '0')}/'
            '${date.year}';
      });

      _formKey.currentState?.validate();
    }
  }

  void updateJob() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final updatedJob = {
      'title': titleController.text.trim(),
      'company': companyController.text.trim(),
      'location': locationController.text.trim(),
      'salaryMin': minSalaryController.text.trim(),
      'salaryMax': maxSalaryController.text.trim(),
      'category': selectedCategory,
      'jobType': selectedJobType,
      'description': descriptionController.text.trim(),
      'requirements': requirementsController.text.trim(),
      'qualifications': qualificationsController.text.trim(),
      'deadline': deadlineController.text.trim(),
      'status': selectedStatus,
    };

    // Save updatedJob to your database or API here.
    // This example currently validates the form and shows a message.

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Job details updated successfully!'),
      ),
    );

    debugPrint('Updated Job: $updatedJob');
  }

  Widget buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      color: backgroundColor,
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
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
                  'Edit Job',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontweight,
                    color: navyColor,
                  ),
                ),
                Text(
                  'Update and manage your job posting',
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
          Container(
            width: profileSize,
            height: profileSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
            ),
            child: const Text(
              'TCS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
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
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    4,
                    16,
                    30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildField(
                        label: 'Job Title',
                        controller: titleController,
                        hint: 'Enter job title',
                        validator: validateRequired,
                      ),
                      const SizedBox(height: 12),

                      buildField(
                        label: 'Company',
                        controller: companyController,
                        hint: 'Enter company name',
                        validator: validateRequired,
                      ),
                      const SizedBox(height: 12),

                      buildDropdown(
                        label: 'Category',
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

                      buildField(
                        label: 'Location',
                        controller: locationController,
                        hint: 'Mumbai, Maharashtra',
                        validator: validateRequired,
                      ),
                      const SizedBox(height: 12),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: buildField(
                              label: 'Salary Min (₹ LPA)',
                              controller: minSalaryController,
                              hint: '12',
                              keyboardType:
                              const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              validator: validateMinSalary,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: buildField(
                              label: 'Salary Max (₹ LPA)',
                              controller: maxSalaryController,
                              hint: '18',
                              keyboardType:
                              const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              validator: validateMaxSalary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      buildDropdown(
                        label: 'Job Type',
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

                      buildField(
                        label: 'Description',
                        controller: descriptionController,
                        hint: 'Describe the job position...',
                        maxLines: 4,
                        validator: validateRequired,
                      ),
                      const SizedBox(height: 12),

                      buildField(
                        label: 'Requirements',
                        controller: requirementsController,
                        hint: 'Enter required skills and experience...',
                        maxLines: 3,
                        validator: validateRequired,
                      ),
                      const SizedBox(height: 12),

                      buildField(
                        label: 'Qualifications',
                        controller: qualificationsController,
                        hint: 'Enter required qualifications',
                        maxLines: 2,
                        validator: validateRequired,
                      ),
                      const SizedBox(height: 12),

                      buildField(
                        label: 'Application Deadline',
                        controller: deadlineController,
                        hint: 'Select deadline',
                        readOnly: true,
                        onTap: selectDeadline,
                        suffixIcon: Icon(
                          Icons.calendar_today_outlined,
                          size: 17,
                          color: greyColor,
                        ),
                        validator: validateRequired,
                      ),
                      const SizedBox(height: 12),

                      buildDropdown(
                        label: 'Job Status',
                        value: selectedStatus,
                        items: statuses,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedStatus = value;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 22),

                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: updateJob,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Update Job',
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