
import 'package:flutter/material.dart';
import '../references/reference.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() =>
      _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  int currentStep = 0;

  bool isLoading = false;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  // Demo OTP only. No real email is sent.
  final String demoOtp = '123456';

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void showMessage(String message, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : navyColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  InputDecoration inputDecoration(
      String hint,
      IconData icon, {
        Widget? suffixIcon,
      }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.blueGrey, size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(color: blueColor, width: 1.5),
      ),
    );
  }

  Widget fieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Text(
        label,
        style: TextStyle(
          color: navyColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget primaryButton(String title, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: blueColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: isLoading
            ? const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> sendOtp() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    setState(() {
      isLoading = false;
      currentStep = 1;
    });

    showMessage('Demo OTP: $demoOtp. No email was sent.');
  }

  void verifyOtp() {
    FocusScope.of(context).unfocus();

    if (otpController.text.trim() != demoOtp) {
      showMessage('Please enter the correct 6-digit OTP.',
          error: true);
      return;
    }

    setState(() => currentStep = 2);
    showMessage('OTP verified successfully.');
  }

  Future<void> resetPassword() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    setState(() => isLoading = false);

    showMessage(
      'Demo completed. Connect a backend to save your password.',
    );

    Navigator.pop(context);
  }

  Widget buildCurrentStep() {
    if (currentStep == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fieldLabel('Email Address'),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                  .hasMatch(value.trim())) {
                return 'Enter a valid email address';
              }
              return null;
            },
            decoration: inputDecoration(
              'Enter your registered email',
              Icons.email_outlined,
            ),
          ),
          const SizedBox(height: 22),
          primaryButton('Send OTP', sendOtp),
        ],
      );
    }

    if (currentStep == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fieldLabel('Enter OTP'),
          TextFormField(
            controller: otpController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            decoration: inputDecoration(
              'Enter 6-digit OTP',
              Icons.verified_user_outlined,
            ).copyWith(counterText: ''),
          ),
          const SizedBox(height: 8),
          const Text(
            'Demo OTP: 123456',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 18),
          primaryButton('Verify OTP', verifyOtp),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  currentStep = 0;
                  otpController.clear();
                });
              },
              child: Text(
                'Change Email',
                style: TextStyle(color: blueColor),
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldLabel('New Password'),
        TextFormField(
          controller: passwordController,
          obscureText: hidePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a new password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          decoration: inputDecoration(
            'Enter new password',
            Icons.lock_outline,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => hidePassword = !hidePassword);
              },
              icon: Icon(
                hidePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        fieldLabel('Confirm Password'),
        TextFormField(
          controller: confirmPasswordController,
          obscureText: hideConfirmPassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          decoration: inputDecoration(
            'Re-enter new password',
            Icons.lock_outline,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hideConfirmPassword = !hideConfirmPassword;
                });
              },
              icon: Icon(
                hideConfirmPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
        ),
        const SizedBox(height: 22),
        primaryButton('Reset Password', resetPassword),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: navyColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: borderColor),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Icon(
                          Icons.lock_reset,
                          color: blueColor,
                          size: 42,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: Text(
                          currentStep == 0
                              ? 'Reset Your Password'
                              : currentStep == 1
                              ? 'Verify Your Email'
                              : 'Create New Password',
                          style: TextStyle(
                            color: navyColor,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          currentStep == 0
                              ? 'Enter your email to receive an OTP.'
                              : currentStep == 1
                              ? 'Enter the OTP to continue.'
                              : 'Choose a new password for your account.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 26),
                      buildCurrentStep(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
