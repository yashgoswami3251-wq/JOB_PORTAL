import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        top: 45,
        left: 18,
        right: 18,
        bottom: 20,
      ),
      child: Column(
        children: [

          /// Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// Logo
              Image.asset(
                "assets/images/logo.png",
                height: 80,width: 120,
              ),

              /// Notification
              Stack(
                children: [
                  const Icon(
                    Icons.notifications_none,
                    size: 26,
                    color: Colors.black87,
                  ),
                  Positioned(
                    right: 3,
                    top: 3,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(height: 1,color: Colors.grey.shade300,),
          /// Greeting + Profile
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                /// Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      Text(
                        "Good Morning 👋",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Yashgiri Gauswami",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Profile Image
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F4FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      "assets/images/profile.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          /// Search Box
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xffF5F7FA),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: "Search jobs, companies...",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
      Container(
        height: 220,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff2F6BFF),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            /// Left Side Text
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                top: 20,
                right: 120,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "50,000+ Jobs Available",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Find your dream career\npath with top global\nemployers today.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    width: 140,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xff2F6BFF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: InkWell(
                        onTap: (){

                        },
                        child: const Text(
                          "Explore Jobs",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Right Side Image
            Positioned(
              right: 0,
              bottom: 0,
              top: 10,
              child: Image.asset(
                "assets/images/person.png",
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Popular Categories",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                    color: Color(0xff2F6BFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 115,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              CategoryCard(
                icon: Icons.computer,
                iconColor: Colors.blue,
                title: "IT",
              ),
              SizedBox(width: 14),
              CategoryCard(
                icon: Icons.palette_outlined,
                iconColor: Colors.blue,
                title: "Design",
              ),
              SizedBox(width: 14),
              CategoryCard(
                icon: Icons.trending_up,
                iconColor: Colors.purple,
                title: "Marketing",
              ),
              SizedBox(width: 14),
              CategoryCard(
                icon: Icons.account_balance,
                iconColor: Colors.orange,
                title: "Finance",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
