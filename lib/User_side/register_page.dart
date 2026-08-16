import 'package:flutter/material.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int selectedRole = 2;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool agreeTerms = false;

  final TextEditingController fullNameController =
  TextEditingController(text: "Suresh Kumar");

  final TextEditingController emailController =
  TextEditingController(text: "sureshkumar12@gmail.com");

  final TextEditingController phoneController =
  TextEditingController(text: "+91 1234567890");

  final TextEditingController passwordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ============================================================
            // TOP HEADER
            // ============================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                16,
                25,
                16,
                22,
              ),
              color: const Color(0xff1C2E55),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15,),
                  // Logo + Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [

                      Icon(
                        Icons.business_center,
                        color: Colors.white,
                        size: 25,
                      ),

                      SizedBox(width: 7),

                      Text(
                        "HireHub",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Build Your Career.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 2),

                  const Text(
                    "Shape Your Future.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Explore trusted job opportunities and apply easily.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffB5C5E8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // ============================================================
            // REGISTER FORM
            // ============================================================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                18,
                16,
                20,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ======================================================
                  // TITLE
                  // ======================================================

                  const Text(
                    "Create an account",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff111827),
                    ),
                  ),

                  const SizedBox(height: 3),

                  const Text(
                    "Sign up to start matching with top vacancies today",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff64748B),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ======================================================
                  // ROLE SELECTOR
                  // ======================================================

                  Container(
                    height: 36,
                    padding: const EdgeInsets.all(2),

                    decoration: BoxDecoration(
                      color: const Color(0xffF8FAFC),
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                        color: const Color(0xffE2E8F0),
                      ),
                    ),

                    child: Row(
                      children: [
                        _roleButton("Admin", 0),
                        _roleButton("Employer", 1),
                        _roleButton("Job Seeker", 2),
                      ],
                    ),
                  ),

                  const SizedBox(height: 13),

                  // ======================================================
                  // FULL NAME
                  // ======================================================

                  _fieldLabel("Full Name"),

                  const SizedBox(height: 5),

                  _textField(
                    controller: fullNameController,
                    icon: Icons.person,
                    hintText: "Enter your full name",
                  ),

                  const SizedBox(height: 9),

                  // ======================================================
                  // EMAIL
                  // ======================================================

                  _fieldLabel("Email Address"),

                  const SizedBox(height: 5),

                  _textField(
                    controller: emailController,
                    icon: Icons.email,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 9),

                  // ======================================================
                  // PHONE
                  // ======================================================

                  _fieldLabel("Phone Number"),

                  const SizedBox(height: 5),

                  _textField(
                    controller: phoneController,
                    icon: Icons.phone,
                    hintText: "Enter your phone number",
                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(height: 9),

                  // ======================================================
                  // PASSWORD
                  // ======================================================

                  _fieldLabel("Password"),

                  const SizedBox(height: 5),

                  _passwordField(
                    controller: passwordController,
                    hintText: "Minimum 8 characters",
                    isVisible: isPasswordVisible,

                    onVisibilityTap: () {
                      setState(() {
                        isPasswordVisible =
                        !isPasswordVisible;
                      });
                    },
                  ),

                  const SizedBox(height: 9),

                  // ======================================================
                  // CONFIRM PASSWORD
                  // ======================================================

                  _fieldLabel("Confirm Password"),

                  const SizedBox(height: 5),

                  _passwordField(
                    controller: confirmPasswordController,
                    hintText: "Re-enter your password",
                    isVisible: isConfirmPasswordVisible,

                    onVisibilityTap: () {
                      setState(() {
                        isConfirmPasswordVisible =
                        !isConfirmPasswordVisible;
                      });
                    },
                  ),

                  const SizedBox(height: 11),

                  // ======================================================
                  // TERMS
                  // ======================================================

                  Row(
                    children: [

                      SizedBox(
                        width: 20,
                        height: 20,

                        child: Checkbox(
                          value: agreeTerms,

                          onChanged: (value) {
                            setState(() {
                              agreeTerms = value ?? false;
                            });
                          },

                          activeColor:
                          const Color(0xff2563EB),

                          materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,

                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(4),
                          ),

                          side: const BorderSide(
                            color: Color(0xff2563EB),
                            width: 1.5,
                          ),
                        ),
                      ),

                      const SizedBox(width: 4),

                      // Flexible prevents horizontal overflow
                      Flexible(
                        child: Wrap(
                          children: [

                            const Text(
                              "I agree to the ",
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff475569),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Terms of Service",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xff2563EB),
                                  fontWeight:
                                  FontWeight.w600,
                                ),
                              ),
                            ),

                            const Text(
                              " and ",
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff475569),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xff2563EB),
                                  fontWeight:
                                  FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // ======================================================
                  // REGISTER BUTTON
                  // ======================================================

                  SizedBox(
                    width: double.infinity,
                    height: 40,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        if (!agreeTerms) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please agree to the Terms of Service",
                              ),
                            ),
                          );

                          return;
                        }

                        if (passwordController.text.length <
                            8) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Password must be at least 8 characters",
                              ),
                            ),
                          );

                          return;
                        }

                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Passwords do not match",
                              ),
                            ),
                          );

                          return;
                        }

                        print("Register Account");
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0xff2563EB),

                        foregroundColor: Colors.white,

                        elevation: 2,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(7),
                        ),
                      ),

                      child: const Text(
                        "Register Account",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ======================================================
                  // LOGIN
                  // ======================================================

                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [

                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xff64748B),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                          },

                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xff2563EB),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // ROLE BUTTON
  // ============================================================

  Widget _roleButton(
      String title,
      int index,
      ) {
    final bool isSelected =
        selectedRole == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRole = index;
          });
        },

        child: AnimatedContainer(
          duration:
          const Duration(milliseconds: 200),

          alignment: Alignment.center,

          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xff2563EB)
                : Colors.transparent,

            borderRadius:
            BorderRadius.circular(7),

            boxShadow: isSelected
                ? [
              BoxShadow(
                color:
                Colors.black.withOpacity(0.15),
                blurRadius: 3,
                offset:
                const Offset(0, 1),
              ),
            ]
                : null,
          ),

          child: Text(
            title,

            style: TextStyle(
              fontSize: 11,

              fontWeight: isSelected
                  ? FontWeight.w600
                  : FontWeight.w400,

              color: isSelected
                  ? Colors.white
                  : const Color(0xff334155),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // FIELD LABEL
  // ============================================================

  Widget _fieldLabel(
      String text,
      ) {
    return Text(
      text,

      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: Color(0xff0F172A),
      ),
    );
  }

  // ============================================================
  // NORMAL TEXT FIELD
  // ============================================================

  Widget _textField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return SizedBox(
      height: 40,

      child: TextField(
        controller: controller,

        keyboardType: keyboardType,

        style: const TextStyle(
          fontSize: 12,
          color: Color(0xff1E293B),
        ),

        decoration: InputDecoration(

          prefixIcon: Icon(
            icon,
            size: 18,
            color: const Color(0xff94A3B8),
          ),

          hintText: hintText,

          hintStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xff94A3B8),
          ),

          contentPadding:
          const EdgeInsets.symmetric(
            horizontal: 10,
          ),

          filled: true,
          fillColor: Colors.white,

          enabledBorder:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(7),

            borderSide:
            const BorderSide(
              color: Color(0xffE2E8F0),
            ),
          ),

          focusedBorder:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(7),

            borderSide:
            const BorderSide(
              color: Color(0xff2563EB),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PASSWORD FIELD
  // ============================================================

  Widget _passwordField({
    required TextEditingController controller,
    required String hintText,
    required bool isVisible,
    required VoidCallback onVisibilityTap,
  }) {
    return SizedBox(
      height: 40,

      child: TextField(
        controller: controller,

        obscureText: !isVisible,

        style: const TextStyle(
          fontSize: 12,
          color: Color(0xff1E293B),
        ),

        decoration: InputDecoration(

          prefixIcon: const Icon(
            Icons.lock,
            size: 18,
            color: Color(0xff94A3B8),
          ),

          suffixIcon: IconButton(
            onPressed: onVisibilityTap,

            padding: EdgeInsets.zero,

            icon: Icon(
              isVisible
                  ? Icons.visibility
                  : Icons.visibility_off,

              size: 18,

              color:
              const Color(0xff94A3B8),
            ),
          ),

          hintText: hintText,

          hintStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xff94A3B8),
          ),

          contentPadding:
          const EdgeInsets.symmetric(
            horizontal: 10,
          ),

          filled: true,
          fillColor: Colors.white,

          enabledBorder:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(7),

            borderSide:
            const BorderSide(
              color: Color(0xffE2E8F0),
            ),
          ),

          focusedBorder:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(7),

            borderSide:
            const BorderSide(
              color: Color(0xff2563EB),
            ),
          ),
        ),
      ),
    );
  }
}