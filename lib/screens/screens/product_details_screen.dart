import 'package:flutter/material.dart';
import 'package:quickmedicalapp/utils/colorconstraint.dart';
import 'package:quickmedicalapp/utils/responsiveness.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var imgList = [
    'assets/images/product.png',
    'assets/images/product_2.png',
    'assets/images/product.png',
  ];

  int _currentIndex = 0;
  int _selectedPackageIndex = 0;

  final List<Map<String, String>> _packageSizes = [
    {'price': 'Rs.106', 'pellets': '500 pellets'},
    {'price': 'Rs.166', 'pellets': '110 pellets'},
    {'price': 'Rs.252', 'pellets': '300 pellets'},
  ];

  Widget _buildPackageSizeOption(String price, String pellets, int index) {
    bool isSelected = _selectedPackageIndex == index;
    Color highlightColor = ColorConstraint.orangeColor;

    final Color lightHighlightColor = ColorConstraint.orangeColor.withOpacity(
      0.2,
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPackageIndex = index;
        });
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? lightHighlightColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? highlightColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? highlightColor : Colors.black,
              ),
            ),
            Text(
              pellets,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? highlightColor : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> _ratingDistribution = [
    {'stars': 5, 'percentage': 67, 'color': Colors.indigo},
    {'stars': 4, 'percentage': 20, 'color': Colors.indigo},
    {'stars': 3, 'percentage': 7, 'color': Colors.grey},
    {'stars': 2, 'percentage': 4, 'color': Colors.grey},
    {'stars': 1, 'percentage': 2, 'color': Colors.indigo},
  ];

  Widget _buildRatingSection() {
    const double overallRating = 4.4;
    const int totalRatings = 923;
    const int totalReviews = 257;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      overallRating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, color: Colors.amber, size: 40),
                  ],
                ),
                Text(
                  '$totalRatings Ratings\nand $totalReviews Reviews',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(width: 20),

            // Right Column: Rating Distribution Bar Chart
            Expanded(
              child: Column(
                children: _ratingDistribution
                    .map((data) {
                      // Reversing the list to display 5-star at the top
                      return _buildRatingBarRow(
                        data['stars'] as int,
                        data['percentage'] as int,
                        data['color'] as Color,
                      );
                    })
                    .toList()
                    .reversed
                    .toList(),
              ),
            ),
          ],
        ),

        // 2. FIRST REVIEW SECTION
        const SizedBox(height: 30),
        _buildReviewTile(
          rating: 4.2,
          name: 'Erric Hoffman',
          date: '05- Oct 2020',
          review:
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a.',
        ),
      ],
    );
  }

  Widget _buildRatingBarRow(int stars, int percentage, Color barColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Row(
            children: [
              Text(
                stars.toString(),
                style: TextStyle(
                  fontSize: Responsive.sp(14),
                  color: Color(0xff090F47).withOpacity(0.45),
                ),
              ),
              const SizedBox(width: 3),
              const Icon(Icons.star, color: Colors.amber, size: 16),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: percentage / 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: barColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 35,
            child: Text(
              '$percentage%',
              style: TextStyle(
                fontSize: Responsive.sp(14),
                color: Color(0xff090F47).withOpacity(0.45),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewTile({
    required double rating,
    required String name,
    required String date,
    required String review,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(
                  rating.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: Responsive.sp(14),
                    color: Color(0xff090F47),
                  ),
                ),
              ],
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: Responsive.sp(14),
                color: Color(0xff090F47),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(
            fontSize: Responsive.sp(14),
            color: Color(0xff090F47),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          review,
          style: TextStyle(
            fontSize: Responsive.sp(14),
            color: Color(0xff090F47).withOpacity(0.45),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16), // Top spacing

              Text(
                'Sugar Free Gold Low Calories',
                style: TextStyle(
                  color: ColorConstraint.lightNavy,
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.sp(24),
                ),
              ),
              Text(
                "Etiam mollis metus non purus ",
                style: TextStyle(
                  color: Color(0xff090F47).withOpacity(0.2),

                  fontSize: Responsive.sp(14),
                ),
              ),
              SizedBox(height: Responsive.h(2)),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imgList
                      .map(
                        (item) => Center(
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = entry.key;
                      });
                    },
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == entry.key
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Rs.99', // Old price
                            style: TextStyle(
                              fontSize: Responsive.sp(18),
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              decoration:
                                  TextDecoration.lineThrough, // Strikethrough
                            ),
                          ),
                          SizedBox(width: Responsive.w(2)),
                          Text(
                            'Rs.56', // New price
                            style: TextStyle(
                              fontSize: Responsive.sp(18),
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Etiam mollis',
                        style: TextStyle(
                          fontSize: Responsive.sp(14),
                          color: ColorConstraint.lightNavy.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/add.svg'),
                      SizedBox(width: Responsive.w(2)),
                      Text(
                        'Add to cart',
                        style: TextStyle(
                          color: ColorConstraint.primaryColor,
                          fontSize: Responsive.sp(14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Responsive.h(4)),
              Text(
                'Package size',
                style: TextStyle(
                  fontSize: Responsive.sp(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Responsive.h(2)),
              Row(
                children: [
                  _buildPackageSizeOption(
                    _packageSizes[0]['price']!,
                    _packageSizes[0]['pellets']!,
                    0,
                  ),
                  const SizedBox(width: 10),
                  _buildPackageSizeOption(
                    _packageSizes[1]['price']!,
                    _packageSizes[1]['pellets']!,
                    1,
                  ),
                  const SizedBox(width: 10),
                  _buildPackageSizeOption(
                    _packageSizes[2]['price']!,
                    _packageSizes[2]['pellets']!,
                    2,
                  ),
                ],
              ),
              SizedBox(height: Responsive.h(2)),

              Text(
                'Product Details',
                style: TextStyle(
                  fontSize: Responsive.sp(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Responsive.h(2)),
              Text(
                'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
                style: TextStyle(
                  fontSize: Responsive.sp(14),
                  color: Color(0xff090F47).withOpacity(0.45),
                ),
              ),
              SizedBox(height: Responsive.h(2)),

              Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: Responsive.sp(16),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: Responsive.h(2)),
              Text(
                'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
                style: TextStyle(
                  fontSize: Responsive.sp(14),
                  color: Color(0xff090F47).withOpacity(0.45),
                ),
              ),
              SizedBox(height: Responsive.h(2)),

              Row(
                children: [
                  Text(
                    'Expiry Date  ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.sp(14),
                      color: Color(0xff090F47),
                    ),
                  ),
                  SizedBox(width: Responsive.w(5)),
                  Text(
                    '25/12/2023',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff090F47).withOpacity(0.45),
                    ),
                  ),
                ],
              ),
              SizedBox(width: Responsive.w(10)),
              Row(
                children: [
                  Text(
                    'Brand Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.sp(14),
                      color: Color(0xff090F47),
                    ),
                  ),
                  SizedBox(width: Responsive.w(5)),
                  Text(
                    'Something',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff090F47).withOpacity(0.45),
                    ),
                  ),
                ],
              ),

              SizedBox(height: Responsive.h(2)),
              _buildRatingSection(),
              SizedBox(height: Responsive.h(2)),
            ],
          ),
        ),
      ),
    );
  }
}
