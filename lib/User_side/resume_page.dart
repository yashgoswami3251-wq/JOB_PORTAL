import 'package:flutter/material.dart';

import '../references/reference.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});



  static const Color bgColor = Color(0xFFFFFCF7);
  static const Color textColor = Color(0xFF17233B);
  static const Color greyColor = Color(0xFF737B87);
  static const Color buttonColor = Color(0xFF2864E8);
  static const Color borderColor = Color(0xFFE1E5E9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      body: SafeArea(
        child: Column(
          children: [



            Container(
              height: 58,
              width: double.infinity,

              decoration: const BoxDecoration(
                color: bgColor,

                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE3E3E3),
                    width: 1,
                  ),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: Row(
                  children: [


                    InkWell(
                      borderRadius: BorderRadius.circular(20),

                      onTap: () {
                        Navigator.pop(context);
                      },

                      child: const Padding(
                        padding: EdgeInsets.all(5),

                        child: Icon(
                          Icons.arrow_back,
                          size: 22,
                          color: textColor,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      "HireHub",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),



            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    13,
                    16,
                    24,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [



                      const Text(
                        "My Resume",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                          letterSpacing: -0.4,
                        ),
                      ),

                      const SizedBox(height: 15),



                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(10),

                          border: Border.all(
                            color: borderColor,
                            width: 1,
                          ),
                        ),

                        child: Row(
                          children: [



                            Container(
                              width: 40,
                              height: 40,

                              decoration: BoxDecoration(
                                color: const Color(0xFFF0F5FF),
                                borderRadius:
                                BorderRadius.circular(7),
                              ),

                              child: const Icon(
                                Icons.description_outlined,
                                color: Color(0xFF2864E8),
                                size: 20,
                              ),
                            ),

                            const SizedBox(width: 10),



                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  Text(
                                    "Rahul_Sharma_Resume.pdf",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,

                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: textColor,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    "Uploaded 2 weeks ago • 1.2 MB",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: greyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),



                            Container(
                              width: 28,
                              height: 28,

                              decoration: BoxDecoration(
                                color: const Color(0xFFF0F5FF),
                                borderRadius:
                                BorderRadius.circular(6),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 17),



                      Container(
                        width: double.infinity,

                        height: 218,

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(10),

                          border: Border.all(
                            color: const Color(0xFFE0E4E8),
                            width: 1,
                          ),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [



                            SizedBox(
                              width: 40,
                              height: 40,

                              child: Stack(
                                alignment: Alignment.center,

                                children: [

                                  const SizedBox(
                                    width: 38,
                                    height: 38,

                                    child: CircularProgressIndicator(
                                      strokeWidth: 1.5,
                                      value: 0.72,
                                      color: buttonColor,
                                    ),
                                  ),

                                  Container(
                                    width: 28,
                                    height: 28,

                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),

                                    child: const Icon(
                                      Icons.upload_file,
                                      size: 19,
                                      color: buttonColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 10),



                            const Text(
                              "Upload New Resume",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: textColor,
                              ),
                            ),

                            const SizedBox(height: 4),



                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                              ),

                              child: Text(
                                "Drag and drop your resume file here, or click to\nbrowse",
                                textAlign: TextAlign.center,

                                style: TextStyle(
                                  fontSize: 13,
                                  height: 1.4,
                                  color: greyColor,
                                ),
                              ),
                            ),

                            const SizedBox(height: 11),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 108,
                                  height: 35,

                                  child: ElevatedButton(
                                    onPressed: () {

                                    },

                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: blueColor,
                                      foregroundColor: Colors.white,

                                      elevation: 0,

                                      padding: EdgeInsets.zero,

                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(6),
                                      ),
                                    ),

                                    child: const Text(
                                      "Choose File",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                SizedBox(
                                  width: 108,
                                  height: 35,

                                  child: ElevatedButton(
                                    onPressed: () {

                                    },

                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: blueColor,
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(6),
                                      ),
                                    ),

                                    child: const Text(
                                      "Submit Resume",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),



                            const Text(
                              "Supported formats: PDF, DOC, DOCX (Max 5MB)",
                              style: TextStyle(
                                fontSize: 11,
                                color: greyColor,
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
}