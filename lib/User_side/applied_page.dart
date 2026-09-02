
import 'package:flutter/material.dart';

class AppliedPages extends StatefulWidget {
final Map<String, dynamic>? appliedJob;

const AppliedPages({
super.key,
this.appliedJob,
});

@override
State<AppliedPages> createState() => _AppliedPagesState();
}

class _AppliedPagesState extends State<AppliedPages> {
int selectedFilter = 0;

final Color backgroundColor = const Color(0xFFFFFCF7);
final Color navyColor = const Color(0xFF17233B);
final Color blueColor = const Color(0xFF2864E8);
final Color borderColor = const Color(0xFFE1E5EB);

late List<Map<String, dynamic>> applications;

@override
void initState() {
super.initState();

applications = [
{
"shortName": "TCS",
"company": "TCS",
"title": "Senior React Developer",
"date": "Jan 22, 2024",
"status": "Applied",
"companyColor": const Color(0xFF2864E8),
"companyBackground": const Color(0xFFEFF5FF),
"statusColor": const Color(0xFF1D4ED8),
"statusBackground": const Color(0xFFDCEAFF),
},
{
"shortName": "INF",
"company": "Infosys",
"title": "UI/UX Designer",
"date": "Jan 25, 2024",
"status": "Interview Scheduled",
"companyColor": const Color(0xFF8B5CF6),
"companyBackground": const Color(0xFFF3EEFF),
"statusColor": const Color(0xFF008A3E),
"statusBackground": const Color(0xFFDDF8E8),
},
{
"shortName": "WIP",
"company": "Wipro",
"title": "Data Analyst",
"date": "Feb 1, 2024",
"status": "Shortlisted",
"companyColor": const Color(0xFF00A878),
"companyBackground": const Color(0xFFE8F8F3),
"statusColor": const Color(0xFFE77B00),
"statusBackground": const Color(0xFFFFF0BF),
},
{
"shortName": "HCL",
"company": "HCL",
"title": "Backend Developer",
"date": "Feb 5, 2024",
"status": "Applied",
"companyColor": const Color(0xFFFF3B30),
"companyBackground": const Color(0xFFFFEEEE),
"statusColor": const Color(0xFF1D4ED8),
"statusBackground": const Color(0xFFDCEAFF),
},
];

// Add newly applied job at the top
if (widget.appliedJob != null) {
final job = widget.appliedJob!;

applications.insert(
0,
{
"shortName": job["shortName"],
"company": job["company"],
"title": job["title"],
"date": "Today",
"status": "Applied",
"companyColor": job["companyColor"],
"companyBackground": job["companyBackground"],
"statusColor": const Color(0xFF1D4ED8),
"statusBackground": const Color(0xFFDCEAFF),
},
);
}
}

// ============================================================
// FILTER
// ============================================================

List<Map<String, dynamic>> get filteredApplications {
if (selectedFilter == 0) {
return applications;
}

if (selectedFilter == 1) {
return applications
    .where(
(application) =>
application["status"] == "Applied",
)
    .toList();
}

if (selectedFilter == 2) {
return applications
    .where(
(application) =>
application["status"] == "Interview Scheduled",
)
    .toList();
}

if (selectedFilter == 3) {
return applications
    .where(
(application) =>
application["status"] == "Shortlisted",
)
    .toList();
}

return applications;
}

// ============================================================
// BUILD
// ============================================================

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: backgroundColor,

// ==========================================================
// IMPORTANT:
// There is NO bottomNavigationBar here.
//
// HomePage owns the navigation.
// ==========================================================

body: SafeArea(
child: Column(
children: [

// ====================================================
// HEADER
// ====================================================

Container(
height: 64,

padding: const EdgeInsets.symmetric(
horizontal: 20,
),

decoration: const BoxDecoration(
color: Color(0xFFFFFCF7),

border: Border(
bottom: BorderSide(
color: Color(0xFFE8E8E8),
),
),
),

child: Row(
children: [

const Text(
"My Applications",

style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
color: Color(0xFF17233B),
),
),

const Spacer(),

Container(
width: 36,
height: 36,

decoration: const BoxDecoration(
color: Color(0xFF3D687A),
shape: BoxShape.circle,
),

child: const Center(
child: Text(
"RS",

style: TextStyle(
color: Colors.white,
fontSize: 12,
fontWeight: FontWeight.bold,
),
),
),
),
],
),
),

// ====================================================
// CONTENT
// ====================================================

Expanded(
child: SingleChildScrollView(
physics: const BouncingScrollPhysics(),

padding: const EdgeInsets.fromLTRB(
18,
18,
18,
25,
),

child: Column(
crossAxisAlignment: CrossAxisAlignment.start,

children: [

// =================================================
// FILTER BUTTONS
// =================================================

SingleChildScrollView(
scrollDirection: Axis.horizontal,

child: Row(
children: [

_filterButton(
title: "All",
index: 0,
),

const SizedBox(width: 8),

_filterButton(
title: "Applied",
index: 1,
),

const SizedBox(width: 8),

_filterButton(
title: "Interview",
index: 2,
),

const SizedBox(width: 8),

_filterButton(
title: "Shortlisted",
index: 3,
),
],
),
),

const SizedBox(height: 20),

// =================================================
// APPLICATION LIST
// =================================================

if (filteredApplications.isEmpty)
_emptyWidget()
else
Column(
children: List.generate(
filteredApplications.length,
(index) {
final application =
filteredApplications[index];

return Padding(
padding:
const EdgeInsets.only(
bottom: 13,
),

child: _applicationCard(
application: application,
),
);
},
),
),

const SizedBox(height: 20),

// =================================================
// VIEW ALL
// =================================================

Center(
child: GestureDetector(
onTap: () {
setState(() {
selectedFilter = 0;
});
},

child: const Text(
"View All Applications →",

style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.w600,
color: Color(0xFF2864E8),
),
),
),
),
],
),
),
),
],
),
),
);
}

// ============================================================
// FILTER BUTTON
// ============================================================

Widget _filterButton({
required String title,
required int index,
}) {
final bool selected = selectedFilter == index;

return GestureDetector(
onTap: () {
setState(() {
selectedFilter = index;
});
},

child: Container(
height: 40,

padding: const EdgeInsets.symmetric(
horizontal: 16,
),

decoration: BoxDecoration(
color: selected
? blueColor
    : Colors.white,

border: Border.all(
color: selected
? blueColor
    : const Color(0xFFDDE1E7),
),

borderRadius: BorderRadius.circular(22),
),

child: Center(
child: Text(
title,

style: TextStyle(
fontSize: 14,

fontWeight: selected
? FontWeight.w600
    : FontWeight.w500,

color: selected
? Colors.white
    : const Color(0xFF687386),
),
),
),
),
);
}

// ============================================================
// APPLICATION CARD
// ============================================================

Widget _applicationCard({
required Map<String, dynamic> application,
}) {
return Container(
width: double.infinity,

padding: const EdgeInsets.all(18),

decoration: BoxDecoration(
color: Colors.white,

border: Border.all(
color: borderColor,
),

borderRadius: BorderRadius.circular(14),

boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.03),
blurRadius: 4,
offset: const Offset(0, 2),
),
],
),

child: Row(
crossAxisAlignment: CrossAxisAlignment.center,

children: [

// ======================================================
// COMPANY
// ======================================================

Container(
width: 52,
height: 52,

decoration: BoxDecoration(
color: application["companyBackground"],

borderRadius: BorderRadius.circular(10),
),

child: Center(
child: Text(
application["shortName"],

style: TextStyle(
color: application["companyColor"],
fontSize: 16,
fontWeight: FontWeight.bold,
),
),
),
),

const SizedBox(width: 14),

// ======================================================
// JOB DETAILS
// ======================================================

Expanded(
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,

children: [

Text(
application["title"],

maxLines: 1,

overflow: TextOverflow.ellipsis,

style: const TextStyle(
fontSize: 17,
fontWeight: FontWeight.bold,
color: Color(0xFF17233B),
),
),

const SizedBox(height: 5),

Text(
"${application["company"]} • Applied ${application["date"]}",

maxLines: 1,

overflow: TextOverflow.ellipsis,

style: const TextStyle(
fontSize: 14,
color: Color(0xFF7B808A),
),
),
],
),
),

const SizedBox(width: 8),

// ======================================================
// STATUS
// ======================================================

Container(
padding: const EdgeInsets.symmetric(
horizontal: 11,
vertical: 8,
),

decoration: BoxDecoration(
color: application["statusBackground"],

borderRadius: BorderRadius.circular(5),
),

child: Text(
application["status"],

style: TextStyle(
fontSize: 12,
fontWeight: FontWeight.w600,
color: application["statusColor"],
),
),
),
],
),
);
}

// ============================================================
// EMPTY
// ============================================================

Widget _emptyWidget() {
return Container(
width: double.infinity,

padding: const EdgeInsets.symmetric(
vertical: 60,
),

child: Column(
children: [

Icon(
Icons.work_outline,
size: 55,
color: Colors.grey.shade400,
),

const SizedBox(height: 15),

const Text(
"No Applications Found",

style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
color: Color(0xFF17233B),
),
),
],
),
);
}
}
/*
```

### ⚠️ One change is still required in `HomePage`

The above `AppliedPages` is intentionally **without any footer**.

Your HomePage should contain:

```dart
IndexedStack(
index: selectedIndex,
children: [
_buildHomePage(),
const findjobes(),
const AppliedPages(),
const SavedPage(),
const ProfilePage(),
],
)
```

and your existing footer:

```dart
void _onBottomItemTap(int index) {
setState(() {
selectedIndex = index;
});
}
```

Then **do not do this from Job Details**:

```dart
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => const AppliedPages(),
),
);
```

because that creates the second page/navigation stack.

Instead, **HomePage should remain the parent**, and `AppliedPages` should simply be the third child (`index 2`) of your existing navigation.

So the final result is:

**Home → Applied**

```text
┌─────────────────────────┐
│   My Applications       │
│                         │
│   Applied Jobs...       │
│                         │
│                         │
├─────────────────────────┤
│ Home Find Applied ...   │ ← YOUR ONE EXISTING FOOTER
└─────────────────────────┘
```

No second footer, no double navigation, and your existing HomePage navigation remains the only navigation.
*/
