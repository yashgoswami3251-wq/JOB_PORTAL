import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_portal/User_side/register_page.dart';

import 'forgot_password.dart';
import 'home_page.dart';

const Color navyColor = Color(0xFF1E2D50);
const Color buttonBlue = Color(0xFF2864E8);
const Color lightGrey = Color(0xFFF8FAFD);
const Color borderColor = Color(0xFFDCE3EE);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: navyColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "HireHub",

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),

      home: const LoginPage(),
    );
  }
}

// ============================================================
// LOGIN PAGE
// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  String selectedRole = "Job Seeker";


  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();


  bool hidePassword = true;


  void changeRole(String role) {
    setState(() {
      selectedRole = role;

      emailController.clear();
      passwordController.clear();
    });
  }


  void login() {

    FocusScope.of(context).unfocus();

    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your email"),
        ),
      );

      return;
    }

    if (passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your password"),
        ),
      );

      return;
    }


    if (selectedRole == "Job Seeker") {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }

    // --------------------------------------------------------
    // EMPLOYER
    // --------------------------------------------------------

    else if (selectedRole == "Employer") {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Employer login successful",
          ),
        ),
      );

      // Later:
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const EmployerHomePage(),
      //   ),
      // );
    }

    // --------------------------------------------------------
    // ADMIN
    // --------------------------------------------------------

    else if (selectedRole == "Admin") {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Admin login successful",
          ),
        ),
      );

      // Later:
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const AdminHomePage(),
      //   ),
      // );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        top: false,
        bottom: false,

        child: Column(
          children: [

            // ==================================================
            // HEADER
            // ==================================================

            Container(
              width: double.infinity,

              color: navyColor,

              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 25,
                bottom: 28,
                left: 20,
                right: 20,
              ),

              child: Column(
                children: [

                  // ==================================================
                  // LOGO
                  // ==================================================

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: const [

                      Icon(
                        Icons.business_center,
                        color: Colors.white,
                        size: 27,
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

                  const SizedBox(height: 18),

                  // ==================================================
                  // HEADER TITLE
                  // ==================================================

                  const Text(
                    "Build Your Career.",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text(
                    "Shape Your Future.",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

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

            // ==================================================
            // CONTENT
            // ==================================================

            Expanded(
              child: Container(
                width: double.infinity,

                color: Colors.white,

                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    20,
                    20,
                    25,
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      // ==================================================
                      // WELCOME
                      // ==================================================

                      const Text(
                        "Welcome back",

                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "Sign in as a $selectedRole",

                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 18),

                      // ==================================================
                      // ROLE SELECTOR
                      // ==================================================

                      Container(
                        width: double.infinity,
                        height: 50,

                        padding:
                        const EdgeInsets.all(3),

                        decoration: BoxDecoration(
                          color: lightGrey,

                          border: Border.all(
                            color: borderColor,
                          ),

                          borderRadius:
                          BorderRadius.circular(8),
                        ),

                        child: Row(
                          children: [

                            // ADMIN
                            _roleButton(
                              title: "Admin",
                              selected:
                              selectedRole == "Admin",

                              onTap: () {
                                changeRole("Admin");
                              },
                            ),

                            // EMPLOYER
                            _roleButton(
                              title: "Employer",
                              selected:
                              selectedRole == "Employer",

                              onTap: () {
                                changeRole("Employer");
                              },
                            ),

                            // JOB SEEKER
                            _roleButton(
                              title: "Job Seeker",
                              selected:
                              selectedRole ==
                                  "Job Seeker",

                              onTap: () {
                                changeRole("Job Seeker");
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 22),

                      // ==================================================
                      // ROLE INFORMATION
                      // ==================================================

                      Container(
                        width: double.infinity,

                        padding:
                        const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFF3F7FF,
                          ),

                          borderRadius:
                          BorderRadius.circular(9),

                          border: Border.all(
                            color: const Color(
                              0xFFDCE8FF,
                            ),
                          ),
                        ),

                        child: Row(
                          children: [

                            Container(
                              width: 38,
                              height: 38,

                              decoration:
                              BoxDecoration(
                                color: Colors.white,

                                borderRadius:
                                BorderRadius
                                    .circular(8),
                              ),

                              child: Icon(
                                selectedRole ==
                                    "Admin"
                                    ? Icons
                                    .admin_panel_settings
                                    : selectedRole ==
                                    "Employer"
                                    ? Icons
                                    .business
                                    : Icons
                                    .person,

                                color: buttonBlue,

                                size: 21,
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,

                                children: [

                                  Text(
                                    "$selectedRole Login",

                                    style:
                                    const TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.bold,
                                      color:
                                      navyColor,
                                    ),
                                  ),

                                  const SizedBox(height: 3),

                                  Text(
                                    _getRoleDescription(),

                                    style:
                                    const TextStyle(
                                      fontSize: 9,
                                      color:
                                      Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ==================================================
                      // EMAIL
                      // ==================================================

                      const Text(
                        "Email Address",

                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 6),

                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: TextField(
                          controller: emailController,
                          keyboardType:
                          TextInputType.emailAddress,
                          style:
                          const TextStyle(
                            fontSize: 13,
                          ),
                          decoration: InputDecoration(
                            hintText: _getEmailHint(),
                            hintStyle:
                            const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),

                            prefixIcon:
                            const Icon(
                              Icons.email_outlined,
                              size: 19,
                              color:
                              Colors.blueGrey,
                            ),

                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10,),

                            border:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(8),

                              borderSide:
                              const BorderSide(
                                color:
                                borderColor,
                              ),
                            ),

                            enabledBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(8),

                              borderSide:
                              const BorderSide(
                                color:
                                borderColor,
                              ),
                            ),

                            focusedBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(8),

                              borderSide:
                              const BorderSide(
                                color:
                                buttonBlue,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 17),

                      // ==================================================
                      // PASSWORD
                      // ==================================================

                      const Text(
                        "Password",

                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 6),

                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: TextField(
                          controller:
                          passwordController,

                          obscureText:
                          hidePassword,

                          obscuringCharacter: "*",

                          style:
                          const TextStyle(
                            fontSize: 13,
                          ),

                          decoration:
                          InputDecoration(

                            hintText:
                            "Enter your password",

                            hintStyle:
                            const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),

                            prefixIcon:
                            const Icon(
                              Icons.lock_outline,
                              size: 19,
                              color:
                              Colors.blueGrey,
                            ),

                            suffixIcon:
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword =
                                  !hidePassword;
                                });
                              },

                              icon: Icon(
                                hidePassword
                                    ? Icons
                                    .visibility_off_outlined
                                    : Icons
                                    .visibility_outlined,

                                size: 19,

                                color:
                                Colors.blueGrey,
                              ),
                            ),

                            contentPadding:
                            const EdgeInsets
                                .symmetric(
                              horizontal: 10,
                            ),

                            border:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(8),

                              borderSide:
                              const BorderSide(
                                color:
                                borderColor,
                              ),
                            ),

                            enabledBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(8),

                              borderSide:
                              const BorderSide(
                                color:
                                borderColor,
                              ),
                            ),

                            focusedBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(8),

                              borderSide:
                              const BorderSide(
                                color:
                                buttonBlue,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 7),

                      // ==================================================
                      // REMEMBER + FORGOT
                      // ==================================================

                      Row(
                        children: [

                          SizedBox(
                            width: 24,
                            height: 24,

                            child: Checkbox(
                              value: false,

                              onChanged:
                                  (value) {},

                              activeColor:
                              buttonBlue,

                              materialTapTargetSize:
                              MaterialTapTargetSize
                                  .shrinkWrap,
                            ),
                          ),

                          const SizedBox(width: 5),

                          const Text(
                            "Keep me signed in",

                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),

                          const Spacer(),

                          GestureDetector(
                            onTap: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                  const ChangePasswordPage(),
                                ),
                              );
                            },

                            child: const Text(
                              "Forgot Password?",

                              style: TextStyle(
                                fontSize: 15,
                                color: buttonBlue,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 17),

                      // ==================================================
                      // LOGIN BUTTON
                      // ==================================================

                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: ElevatedButton(
                          onPressed: login,

                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                            buttonBlue,

                            foregroundColor:
                            Colors.white,

                            elevation: 2,

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(8),
                            ),
                          ),

                          child: Text(
                            "Login as $selectedRole",

                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // ==================================================
                      // REGISTER
                      // ==================================================

                      Center(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,

                          children: [

                            Text(
                              selectedRole ==
                                  "Job Seeker"
                                  ? "Don't have an account? "
                                  : selectedRole ==
                                  "Employer"
                                  ? "Don't have an employer account? "
                                  : "Need admin access? ",

                              style:
                              const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {

                                ScaffoldMessenger
                                    .of(context)
                                    .showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "$selectedRole registration",
                                    ),
                                  ),
                                );
                              },

                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                                },
                                child: const Text(
                                  "Register",

                                  style: TextStyle(
                                    fontSize: 15,
                                    color: buttonBlue,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  // ============================================================
  // ROLE BUTTON
  // ============================================================

  Widget _roleButton({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {

    return Expanded(
      child: GestureDetector(
        onTap: onTap,

        child: Container(
          margin: const EdgeInsets.all(2),

          decoration: BoxDecoration(
            color: selected
                ? buttonBlue
                : Colors.transparent,

            borderRadius:
            BorderRadius.circular(6),
          ),

          child: Center(
            child: Text(
              title,

              style: TextStyle(
                fontSize: 11,

                color: selected
                    ? Colors.white
                    : Colors.black54,

                fontWeight: selected
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ROLE DESCRIPTION
  // ============================================================

  String _getRoleDescription() {

    if (selectedRole == "Admin") {
      return "Manage users, jobs and platform activities.";
    }

    if (selectedRole == "Employer") {
      return "Post jobs and manage your job applications.";
    }

    return "Find jobs, apply and manage your applications.";
  }

  // ============================================================
  // EMAIL HINT
  // ============================================================

  String _getEmailHint() {

    if (selectedRole == "Admin") {
      return "admin@hirehub.com";
    }

    if (selectedRole == "Employer") {
      return "company@hirehub.com";
    }

    return "sureshkumar12@gmail.com";
  }
}

// ============================================================
// TEMPORARY CHANGE PASSWORD PAGE
// ============================================================
// Keep your existing forgot_password.dart page instead.
// This class is only here if you want this file to run alone.
// ============================================================

