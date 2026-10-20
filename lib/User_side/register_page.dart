
import 'package:flutter/material.dart';

import '../references/reference.dart';
import 'login.dart';

void main() {
  runApp(const RegisterApp());
}

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HireHub Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  bool isJobSeeker = false;
  bool agreeTerms = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final fullNameController = TextEditingController();
  final bioController = TextEditingController();

  final companyNameController = TextEditingController();
  final contactPersonController = TextEditingController();
  final websiteController = TextEditingController();
  final aboutCompanyController = TextEditingController();

  String? selectedIndustry;
  String? selectedCompanySize;

  final List<String> industries = [
    'Information Technology',
    'Healthcare',
    'Finance & Banking',
    'Education',
    'E-Commerce',
    'Manufacturing',
    'Other',
  ];

  final List<String> companySizes = [
    '1 - 10 employees',
    '11 - 50 employees',
    '51 - 200 employees',
    '201 - 500 employees',
    '500+ employees',
  ];

  static const Color primaryNavy = Color(0xFF1F2E4D);

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    dateController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    fullNameController.dispose();
    bioController.dispose();
    companyNameController.dispose();
    contactPersonController.dispose();
    websiteController.dispose();
    aboutCompanyController.dispose();
    super.dispose();
  }

  Future<void> _selectRegistrationDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        final day = picked.day.toString().padLeft(2, '0');
        final month = picked.month.toString().padLeft(2, '0');
        final year = picked.year.toString();
        dateController.text = '$day-$month-$year';
      });
    }
  }



  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  String? _validateName(String? value) {
    final requiredError = _validateRequired(value, 'your full name');
    if (requiredError != null) return requiredError;

    if (value!.trim().length < 3) {
      return 'Name must contain at least 3 characters';
    }

    if (!RegExp(r"^[a-zA-Z]+(?:[ .'-][a-zA-Z]+)*$")
        .hasMatch(value.trim())) {
      return 'Enter a valid name';
    }

    return null;
  }

  String? _validateCompanyName(String? value) {
    final error = _validateRequired(value, 'company name');
    if (error != null) return error;

    if (value!.trim().length < 2) {
      return 'Company name must contain at least 2 characters';
    }

    return null;
  }

  String? _validateEmail(String? value) {
    final error = _validateRequired(value, 'your email address');
    if (error != null) return error;

    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value!.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String? _validatePhone(String? value) {
    final error = _validateRequired(value, 'your phone number');
    if (error != null) return error;

    if (!RegExp(r'^[6-9][0-9]{9}$').hasMatch(value!.trim())) {
      return 'Enter a valid 10-digit mobile number';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    if (value.length < 8) {
      return 'Password must contain at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Include an uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Include a lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Include a number';
    }

    if (!RegExp(r'[^a-zA-Z0-9]').hasMatch(value)) {
      return 'Include a special character';
    }

    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  String? _validateIndustry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an industry';
    }
    return null;
  }

  String? _validateWebsite(String? value) {
    if (value == null || value.trim().isEmpty) return null;

    final website = value.trim();
    final uri = Uri.tryParse(
      website.startsWith('http://') || website.startsWith('https://')
          ? website
          : 'https://$website',
    );

    if (uri == null ||
        !uri.hasAuthority ||
        !uri.host.contains('.') ||
        uri.host.startsWith('.') ||
        uri.host.endsWith('.')) {
      return 'Enter a valid website address';
    }

    return null;
  }

  void _handleRegistration() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!agreeTerms) {
      _showSnackBar(
        'You must agree to the Terms of Service and Privacy Policy.',
      );
      return;
    }

    final role = isJobSeeker ? 'Job Seeker' : 'Employee';
    _showSnackBar(
      'Successfully registered as $role!',
      isSuccess: true,
    );

    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
    // TODO: Connect your database or backend API here.
  }

  void _showSnackBar(String message, {bool isSuccess = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.green.shade700 : Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 750;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Container(
                color: navyColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/logo.png",height: 200,width: 200,alignment: AlignmentGeometry.topCenter,)
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      "Explore trusted job opportunities and apply easily.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isJobSeeker
                            ? 'Create a job seeker account'
                            : 'Create an employee account',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isJobSeeker
                            ? 'Sign up to start matching with top vacancies today.'
                            : 'Register your company and connect with talented candidates.',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 24),
// Role toggle
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _roleButton(
                                title: 'Employee',
                                icon: Icons.business_center_outlined,
                                selected: !isJobSeeker,
                                onTap: () {
                                  setState(() => isJobSeeker = false);
                                },
                              ),
                            ),
                            Expanded(
                              child: _roleButton(
                                title: 'Job Seeker',
                                icon: Icons.person_outline,
                                selected: isJobSeeker,
                                onTap: () {
                                  setState(() => isJobSeeker = true);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),


                      if (isJobSeeker)
                        _buildJobSeekerFields(isWide)
                      else
                        _buildEmployeeFields(isWide),

                      const SizedBox(height: 16),


                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                              value: agreeTerms,
                              activeColor: blueColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              onChanged: (value) {
                                setState(() => agreeTerms = value ?? false);
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Text(
                                  'I agree to the ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child:  Text(
                                    'Terms of Service',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: blueColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Text(
                                  ' and ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child:  Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: blueColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),


                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          onPressed: _handleRegistration,
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                            },
                            child:  Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 12,
                                color: blueColor,
                                fontWeight: FontWeight.bold,
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


  Widget _buildJobSeekerFields(bool isWide) {
    final fields = <Widget>[
      _buildInputField(
        label: 'FULL NAME *',
        hintText: 'Enter full name',
        icon: Icons.person_outline,
        controller: fullNameController,
        validator: _validateName,
      ),
      _buildFilePickerField(label: 'PROFILE PICTURE'),
      _buildInputField(
        label: 'EMAIL ADDRESS *',
        hintText: 'admin@gmail.com',
        icon: Icons.email_outlined,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: _validateEmail,
        isHighlighted: true,
      ),
      _buildInputField(
        label: 'PHONE NUMBER *',
        hintText: '9876543210',
        icon: Icons.phone_outlined,
        controller: phoneController,
        keyboardType: TextInputType.phone,
        validator: _validatePhone,
      ),
      _buildInputField(
        label: 'LOCATION',
        hintText: 'City, State',
        icon: Icons.location_on_outlined,
        controller: locationController,
      ),
      _buildDateField(),
      _buildPasswordField(
        label: 'PASSWORD *',
        hintText: '••••••••',
        controller: passwordController,
        isObscured: obscurePassword,
        isHighlighted: true,
        validator: _validatePassword,
        onToggleVisibility: () {
          setState(() => obscurePassword = !obscurePassword);
        },
      ),
      _buildPasswordField(
        label: 'CONFIRM PASSWORD *',
        hintText: 'Re-enter password',
        controller: confirmPasswordController,
        isObscured: obscureConfirmPassword,
        validator: _validateConfirmPassword,
        onToggleVisibility: () {
          setState(() {
            obscureConfirmPassword = !obscureConfirmPassword;
          });
        },
      ),
    ];

    return Column(
      children: [
        _buildResponsiveRows(fields, isWide),
        const SizedBox(height: 20),
        _buildDescriptionField(
          title: 'Personal Information',
          hint: 'Tell us something about yourself...',
          controller: bioController,
        ),
      ],
    );
  }


  Widget _buildEmployeeFields(bool isWide) {
    final fields = <Widget>[
      _buildInputField(
        label: 'COMPANY NAME *',
        hintText: 'Enter company name',
        icon: Icons.apartment_outlined,
        controller: companyNameController,
        validator: _validateCompanyName,
      ),
      _buildInputField(
        label: 'CONTACT PERSON *',
        hintText: 'Enter full name',
        icon: Icons.person_outline,
        controller: contactPersonController,
        validator: _validateName,
      ),
      _buildFilePickerField(label: 'COMPANY / PROFILE PICTURE'),
      _buildInputField(
        label: 'EMAIL ADDRESS *',
        hintText: 'admin@gmail.com',
        icon: Icons.email_outlined,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: _validateEmail,
        isHighlighted: true,
      ),
      _buildInputField(
        label: 'PHONE NUMBER *',
        hintText: '9876543210',
        icon: Icons.phone_outlined,
        controller: phoneController,
        keyboardType: TextInputType.phone,
        validator: _validatePhone,
      ),
      _buildInputField(
        label: 'LOCATION',
        hintText: 'City, State',
        icon: Icons.location_on_outlined,
        controller: locationController,
      ),
      _buildDropdownField(
        label: 'INDUSTRY *',
        hintText: '-- Select Industry --',
        icon: Icons.grid_view_outlined,
        items: industries,
        selectedValue: selectedIndustry,
        validator: _validateIndustry,
        onChanged: (value) {
          setState(() => selectedIndustry = value);
        },
      ),
      _buildDropdownField(
        label: 'COMPANY SIZE',
        hintText: '-- Select Company Size --',
        icon: Icons.groups_outlined,
        items: companySizes,
        selectedValue: selectedCompanySize,
        onChanged: (value) {
          setState(() => selectedCompanySize = value);
        },
      ),
      _buildInputField(
        label: 'WEBSITE',
        hintText: 'www.company.com',
        icon: Icons.language_outlined,
        controller: websiteController,
        keyboardType: TextInputType.url,
        validator: _validateWebsite,
      ),
      _buildDateField(),
      _buildPasswordField(
        label: 'PASSWORD *',
        hintText: '••••••••',
        controller: passwordController,
        isObscured: obscurePassword,
        isHighlighted: true,
        validator: _validatePassword,
        onToggleVisibility: () {
          setState(() => obscurePassword = !obscurePassword);
        },
      ),
      _buildPasswordField(
        label: 'CONFIRM PASSWORD *',
        hintText: 'Re-enter password',
        controller: confirmPasswordController,
        isObscured: obscureConfirmPassword,
        validator: _validateConfirmPassword,
        onToggleVisibility: () {
          setState(() {
            obscureConfirmPassword = !obscureConfirmPassword;
          });
        },
      ),
    ];

    return Column(
      children: [
        _buildResponsiveRows(fields, isWide),
        const SizedBox(height: 20),
        _buildDescriptionField(
          title: 'About Company',
          hint: 'Tell us about your company, services, culture and business...',
          controller: aboutCompanyController,
        ),
      ],
    );
  }


  Widget _buildResponsiveRows(List<Widget> fields, bool isWide) {
    if (!isWide) {
      return Column(
        children: [
          for (int i = 0; i < fields.length; i++) ...[
            fields[i],
            if (i < fields.length - 1) const SizedBox(height: 16),
          ],
        ],
      );
    }

    final rows = <Widget>[];

    for (int i = 0; i < fields.length; i += 2) {
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: fields[i]),
            const SizedBox(width: 16),
            Expanded(
              child: i + 1 < fields.length
                  ? fields[i + 1]
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      );

      if (i + 2 < fields.length) {
        rows.add(const SizedBox(height: 16));
      }
    }

    return Column(children: rows);
  }

  Widget _roleButton({
    required String title,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? blueColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: selected ? Colors.white : Colors.black54,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: selected ? Colors.white : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hintText,
    IconData? prefixIcon,
    Widget? suffixIcon,
    bool isHighlighted = false,
  }) {
    return InputDecoration(
      prefixIcon: prefixIcon == null
          ? null
          : Icon(prefixIcon, size: 18, color: Colors.grey.shade400),
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 13,
      ),
      filled: isHighlighted,
      fillColor: isHighlighted
          ? Colors.blue.shade50.withOpacity(0.4)
          : Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:  BorderSide(color: blueColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    bool isHighlighted = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel(label),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
          validator: validator,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
          decoration: _inputDecoration(
            hintText: hintText,
            prefixIcon: icon,
            isHighlighted: isHighlighted,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hintText,
    required IconData icon,
    required List<String> items,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel(label),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: onChanged,
          validator: validator,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey.shade600,
          ),
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black87,
          ),
          decoration: _inputDecoration(
            hintText: hintText,
            prefixIcon: icon,
          ),
          hint: Text(
            hintText,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 13,
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFilePickerField({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel(label),
        const SizedBox(height: 6),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.person,
                  size: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: const Size(65, 28),
                  textStyle: const TextStyle(fontSize: 11),
                ),
                onPressed: () {
                  _showSnackBar('Choose File button clicked.');
                },
                child: const Text('Choose File'),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'No file chosen',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'JPG, JPEG or PNG',
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel('REGISTRATION DATE'),
        const SizedBox(height: 6),
        TextFormField(
          controller: dateController,
          readOnly: true,
          onTap: () => _selectRegistrationDate(context),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
          decoration: _inputDecoration(
            hintText: 'dd-mm-yyyy',
            prefixIcon: Icons.calendar_today_outlined,
            suffixIcon: Icon(
              Icons.event,
              size: 18,
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required bool isObscured,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
    bool isHighlighted = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel(label),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: isObscured,
          textInputAction: TextInputAction.next,
          validator: validator,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
          decoration: _inputDecoration(
            hintText: hintText,
            prefixIcon: Icons.lock_outline,
            isHighlighted: isHighlighted,
            suffixIcon: IconButton(
              icon: Icon(
                isObscured
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 18,
                color: Colors.grey.shade400,
              ),
              onPressed: onToggleVisibility,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField({
    required String title,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: 4,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
          decoration: _inputDecoration(hintText: hint).copyWith(
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}
