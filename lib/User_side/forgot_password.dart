import 'package:flutter/material.dart';

import 'login.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {


  final TextEditingController newPasswordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();


  final Color backgroundColor = const Color(0xFFFFFCF7);
  final Color navyColor = const Color(0xFF17233B);
  final Color blueColor = const Color(0xFF2864E8);
  final Color bottomColor = const Color(0xFF17445B);
  final Color borderColor = const Color(0xFFE1E5EB);


  bool hideNewPassword = true;
  bool hideConfirmPassword = true;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  void changePassword() {

    FocusScope.of(context).unfocus();

    String newPassword =
    newPasswordController.text.trim();

    String confirmPassword =
    confirmPasswordController.text.trim();

    // Empty validation
    if (newPassword.isEmpty ||
        confirmPassword.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all fields",
          ),
        ),
      );

      return;
    }

    // Password length
    if (newPassword.length < 6) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Password must contain at least 6 characters",
          ),
        ),
      );

      return;
    }

    // Password matching
    if (newPassword != confirmPassword) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Passwords do not match",
          ),
        ),
      );

      return;
    }

    // Success
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Password changed successfully",
        ),
      ),
    );

    // Go back to login
    Future.delayed(
      const Duration(milliseconds: 800),
          () {

        if (!mounted) return;

        Navigator.pop(context);
      },
    );
  }


  Widget passwordField({
    required TextEditingController controller,
    required String hintText,
    required bool obscureText,
    required VoidCallback onVisibilityPressed,
  }) {

    return TextField(
      controller: controller,

      obscureText: obscureText,

      style: const TextStyle(
        fontSize: 12,
        color: Color(0xFF17233B),
      ),

      decoration: InputDecoration(

        hintText: hintText,

        hintStyle: const TextStyle(
          fontSize: 11,
          color: Color(0xFF9AA0AA),
        ),

        prefixIcon: const Icon(
          Icons.lock_outline,
          size: 19,
          color: Color(0xFF7B808A),
        ),

        suffixIcon: IconButton(
          onPressed: onVisibilityPressed,

          icon: Icon(
            obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,

            size: 19,

            color: const Color(
              0xFF7B808A,
            ),
          ),
        ),

        filled: true,

        fillColor: const Color(
          0xFFF8F9FB,
        ),

        contentPadding:
        const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13,
        ),

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(9),

          borderSide: BorderSide(
            color: borderColor,
          ),
        ),

        enabledBorder:
        OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(9),

          borderSide: BorderSide(
            color: borderColor,
          ),
        ),

        focusedBorder:
        OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(9),

          borderSide: const BorderSide(
            color: Color(0xFF2864E8),
            width: 1.3,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        bottom: false,

        child: Column(
          children: [


            Container(
              height: 60,
              width: double.infinity,

              padding:
              const EdgeInsets.symmetric(
                horizontal: 15,
              ),

              child: Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Container(
                      width: 38,
                      height: 38,

                      decoration:
                      BoxDecoration(
                        color: Colors.white,

                        border: Border.all(
                          color: borderColor,
                        ),

                        borderRadius:
                        BorderRadius.circular(10),
                      ),

                      child: const Icon(
                        Icons.arrow_back,
                        size: 19,
                        color: Color(
                          0xFF17233B,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Text(
                    "Change Password",

                    style: TextStyle(
                      fontSize: 19,
                      fontWeight:
                      FontWeight.bold,
                      color: Color(
                        0xFF17233B,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Expanded(
              child: SingleChildScrollView(

                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  25,
                  20,
                  25,
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [


                    const Text(
                      "Create a new password",

                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                        FontWeight.bold,
                        color: Color(
                          0xFF17233B,
                        ),
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Text(
                      "Your new password must be different "
                          "from your previous password.",

                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: Color(
                          0xFF7B808A,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    Container(
                      width: double.infinity,

                      padding:
                      const EdgeInsets.all(16),

                      decoration:
                      BoxDecoration(
                        color: Colors.white,

                        border: Border.all(
                          color: borderColor,
                        ),

                        borderRadius:
                        BorderRadius.circular(
                          12,
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          const Text(
                            "New Password",

                            style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                              FontWeight.w600,
                              color: Color(
                                0xFF17233B,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          passwordField(
                            controller:
                            newPasswordController,

                            hintText:
                            "Enter new password",

                            obscureText:
                            hideNewPassword,

                            onVisibilityPressed:
                                () {
                              setState(() {
                                hideNewPassword =
                                !hideNewPassword;
                              });
                            },
                          ),

                          const SizedBox(height: 18),

                          const Text(
                            "Confirm Password",

                            style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                              FontWeight.w600,
                              color: Color(
                                0xFF17233B,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          passwordField(
                            controller:
                            confirmPasswordController,

                            hintText:
                            "Confirm new password",

                            obscureText:
                            hideConfirmPassword,

                            onVisibilityPressed:
                                () {
                              setState(() {
                                hideConfirmPassword =
                                !hideConfirmPassword;
                              });
                            },
                          ),

                          const SizedBox(height: 10),

                          // Password requirement
                          const Row(
                            children: [

                              Icon(
                                Icons.info_outline,
                                size: 14,
                                color: Color(
                                  0xFF7B808A,
                                ),
                              ),

                              SizedBox(width: 5),

                              Text(
                                "Use at least 6 characters",

                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(
                                    0xFF7B808A,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 22),
                          SizedBox(
                            width: double.infinity,
                            height: 46,

                            child:
                            ElevatedButton(
                              onPressed:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                              },

                              // changePassword,

                              style:
                              ElevatedButton.styleFrom(
                                backgroundColor:
                                blueColor,

                                elevation: 0,

                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                    9,
                                  ),
                                ),
                              ),

                              child:
                              const Text(
                                "Change Password",

                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight:
                                  FontWeight.w600,
                                  color:
                                  Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),


                    Container(
                      width: double.infinity,

                      padding:
                      const EdgeInsets.all(12),

                      decoration:
                      BoxDecoration(
                        color:
                        const Color(
                          0xFFF3F7FF,
                        ),

                        borderRadius:
                        BorderRadius.circular(
                          10,
                        ),

                        border: Border.all(
                          color:
                          const Color(
                            0xFFDCE8FF,
                          ),
                        ),
                      ),

                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          const Icon(
                            Icons.shield_outlined,
                            size: 18,
                            color: Color(
                              0xFF2864E8,
                            ),
                          ),

                          const SizedBox(width: 9),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: [

                                const Text(
                                  "Keep your account secure",

                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w600,
                                    color: Color(
                                      0xFF17233B,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 3,
                                ),

                                const Text(
                                  "Do not share your password "
                                      "with anyone.",

                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.4,
                                    color: Color(
                                      0xFF7B808A,
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
            ),

            Container(
              height: 55,
              width: double.infinity,

              decoration: BoxDecoration(
                color: bottomColor,

                boxShadow: [
                  BoxShadow(
                    color:
                    Colors.black.withOpacity(
                      0.10,
                    ),

                    blurRadius: 5,

                    offset:
                    const Offset(0, -2),
                  ),
                ],
              ),

              child: const Center(
                child: Text(
                  "© 2026 HireHub • Find your dream job",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(
                      0xFFB8D0DC,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}