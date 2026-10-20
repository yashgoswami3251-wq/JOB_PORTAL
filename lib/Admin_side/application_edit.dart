
import 'package:flutter/material.dart';
import '../references/reference.dart';

class EditApplicationPage extends StatefulWidget {
  const EditApplicationPage({super.key});

  @override
  State<EditApplicationPage> createState() =>
      _EditApplicationPageState();
}

class _EditApplicationPageState extends State<EditApplicationPage> {
  final _formKey = GlobalKey<FormState>();

  String applicantName = "Amit Patel";
  String initials = "AP";
  String role = "Senior React Developer";
  String status = "Pending";
  String appliedDate = "Jan 24, 2024";
  String notes = "Strong experience in React and state management.";

  late final TextEditingController nameController;
  late final TextEditingController roleController;
  late final TextEditingController dateController;
  late final TextEditingController notesController;

  final List<String> statusOptions = [
    'Pending',
    'Reviewed',
    'Shortlisted',
    'Rejected',
  ];

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: applicantName);
    roleController = TextEditingController(text: role);
    dateController = TextEditingController(text: appliedDate);
    notesController = TextEditingController(text: notes);
  }

  @override
  void dispose() {
    nameController.dispose();
    roleController.dispose();
    dateController.dispose();
    notesController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter applicant name';
    }

    if (value.trim().length < 2) {
      return 'Name must contain at least 2 characters';
    }

    return null;
  }

  String? _validateRole(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter job title';
    }

    return null;
  }

  String? _validateDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter applied date';
    }

    final datePattern = RegExp(
      r'^[A-Za-z]{3,9}\s+\d{1,2},\s+\d{4}$',
    );

    if (!datePattern.hasMatch(value.trim())) {
      return 'Enter date like Jan 24, 2024';
    }

    final parts = value.trim().replaceAll(',', '').split(
      RegExp(r'\s+'),
    );

    const months = {
      'jan': 1,
      'feb': 2,
      'mar': 3,
      'apr': 4,
      'may': 5,
      'jun': 6,
      'jul': 7,
      'aug': 8,
      'sep': 9,
      'oct': 10,
      'nov': 11,
      'dec': 12,
    };

    final month = months[parts[0].substring(
      0,
      3,
    ).toLowerCase()];

    final day = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    if (month == null || day == null || year == null) {
      return 'Please enter a valid date';
    }

    final parsedDate = DateTime(year, month, day);

    if (parsedDate.year != year ||
        parsedDate.month != month ||
        parsedDate.day != day) {
      return 'Please enter a valid date';
    }

    return null;
  }

  String? _validateNotes(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter internal notes';
    }

    return null;
  }

  void _saveApplication() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final name = nameController.text.trim();
    final names = name.split(RegExp(r'\s+'));

    setState(() {
      applicantName = name;
      role = roleController.text.trim();
      appliedDate = dateController.text.trim();
      notes = notesController.text.trim();

      initials = names.length >= 2
          ? '${names.first[0]}${names[1][0]}'.toUpperCase()
          : names.first[0].toUpperCase();
    });

    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text('Application updated successfully!'),
        backgroundColor: avatarColor,
      ),
    );
  }

  Future<void> _deleteApplication() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete Application'),
          content: const Text(
            'Are you sure you want to delete this application?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: redColor,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (!mounted || confirmed != true) return;

    Navigator.pop(context, true);
  }

  Widget _buildLabel(String text) {
    return Text(
      text.toUpperCase(),
      style:  TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: greyColor,
        letterSpacing: 0.5,
      ),
    );
  }

  InputDecoration _inputDecoration(
      String hint,
      IconData icon,
      ) {
    return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: avatarColor,
        size: 20,
      ),
      hintText: hint,
      hintStyle:  TextStyle(
        fontSize: 14,
        color: greyColor,
      ),
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:  BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:  BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:  BorderSide(
          color: blueColor,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back,
            color: textColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          'Edit Application',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: avatarColor,
              child: Text(
                initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Applicant preview card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: avatarColor,
                      child: Text(
                        initials,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            applicantName,
                            style:  TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            role,
                            style:  TextStyle(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Application form card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Applicant Name'),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: nameController,
                      validator: _validateName,
                      textCapitalization: TextCapitalization.words,
                      decoration: _inputDecoration(
                        'Enter full name',
                        Icons.person_outline,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildLabel('Job Title / Role'),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: roleController,
                      validator: _validateRole,
                      decoration: _inputDecoration(
                        'Enter position',
                        Icons.work_outline,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildLabel('Applied Date'),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: dateController,
                      validator: _validateDate,
                      decoration: _inputDecoration(
                        'e.g. Jan 24, 2024',
                        Icons.calendar_today_outlined,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildLabel('Application Status'),
                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: statusOptions.map((item) {
                        final isSelected = status == item;

                        return ChoiceChip(
                          label: Text(item),
                          selected: isSelected,
                          selectedColor: blueColor,
                          backgroundColor: chipColor,
                          labelStyle: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                status = item;
                              });
                            }
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 16),

                    _buildLabel('Internal Notes'),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: notesController,
                      validator: _validateNotes,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Add notes about candidate...',
                        hintStyle:  TextStyle(
                          fontSize: 14,
                          color: greyColor,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:  BorderSide(
                            color: borderColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:  BorderSide(
                            color: borderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: blueColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bottomColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _saveApplication,
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEE2E2),
                        foregroundColor: redColor,
                        side: const BorderSide(
                          color: Color(0xFFFCA5A5),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _deleteApplication,
                      child: const Icon(Icons.delete_outline),
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
