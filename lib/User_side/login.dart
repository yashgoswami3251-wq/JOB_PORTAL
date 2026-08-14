import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

// ============================================================
// APP
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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IMPORTANT:
      // White background means no blue strip
      // at bottom or around the form.
      backgroundColor: Colors.white,

      body: SafeArea(
        top: false,
        bottom: false,

        child: Column(
          children: [

            // ====================================================
            // HEADER
            // ====================================================

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
                  // TITLE
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

            // ====================================================
            // WHITE CONTENT
            // ====================================================

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

                      const Text(
                        "Select your role and sign in to your account",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 18),

                      Container(
                        width: double.infinity,
                        height: 46,

                        padding: const EdgeInsets.all(3),

                        decoration: BoxDecoration(
                          color: lightGrey,

                          border: Border.all(
                            color: borderColor,
                          ),

                          borderRadius:
                          BorderRadius.circular(8),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(onPressed: (){

                            }, child: Center(child: Text("Admin",style: TextStyle(color: Colors.grey.shade600,fontSize: 15),))),SizedBox(width: 10,),
                            TextButton(onPressed: (){

                            }, child: Center(child: Text("Employer",style: TextStyle(color: Colors.grey.shade600,fontSize: 15)))),SizedBox(width: 10,),
                            TextButton(onPressed: (){

                            }, child: Center(child: Text("Job Seeker",style: TextStyle(color: Colors.grey.shade600,fontSize: 15)))),SizedBox(width: 10,),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

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
                          keyboardType:
                          TextInputType.emailAddress,

                          style: const TextStyle(
                            fontSize: 13,
                          ),

                          decoration:
                          InputDecoration(
                            hintText:
                            "sureshkumar12@gmail.com",

                            hintStyle:
                            const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),

                            prefixIcon:
                            const Icon(
                              Icons.email_outlined,
                              size: 19,
                              color: Colors.blueGrey,
                            ),

                            contentPadding:
                            const EdgeInsets
                                .symmetric(
                              horizontal: 10,
                            ),

                            border:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(8),

                              borderSide:
                              const BorderSide(
                                color: borderColor,
                              ),
                            ),

                            enabledBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(8),

                              borderSide:
                              const BorderSide(
                                color: borderColor,
                              ),
                            ),

                            focusedBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(8),

                              borderSide:
                              const BorderSide(
                                color: buttonBlue,
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
                          obscureText: true,
                          obscuringCharacter: "*",

                          style: const TextStyle(
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
                              color: Colors.blueGrey,
                            ),

                            suffixIcon:
                            const Icon(
                              Icons
                                  .visibility_off_outlined,
                              size: 19,
                              color: Colors.blueGrey,
                            ),

                            contentPadding:
                            const EdgeInsets
                                .symmetric(
                              horizontal: 10,
                            ),

                            border:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(8),

                              borderSide:
                              const BorderSide(
                                color: borderColor,
                              ),
                            ),

                            enabledBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(8),

                              borderSide:
                              const BorderSide(
                                color: borderColor,
                              ),
                            ),

                            focusedBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(8),

                              borderSide:
                              const BorderSide(
                                color: buttonBlue,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 7),

                      // ==================================================
                      // REMEMBER ME + FORGOT
                      // ==================================================

                      Row(
                        children: [

                          SizedBox(
                            width: 24,
                            height: 24,

                            child: Checkbox(
                              value: false,

                              onChanged: (value) {},

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
                            onTap: () {},

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

                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                          },

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
                              BorderRadius.circular(8),
                            ),
                          ),

                          child: const Text(
                            "Login to Account",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      Center(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,

                          children: [

                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {},

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

  Widget _roleButton(
      String title,
      bool selected,
      ) {
    return Expanded(
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
    );
  }
}