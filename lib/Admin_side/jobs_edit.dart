import 'package:flutter/material.dart';
import '../references/reference.dart';

class EditJobPage extends StatefulWidget {
  final String jobTitle;
  final String company;
  final String location;
  final String salaryMin;
  final String salaryMax;
  final String salaryPeriod;
  final String description;
  final String requirements;
  final String qualifications;
  final String deadline;
  final String status;

  const EditJobPage({
    super.key,
    this.jobTitle = 'Senior Software Engineer',
    this.company = 'TechSolutions Pvt. Ltd.',
    this.location = 'Bangalore, India (Hybrid)',
    this.salaryMin = '780000',
    this.salaryMax = '1500000',
    this.salaryPeriod = 'year',
    this.description =
    'We are looking for an experienced engineer to build secure, '
        'scalable backend architectures and robust APIs. You will work '
        'on microservices, serverless components, and cloud-native '
        'engineering standards.',
    this.requirements =
    '3+ years building production Node.js or C# backend services.\n'
        'In-depth knowledge of database schemas (SQL / NoSQL).\n'
        'Familiarity with cloud infrastructure (AWS or Azure preferred).',
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
  late final TextEditingController salaryMinController;
  late final TextEditingController salaryMaxController;
  late final TextEditingController descriptionController;
  late final TextEditingController requirementsController;
  late final TextEditingController qualificationsController;
  late final TextEditingController deadlineController;

  late String selectedStatus;

  final List<String> statuses = ['Active', 'Closed', 'Draft'];

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.jobTitle);
    companyController = TextEditingController(text: widget.company);
    locationController = TextEditingController(text: widget.location);
    salaryMinController = TextEditingController(text: widget.salaryMin);
    salaryMaxController = TextEditingController(text: widget.salaryMax);
    descriptionController =
        TextEditingController(text: widget.description);
    requirementsController =
        TextEditingController(text: widget.requirements);
    qualificationsController =
        TextEditingController(text: widget.qualifications);
    deadlineController = TextEditingController(text: widget.deadline);

    selectedStatus =
    statuses.contains(widget.status) ? widget.status : 'Active';
  }

  @override
  void dispose() {
    titleController.dispose();
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
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  TextStyle get inputStyle => TextStyle(
    fontSize: 12,
    color: textColor,
  );

  InputDecoration inputDecoration({
    String? hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 11,
        color: greyColor,
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 11,
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
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
          readOnly: readOnly,
          onTap: onTap,
          style: inputStyle,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: inputDecoration(
            hint: hint,
            suffixIcon: suffixIcon,
          ),
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
      return 'Enter a valid amount';
    }

    if (salary <= 0) {
      return 'Salary must be greater than zero';
    }

    return null;
  }

  String? validateMaxSalary(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter maximum salary';
    }

    final maxSalary = double.tryParse(value.trim());
    final minSalary =
    double.tryParse(salaryMinController.text.trim());

    if (maxSalary == null || !maxSalary.isFinite) {
      return 'Enter a valid amount';
    }

    if (maxSalary <= 0) {
      return 'Salary must be greater than zero';
    }

    if (minSalary != null && maxSalary < minSalary) {
      return 'Must be >= minimum salary';
    }

    return null;
  }

  Future<void> selectDeadline() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    DateTime initialDate = today;
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
            !parsed.isBefore(today)) {
          initialDate = parsed;
        }
      }
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: today,
      lastDate: DateTime(2100),
    );

    if (picked != null && mounted) {
      setState(() {
        deadlineController.text =
        '${picked.day.toString().padLeft(2, '0')}/'
            '${picked.month.toString().padLeft(2, '0')}/'
            '${picked.year}';
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
      'salaryMin': salaryMinController.text.trim(),
      'salaryMax': salaryMaxController.text.trim(),
      'salaryPeriod': widget.salaryPeriod,
      'description': descriptionController.text.trim(),
      'requirements': requirementsController.text.trim(),
      'qualifications': qualificationsController.text.trim(),
      'deadline': deadlineController.text.trim(),
      'status': selectedStatus,
    };

    debugPrint('Updated job: $updatedJob');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Job details updated successfully!'),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      color: backgroundColor,
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 17,
              color: navyColor,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              'Edit Job Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: fontweight,
                color: navyColor,
              ),
            ),
          ),
          Icon(
            Icons.notifications_none_rounded,
            size: 19,
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
              'SA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: navyColor,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
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
                  padding: const EdgeInsets.fromLTRB(10, 4, 10, 24),
                  child: Column(
                    children: [
                      buildSection(
                        title: 'Job Information',
                        children: [
                          buildField(
                            label: 'Job Title',
                            controller: titleController,
                            hint: 'Enter job title',
                            validator: validateRequired,
                          ),
                          const SizedBox(height: 12),
                          buildField(
                            label: 'Company Name',
                            controller: companyController,
                            hint: 'Enter company name',
                            validator: validateRequired,
                          ),
                          const SizedBox(height: 12),
                          buildField(
                            label: 'Location',
                            controller: locationController,
                            hint: 'City, State (Remote / Hybrid)',
                            validator: validateRequired,
                          ),
                          const SizedBox(height: 12),
                          Text('Job Status', style: labelStyle),
                          const SizedBox(height: 5),
                          DropdownButtonFormField<String>(
                            value: selectedStatus,
                            isExpanded: true,
                            style: inputStyle,
                            decoration: inputDecoration(),
                            items: statuses.map((status) {
                              return DropdownMenuItem<String>(
                                value: status,
                                child: Text(status),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  selectedStatus = value;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      buildSection(
                        title: 'Salary Package',
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: buildField(
                                  label: 'Minimum Salary (₹ / year)',
                                  controller: salaryMinController,
                                  hint: '780000',
                                  keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  validator: validateMinSalary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: buildField(
                                  label: 'Maximum Salary (₹ / year)',
                                  controller: salaryMaxController,
                                  hint: '1500000',
                                  keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  validator: validateMaxSalary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      buildSection(
                        title: 'Job Description',
                        children: [
                          buildField(
                            label: 'Description',
                            controller: descriptionController,
                            hint: 'Describe the job role...',
                            maxLines: 5,
                            validator: validateRequired,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      buildSection(
                        title: 'Requirements & Qualifications',
                        children: [
                          buildField(
                            label: 'Requirements',
                            controller: requirementsController,
                            hint: 'Enter each requirement on a new line',
                            maxLines: 4,
                            validator: validateRequired,
                          ),
                          const SizedBox(height: 12),
                          buildField(
                            label: 'Qualifications',
                            controller: qualificationsController,
                            hint: 'Enter educational qualifications',
                            maxLines: 2,
                            validator: validateRequired,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      buildSection(
                        title: 'Application Deadline',
                        children: [
                          buildField(
                            label: 'Deadline',
                            controller: deadlineController,
                            hint: 'Select application deadline',
                            readOnly: true,
                            onTap: selectDeadline,
                            suffixIcon: Icon(
                              Icons.calendar_today_outlined,
                              size: 17,
                              color: greyColor,
                            ),
                            validator: validateRequired,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: ElevatedButton(
                                onPressed: updateJob,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: navyColor,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: const Text(
                                  'Update Job Details',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  side: const BorderSide(color: Colors.red),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(fontSize: 12),
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
            ],
          ),
        ),
      ),
    );
  }
}