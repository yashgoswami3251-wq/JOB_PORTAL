import 'package:flutter/material.dart';
import '../references/reference.dart';

class EditEmployerPage extends StatefulWidget {
  final Map<String, dynamic> employer;

  const EditEmployerPage({
    super.key,
    required this.employer,
  });

  @override
  State<EditEmployerPage> createState() => _EditEmployerPageState();
}

class _EditEmployerPageState extends State<EditEmployerPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _companyNameController;
  late TextEditingController _contactController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _locationController;
  late TextEditingController _companyTypeController;
  late TextEditingController _postedJobsController;

  late String _status;
  late String _logo;

  @override
  void initState() {
    super.initState();

    _companyNameController = TextEditingController(
      text: widget.employer['name']?.toString() ?? '',
    );

    _contactController = TextEditingController(
      text: widget.employer['contact']?.toString() ?? '',
    );

    _emailController = TextEditingController(
      text: widget.employer['email']?.toString() ?? '',
    );

    _phoneController = TextEditingController(
      text: widget.employer['phone']?.toString() ?? '',
    );

    _locationController = TextEditingController(
      text: widget.employer['location']?.toString() ?? '',
    );

    _companyTypeController = TextEditingController(
      text: widget.employer['companyType']?.toString() ?? '',
    );

    _postedJobsController = TextEditingController(
      text: widget.employer['postedJobs']?.toString() ?? '',
    );

    _status = widget.employer['status']?.toString() ?? 'Active';

    _logo = widget.employer['logo']?.toString() ?? 'T';
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _companyTypeController.dispose();
    _postedJobsController.dispose();

    super.dispose();
  }

  // ------------------------------------------------------------
  // VALIDATION
  // ------------------------------------------------------------

  String? _requiredValidator(
      String? value,
      String fieldName,
      ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'HR email is required';
    }

    final emailRegex = RegExp(
      r'^[\w\.-]+@[\w\.-]+\.\w+$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String? _phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final phone = value.replaceAll(RegExp(r'[\s\-+]'), '');

    if (!RegExp(r'^\d{10,12}$').hasMatch(phone)) {
      return 'Enter a valid phone number';
    }

    return null;
  }

  String? _jobsValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Posted jobs count is required';
    }

    final jobs = int.tryParse(value.trim());

    if (jobs == null) {
      return 'Enter a valid number';
    }

    if (jobs < 0) {
      return 'Jobs cannot be negative';
    }

    return null;
  }

  // ------------------------------------------------------------
  // SAVE
  // ------------------------------------------------------------

  void _saveEmployer() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final companyName = _companyNameController.text.trim();

    // Automatically create logo from company name
    String newLogo = _logo;

    if (companyName.isNotEmpty) {
      final words = companyName.split(' ');

      if (words.length >= 2) {
        newLogo =
            '${words[0][0]}${words[1][0]}'.toUpperCase();
      } else {
        newLogo = companyName[0].toUpperCase();
      }
    }

    final updatedEmployer = Map<String, dynamic>.from(
      widget.employer,
    );

    updatedEmployer['name'] = companyName;
    updatedEmployer['contact'] =
        _contactController.text.trim();
    updatedEmployer['email'] =
        _emailController.text.trim();
    updatedEmployer['phone'] =
        _phoneController.text.trim();
    updatedEmployer['location'] =
        _locationController.text.trim();
    updatedEmployer['companyType'] =
        _companyTypeController.text.trim();
    updatedEmployer['postedJobs'] =
        int.parse(_postedJobsController.text.trim());
    updatedEmployer['status'] = _status;
    updatedEmployer['logo'] = newLogo;

    Navigator.pop(
      context,
      updatedEmployer,
    );
  }

  // ------------------------------------------------------------
  // MAIN UI
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),

            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    12,
                    12,
                    12,
                    20,
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      _buildPageTitle(),

                      const SizedBox(height: 12),

                      _buildTextField(
                        controller: _companyNameController,
                        label: 'Company Name',
                        hint: 'Enter company name',
                        icon: Icons.business_outlined,
                        validator: (value) =>
                            _requiredValidator(
                              value,
                              'Company name',
                            ),
                      ),

                      const SizedBox(height: 12),

                      _buildTextField(
                        controller: _contactController,
                        label: 'Contact Person',
                        hint: 'Enter contact person',
                        icon: Icons.person_outline,
                        validator: (value) =>
                            _requiredValidator(
                              value,
                              'Contact person',
                            ),
                      ),

                      const SizedBox(height: 12),

                      _buildTextField(
                        controller: _emailController,
                        label: 'HR Contact Email',
                        hint: 'example@company.com',
                        icon: Icons.email_outlined,
                        keyboardType:
                        TextInputType.emailAddress,
                        validator: _emailValidator,
                      ),

                      const SizedBox(height: 12),

                      _buildTextField(
                        controller: _phoneController,
                        label: 'Contact Phone',
                        hint: '+91 98765 43210',
                        icon: Icons.phone_outlined,
                        keyboardType:
                        TextInputType.phone,
                        validator: _phoneValidator,
                      ),

                      const SizedBox(height: 12),

                      _buildTextField(
                        controller: _locationController,
                        label: 'Location',
                        hint: 'Mumbai, India',
                        icon: Icons.location_on_outlined,
                        validator: (value) =>
                            _requiredValidator(
                              value,
                              'Location',
                            ),
                      ),

                      const SizedBox(height: 12),

                      _buildTextField(
                        controller: _companyTypeController,
                        label: 'Company Type',
                        hint: 'Enterprise Employer',
                        icon: Icons.category_outlined,
                        validator: (value) =>
                            _requiredValidator(
                              value,
                              'Company type',
                            ),
                      ),

                      const SizedBox(height: 12),

                      _buildTextField(
                        controller: _postedJobsController,
                        label: 'Posted Jobs Count',
                        hint: 'Enter number of jobs',
                        icon: Icons.work_outline,
                        keyboardType:
                        TextInputType.number,
                        validator: _jobsValidator,
                      ),

                      const SizedBox(height: 12),

                      _buildStatusDropdown(),

                      const SizedBox(height: 20),

                      _buildButtons(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // HEADER
  // ------------------------------------------------------------

  Widget _buildHeader() {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              splashRadius: 20,
              icon: Icon(
                Icons.arrow_back,
                color: primaryBlue,
                size: 25,
              ),
            ),

            const SizedBox(width: 1),

             Expanded(
              child: Text(
                'Edit Employer',
                style: TextStyle(
                  color: navyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            IconButton(
              onPressed: () {},
              splashRadius: 20,
              icon: Icon(
                Icons.notifications_none_outlined,
                color: greyColor,
                size: 21,
              ),
            ),

            const SizedBox(width: 2),

            Container(
              width: profileSize,
              height: profileSize,
              decoration: BoxDecoration(
                color: avatarColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Text(
                'SA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // PAGE TITLE
  // ------------------------------------------------------------

  Widget _buildPageTitle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: chipColor,
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            child: Text(
              _logo,
              style: TextStyle(
                color: primaryBlue,
                fontSize: _logo.length > 2 ? 11 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 10),

           Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'Employer Information',
                  style: TextStyle(
                    color: navyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Update employer details below',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 9.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // TEXT FIELD
  // ------------------------------------------------------------

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:  TextStyle(
            color: navyColor,
            fontSize: 10.5,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          autovalidateMode:
          AutovalidateMode.onUserInteraction,
          style:  TextStyle(
            color: navyColor,
            fontSize: 11,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: greyColor,
              fontSize: 10,
            ),
            prefixIcon: Icon(
              icon,
              color: greyColor,
              size: 18,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
            const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
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
                color: primaryBlue,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: redColor,
              ),
            ),
            focusedErrorBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: redColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // STATUS DROPDOWN
  // ------------------------------------------------------------

  Widget _buildStatusDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Status',
          style: TextStyle(
            color: navyColor,
            fontSize: 10.5,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: DropdownButtonFormField<String>(
            value: _status,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.toggle_on_outlined,
                color: greyColor,
                size: 19,
              ),
              border: InputBorder.none,
              contentPadding:
              const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
            ),
            style:  TextStyle(
              color: navyColor,
              fontSize: 11,
            ),
            items: const [
              DropdownMenuItem(
                value: 'Active',
                child: Text('Active'),
              ),
              DropdownMenuItem(
                value: 'Pending',
                child: Text('Pending'),
              ),
              DropdownMenuItem(
                value: 'Blocked',
                child: Text('Blocked'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _status = value;
                });
              }
            },
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // BUTTONS
  // ------------------------------------------------------------

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 42,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: navyColor,
                side: BorderSide(
                  color: borderColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: SizedBox(
            height: 42,
            child: ElevatedButton(
              onPressed: _saveEmployer,
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
                'Save Changes',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}