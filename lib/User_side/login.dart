import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_portal/User_side/register_page.dart';
import 'package:job_portal/User_side/splashscreen.dart';

import '../Admin_side/AdminHomePage.dart';
import '../Employe_side/homepage.dart';
import '../references/reference.dart';
import 'forgot_password.dart';
import 'home_page.dart';


// ============================================================
// MAIN
// ============================================================

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
      statusBarColor: navyColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(ProviderScope(child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen())));
}

// ============================================================
// MY APP
// ============================================================

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
  // ==========================================================
  // SELECTED ROLE
  // ==========================================================

  String selectedRole = "User";

  // ==========================================================
  // CONTROLLERS
  // ==========================================================

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  // ==========================================================
  // VARIABLES
  // ==========================================================

  bool hidePassword = true;

  bool keepSignedIn = false;

  bool isLoading = false;

  // ==========================================================
  // CHANGE ROLE
  // ==========================================================

  void changeRole(String role) {
    setState(() {
      selectedRole = role;

      emailController.clear();
      passwordController.clear();
    });
  }

  // ==========================================================
  // LOGIN
  // ==========================================================

  void login() {
    FocusScope.of(context).unfocus();

    // --------------------------------------------------------
    // EMAIL VALIDATION
    // --------------------------------------------------------

    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your email"),
        ),
      );

      return;
    }

    // --------------------------------------------------------
    // PASSWORD VALIDATION
    // --------------------------------------------------------

    if (passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your password"),
        ),
      );

      return;
    }

    // --------------------------------------------------------
    // SHOW LOADING
    // --------------------------------------------------------

    setState(() {
      isLoading = true;
    });

    // Small delay to simulate login process
    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // ======================================================
      // USER LOGIN
      // ======================================================

      if (selectedRole == "User") {
        if (email == "marmik@gmail.com" &&
            password == "123456") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else {
          _showLoginError(
            "Invalid User email or password",
          );
        }
      }

      // ======================================================
      // EMPLOYEE LOGIN
      // ======================================================

      else if (selectedRole == "Employee") {
        if (email == "yash@gmail.com" &&
            password == "123456") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const EmployeeHomePage(),
            ),
          );
        } else {
          _showLoginError(
            "Invalid Employee email or password",
          );
        }
      }

      // ======================================================
      // ADMIN LOGIN
      // ======================================================

      else if (selectedRole == "Admin") {
        if (email == "pritesh@gmail.com" &&
            password == "123456") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminDashboard(),
            ),
          );
        } else {
          _showLoginError(
            "Invalid Admin email or password",
          );
        }
      }
    });
  }

  // ==========================================================
  // LOGIN ERROR
  // ==========================================================

  void _showLoginError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  // ==========================================================
  // DISPOSE
  // ==========================================================

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
                top: MediaQuery.of(context).padding.top + 18,
                bottom: 22,
                left: 20,
                right: 20,
              ),

              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 200,
                        alignment: AlignmentGeometry.topCenter,
                      )
                    ],
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

                            // EMPLOYEE
                            _roleButton(
                              title: "Employee",
                              selected:
                              selectedRole == "Employee",

                              onTap: () {
                                changeRole("Employee");
                              },
                            ),

                            // USER
                            _roleButton(
                              title: "User",
                              selected:
                              selectedRole == "User",

                              onTap: () {
                                changeRole("User");
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

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
                          controller:
                          emailController,

                          keyboardType:
                          TextInputType.emailAddress,

                          style:
                          const TextStyle(
                            fontSize: 13,
                          ),

                          decoration:
                          InputDecoration(
                            hintText:
                            _getEmailHint(),

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
                               BorderSide(
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
                               BorderSide(
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
                               BorderSide(
                                color:
                                blueColor,
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
                               BorderSide(
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
                               BorderSide(
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
                               BorderSide(
                                color:
                                blueColor,
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


                          const SizedBox(width: 5),

                          const Spacer(),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const ChangePasswordPage(),
                                ),
                              );
                            },

                            child:  Text(
                              "Forgot Password?",

                              style: TextStyle(
                                fontSize: 15,
                                color: blueColor,
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
                          onPressed:
                          isLoading ? null : login,

                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                            blueColor,

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

                          child: isLoading
                              ? const SizedBox(
                            width: 22,
                            height: 22,
                            child:
                            CircularProgressIndicator(
                              strokeWidth: 2,
                              color:
                              Colors.white,
                            ),
                          )
                              : Text(
                            "Login as $selectedRole",

                            style:
                            const TextStyle(
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
                              selectedRole == "User"
                                  ? "Don't have an account? "
                                  : selectedRole ==
                                  "Employee"
                                  ? "Don't have an employee account? "
                                  : "Need admin access? ",

                              style:
                              const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                if (selectedRole ==
                                    "User") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                      const RegisterApp(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(
                                      context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "$selectedRole registration is managed by Admin",
                                      ),
                                    ),
                                  );
                                }
                              },

                              child:  Text(
                                "Register",

                                style: TextStyle(
                                  fontSize: 15,
                                  color: blueColor,
                                  fontWeight:
                                  FontWeight.bold,
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
                ? blueColor
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
  // EMAIL HINT
  // ============================================================

  String _getEmailHint() {
    if (selectedRole == "Admin") {
      return "Admin@gmail.com";
    }

    if (selectedRole == "Employee") {
      return "Employee@hirehub.com";
    }

    return "User@gmail.com";
  }
}


// ============================================================
// ADMIN CARD
// ============================================================

Widget _adminCard({
  required IconData icon,
  required String title,
  required String value,
}) {
  return Container(
    padding: const EdgeInsets.all(16),

    decoration: BoxDecoration(
      color: Colors.white,

      borderRadius:
      BorderRadius.circular(12),

      border: Border.all(
        color: borderColor,
      ),
    ),

    child: Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Icon(
          icon,
          color: blueColor,
          size: 28,
        ),

        const SizedBox(height: 12),

        Text(
          value,
          style:  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: navyColor,
          ),
        ),

        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

// ============================================================
// EMPLOYEE CARD
// ============================================================

Widget _employeeCard({
  required IconData icon,
  required String title,
  required String value,
}) {
  return Container(
    padding: const EdgeInsets.all(16),

    decoration: BoxDecoration(
      color: Colors.white,

      borderRadius:
      BorderRadius.circular(12),

      border: Border.all(
        color: borderColor,
      ),
    ),

    child: Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Icon(
          icon,
          color: blueColor,
          size: 28,
        ),

        const SizedBox(height: 12),

        Text(
          value,
          style:  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: navyColor,
          ),
        ),

        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

// ============================================================
// PANEL OPTION
// ============================================================

Widget _panelOption({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Container(
    width: double.infinity,

    margin: const EdgeInsets.only(
      bottom: 12,
    ),

    padding: const EdgeInsets.all(15),

    decoration: BoxDecoration(
      color: Colors.white,

      borderRadius:
      BorderRadius.circular(12),

      border: Border.all(
        color: borderColor,
      ),
    ),

    child: Row(
      children: [

        Container(
          width: 45,
          height: 45,

          decoration: BoxDecoration(
            color: const Color(
              0xFFF3F7FF,
            ),

            borderRadius:
            BorderRadius.circular(10),
          ),

          child: Icon(
            icon,
            color: blueColor,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                title,
                style:  TextStyle(
                  fontSize: 15,
                  fontWeight:
                  FontWeight.bold,
                  color: navyColor,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
      ],
    ),
  );
}

// ============================================================
// LOGOUT
// ============================================================

void _logout(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,

    MaterialPageRoute(
      builder: (context) =>
      const LoginPage(),
    ),

        (route) => false,
  );
}