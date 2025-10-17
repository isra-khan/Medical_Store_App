import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quickmedicalapp/models/categories.dart';
import 'package:quickmedicalapp/screens/splash/widgets/custom_product_widget.dart';
import 'package:quickmedicalapp/screens/splash/widgets/custom_searchbar.dart';
import 'package:quickmedicalapp/utils/colorconstraint.dart';
import 'package:quickmedicalapp/utils/responsiveness.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController medicineController = TextEditingController();

  HomeScreen({super.key});

  static List<CategoryModel> categoryList = [
    CategoryModel(
      name: "Dental",
      icon: Icons.medical_services,
      color: LinearGradient(
        colors: [Color(0xFFFF70A7), Color(0xFFFF9598)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    CategoryModel(
      name: "Wellness",
      icon: Icons.health_and_safety,
      color: LinearGradient(
        colors: [Color(0xFF19E5A5), Color(0xFF15BD92)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    CategoryModel(
      name: "Homeo",
      icon: Icons.local_hospital,
      color: LinearGradient(
        colors: [Color(0xffFFC06F), Color(0xffFF793A)],
        begin: Alignment.topLeft,
        end: Alignment.topCenter,
      ),
    ),
    CategoryModel(
      name: "Eye care",
      icon: Icons.local_hospital,
      color: LinearGradient(
        colors: [Color(0xff4DB7FF), Color(0xff3E7DFF)],
        begin: Alignment.topLeft,
        end: Alignment.topCenter,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstraint.secondaryColor.withOpacity(0.9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildSearchBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopCategories(),
                    SizedBox(height: Responsive.h(3)),
                    _buildBanner(),
                    SizedBox(height: Responsive.h(3)),
                    _buildDealsHeader(),
                    _buildDealsGrid(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4B6EF6), Color(0xFF4157FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopRow(),
            SizedBox(height: Responsive.h(2)),
            Text(
              "Hi, Isra",
              style: TextStyle(
                color: ColorConstraint.secondaryColor,
                fontSize: Responsive.sp(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Responsive.h(2)),
            Text(
              "Welcome to Quick Medical Store",
              style: TextStyle(
                color: ColorConstraint.secondaryColor,
                fontSize: Responsive.sp(14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        Row(
          children: [
            SvgPicture.asset('assets/icons/notification.svg'),
            SizedBox(width: 8),
            SvgPicture.asset('assets/icons/shopping.svg'),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Transform.translate(
      offset: const Offset(0, -25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomSearchBar(
          controller: medicineController,
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget _buildTopCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Categories',
          style: TextStyle(
            color: ColorConstraint.textColor,
            fontWeight: FontWeight.w600,
            fontSize: Responsive.sp(14),
          ),
        ),
        SizedBox(height: Responsive.h(2)),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              final category = categoryList[index];
              return Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstraint.secondaryColor,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: category.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(height: Responsive.h(1)),
                        Text(
                          category.name,
                          style: TextStyle(
                            color: ColorConstraint.textColor,
                            fontSize: Responsive.sp(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return Image.asset(
      'assets/images/save_banner.png',
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _buildDealsHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Deals of the Day',
          style: TextStyle(
            color: ColorConstraint.lightNavy,
            fontWeight: FontWeight.bold,
            fontSize: Responsive.sp(14),
          ),
        ),
        Text(
          'More',
          style: TextStyle(
            color: ColorConstraint.primaryColor,
            fontSize: Responsive.sp(14),
          ),
        ),
      ],
    );
  }

  Widget _buildDealsGrid() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return CustomProductWidget(
          imagePath: 'assets/images/product.png',
          title: 'Accu-check Active',
          subtitle: 'Test Strip',
          price: 200,
          rating: 5,
        );
      },
    );
  }
}
