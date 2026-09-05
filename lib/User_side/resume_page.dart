import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  // ============================================================
  // COLORS
  // ============================================================

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

            // ======================================================
            // HEADER
            // ======================================================

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

                    // BACK BUTTON
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

            // ======================================================
            // CONTENT
            // ======================================================

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

                      // ==================================================
                      // TITLE
                      // ==================================================

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

                      // ==================================================
                      // CURRENT RESUME
                      // ==================================================

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

                            // PDF ICON

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

                            // FILE INFORMATION

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

                            // FILE PREVIEW BOX

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

                      // ==================================================
                      // UPLOAD NEW RESUME
                      // ==================================================

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

                            // ==================================================
                            // UPLOAD ICON
                            // ==================================================

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

                            // ==================================================
                            // TITLE
                            // ==================================================

                            const Text(
                              "Upload New Resume",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: textColor,
                              ),
                            ),

                            const SizedBox(height: 4),

                            // ==================================================
                            // DESCRIPTION
                            // ==================================================

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

                            // ==================================================
                            // CHOOSE FILE BUTTON
                            // ==================================================

                            SizedBox(
                              width: 108,
                              height: 35,

                              child: ElevatedButton(
                                onPressed: () {
                                  // Add file picker here
                                },

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonColor,
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

                            const SizedBox(height: 10),

                            // ==================================================
                            // SUPPORTED FORMATS
                            // ==================================================

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