import 'package:flutter/material.dart';

class JobDetailsPage extends StatefulWidget {
  final Map<String, dynamic> job;

  const JobDetailsPage({
    super.key,
    required this.job,
  });

  @override
  State<JobDetailsPage> createState() =>
      _JobDetailsPageState();
}

class _JobDetailsPageState
    extends State<JobDetailsPage> {

  bool isSaved = false;

  final Color backgroundColor =
  const Color(0xFFFFFCF7);

  final Color navyColor =
  const Color(0xFF17233B);

  final Color blueColor =
  const Color(0xFF2864E8);

  final Color borderColor =
  const Color(0xFFE1E5EB);

  @override
  Widget build(BuildContext context) {

    final job = widget.job;

    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: Column(
          children: [

            // =====================================================
            // TOP BAR
            // =====================================================

            Container(
              height: 68,

              padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              decoration:
              const BoxDecoration(
                color:
                Color(0xFFFFFCF7),

                border: Border(
                  bottom: BorderSide(
                    color:
                    Color(0xFFE8E8E8),
                  ),
                ),
              ),

              child: Row(
                children: [

                  // BACK BUTTON
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Row(
                      children: const [

                        Icon(
                          Icons.arrow_back,
                          color:
                          Color(0xFF2864E8),
                          size: 22,
                        ),

                        SizedBox(width: 7),

                        Text(
                          "Back",

                          style: TextStyle(
                            color:
                            Color(0xFF2864E8),

                            fontSize: 16,

                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // PROFILE
                  Container(
                    width: 36,
                    height: 36,

                    decoration:
                    const BoxDecoration(
                      color:
                      Color(0xFF3D687A),
                      shape:
                      BoxShape.circle,
                    ),

                    child: const Center(
                      child: Text(
                        "RS",

                        style: TextStyle(
                          color:
                          Colors.white,

                          fontSize: 12,

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =====================================================
            // PAGE CONTENT
            // =====================================================

            Expanded(
              child:
              SingleChildScrollView(
                physics:
                const BouncingScrollPhysics(),

                padding:
                const EdgeInsets.fromLTRB(
                  18,
                  18,
                  18,
                  35,
                ),

                child: Container(
                  width: double.infinity,

                  padding:
                  const EdgeInsets.all(22),

                  decoration:
                  BoxDecoration(
                    color: Colors.white,

                    border: Border.all(
                      color: borderColor,
                    ),

                    borderRadius:
                    BorderRadius.circular(14),
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      // =================================================
                      // COMPANY + JOB TITLE
                      // =================================================

                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Container(
                            width: 52,
                            height: 52,

                            decoration:
                            BoxDecoration(
                              color:
                              job["companyBackground"],

                              borderRadius:
                              BorderRadius
                                  .circular(10),
                            ),

                            child: Center(
                              child: Text(
                                job["shortName"],

                                style:
                                TextStyle(
                                  color:
                                  job["companyColor"],

                                  fontSize: 16,

                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 16,
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                Text(
                                  job["title"],

                                  style:
                                  const TextStyle(
                                    fontSize: 22,

                                    fontWeight:
                                    FontWeight.bold,

                                    color:
                                    Color(
                                      0xFF17233B,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 5,
                                ),

                                Text(
                                  "${job["company"]} • ${job["location"]}",

                                  style:
                                  const TextStyle(
                                    fontSize: 15,

                                    color:
                                    Color(
                                      0xFF7B808A,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      // =================================================
                      // BUTTONS
                      // =================================================

                      Row(
                        children: [

                          Expanded(
                            child:
                            SizedBox(
                              height: 50,

                              child:
                              ElevatedButton(
                                onPressed: () {

                                  // Apply action
                                  ScaffoldMessenger
                                      .of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Application started!",
                                      ),
                                    ),
                                  );
                                },

                                style:
                                ElevatedButton
                                    .styleFrom(
                                  backgroundColor:
                                  blueColor,

                                  foregroundColor:
                                  Colors.white,

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
                                  "Apply Now",

                                  style:
                                  TextStyle(
                                    fontSize: 16,

                                    fontWeight:
                                    FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 14,
                          ),

                          Expanded(
                            child:
                            SizedBox(
                              height: 50,

                              child:
                              OutlinedButton(
                                onPressed: () {

                                  setState(() {
                                    isSaved =
                                    !isSaved;
                                  });
                                },

                                style:
                                OutlinedButton
                                    .styleFrom(
                                  foregroundColor:
                                  navyColor,

                                  side:
                                  const BorderSide(
                                    color:
                                    Color(
                                      0xFFDDE1E7,
                                    ),
                                  ),

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
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,

                                  children: [

                                    Icon(
                                      isSaved
                                          ? Icons
                                          .bookmark
                                          : Icons
                                          .bookmark_border,

                                      size: 19,
                                    ),

                                    const SizedBox(
                                      width: 6,
                                    ),

                                    Text(
                                      isSaved
                                          ? "Saved"
                                          : "Save Job",

                                      style:
                                      const TextStyle(
                                        fontSize: 16,

                                        fontWeight:
                                        FontWeight.w600,

                                        color:
                                        Color(
                                          0xFF687386,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 22,
                      ),

                      // =================================================
                      // DIVIDER
                      // =================================================

                      Divider(
                        color: borderColor,
                        height: 1,
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      // =================================================
                      // JOB INFORMATION
                      // =================================================

                      Row(
                        children: [

                          Expanded(
                            child:
                            _infoItem(
                              title: "Salary",
                              value:
                              job["salary"],
                            ),
                          ),

                          Expanded(
                            child:
                            _infoItem(
                              title: "Job Type",
                              value:
                              job["type"],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [

                          Expanded(
                            child:
                            _infoItem(
                              title:
                              "Experience",
                              value:
                              job["experience"],
                            ),
                          ),

                          Expanded(
                            child:
                            _infoItem(
                              title:
                              "Posted Date",
                              value:
                              job["postedDate"],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      Divider(
                        color: borderColor,
                        height: 1,
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      // =================================================
                      // JOB DESCRIPTION
                      // =================================================

                      _sectionTitle(
                        "Job Description",
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        job["description"],

                        style:
                        const TextStyle(
                          fontSize: 16,

                          height: 1.5,

                          color:
                          Color(0xFF17233B),
                        ),
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      // =================================================
                      // RESPONSIBILITIES
                      // =================================================

                      _sectionTitle(
                        "Key Responsibilities",
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      ...List.generate(
                        job["responsibilities"]
                            .length,

                            (index) {

                          return Padding(
                            padding:
                            const EdgeInsets
                                .only(
                              bottom: 8,
                            ),

                            child: Text(
                              "• ${job["responsibilities"][index]}",

                              style:
                              const TextStyle(
                                fontSize: 16,

                                height: 1.45,

                                color:
                                Color(
                                  0xFF17233B,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(
                        height: 18,
                      ),

                      // =================================================
                      // REQUIREMENTS
                      // =================================================

                      _sectionTitle(
                        "Job Requirements",
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      ...List.generate(
                        job["requirements"]
                            .length,

                            (index) {

                          return Padding(
                            padding:
                            const EdgeInsets
                                .only(
                              bottom: 8,
                            ),

                            child: Text(
                              "• ${job["requirements"][index]}",

                              style:
                              const TextStyle(
                                fontSize: 16,

                                height: 1.45,

                                color:
                                Color(
                                  0xFF17233B,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      // =================================================
                      // BOTTOM APPLY BUTTON
                      // =================================================

                      SizedBox(
                        width: double.infinity,
                        height: 52,

                        child:
                        ElevatedButton(
                          onPressed: () {

                            ScaffoldMessenger
                                .of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Application started!",
                                ),
                              ),
                            );
                          },

                          style:
                          ElevatedButton
                              .styleFrom(
                            backgroundColor:
                            blueColor,

                            foregroundColor:
                            Colors.white,

                            elevation: 0,

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                10,
                              ),
                            ),
                          ),

                          child:
                          const Text(
                            "Apply Now",

                            style:
                            TextStyle(
                              fontSize: 17,

                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
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
  // INFO ITEM
  // ============================================================

  Widget _infoItem({
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          title,

          style:
          const TextStyle(
            fontSize: 13,

            color:
            Color(0xFF7B808A),
          ),
        ),

        const SizedBox(
          height: 4,
        ),

        Text(
          value,

          style:
          const TextStyle(
            fontSize: 16,

            fontWeight:
            FontWeight.w600,

            color:
            Color(0xFF17233B),
          ),
        ),
      ],
    );
  }


  Widget _sectionTitle(
      String title,
      ) {
    return Text(
      title,

      style:
      const TextStyle(
        fontSize: 17,

        fontWeight:
        FontWeight.bold,

        color:
        Color(0xFF17233B),
      ),
    );
  }
}