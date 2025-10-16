import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

// --- Custom Widget Methods (Sections) ---

Widget _buildHeader(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/rectangle_box.png'),
      ),
      // You might add a custom shape/border radius if needed
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Icons Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              // Replace with a real image asset
            ),
            Row(
              children: const [
                Icon(Icons.person_outline, color: Colors.white, size: 28),
                SizedBox(width: 15),
                Icon(Icons.mail_outline, color: Colors.white, size: 28),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Greetings
        const Text(
          "Hi, Shahzeb",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Text(
          "Welcome to Quick Medical Store",
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        const SizedBox(height: 30),
      ],
    ),
  );
}

Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Search Medicine & Healthcare products",
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(70.0),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _buildCategoryItem(String title, Color color) {
  return Container(
    width: 100, // Fixed width for each category card
    margin: const EdgeInsets.only(right: 15),
    child: Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            // For a gradient look, use:
            // gradient: LinearGradient(
            //   colors: [color, color.withOpacity(0.5)],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    ),
  );
}

Widget _buildTopCategories() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Top Categories",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // You can replace these with a map/list if data is dynamic
              _buildCategoryItem("Dental", Colors.pinkAccent),
              _buildCategoryItem("Wellness", Colors.greenAccent),
              _buildCategoryItem("Homeo", Colors.orangeAccent),
              _buildCategoryItem("Eye care", Colors.blueAccent),
              _buildCategoryItem("First Aid", Colors.redAccent),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildPromoBanner() {
  return Container(
    height: 150,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: Colors.lightBlue[50],
      borderRadius: BorderRadius.circular(15),
      // Use an actual image for the background
      image: const DecorationImage(
        image: AssetImage(
          'assets/banner_placeholder.png',
        ), // Replace with your image asset
        fit: BoxFit.cover,
        alignment: Alignment.centerRight,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Save extra on every order",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "Etiam mollis metus non faucibus.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  );
}

Widget _buildProductCard() {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Placeholder
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            // Use an actual image asset here
          ),
          child: const Center(child: Icon(Icons.medication_liquid, size: 40)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Accu-check Active",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Text(
                "Test Strip",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rs.112",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text("2"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildDealsOfTheDay() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Deals of the Day",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("More", style: TextStyle(color: Colors.purple)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Products Grid
        GridView.builder(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(), // Important for nested scroll views
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.75, // Adjust this to fit the card content
          ),
          itemCount: 4, // Example: 4 products
          itemBuilder: (context, index) {
            return _buildProductCard();
          },
        ),
      ],
    ),
  );
}

// --- Main Screen Widget ---

class MedicalStoreHomeScreen extends StatelessWidget {
  const MedicalStoreHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the height of the purple header part
    double headerHeight = 250;

    return Scaffold(
      backgroundColor: Color(0xffF7FBFF),

      // Custom Bottom Navigation Bar (resembling the image)
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Mail',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            // 1. Purple Header Background
            SizedBox(height: headerHeight, child: _buildHeader(context)),

            // 2. Content (Search Bar and below)
            Padding(
              padding: EdgeInsets.only(
                top: headerHeight - 20,
              ), // Adjust to position search bar slightly over the purple background
              child: Column(
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 10), // Spacing after search bar
                  _buildTopCategories(),
                  _buildPromoBanner(),
                  _buildDealsOfTheDay(),
                  const SizedBox(height: 50), // Extra space at the bottom
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
