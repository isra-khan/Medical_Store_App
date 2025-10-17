import 'package:flutter/material.dart';
import 'package:quickmedicalapp/screens/splash/widgets/custom_button.dart';
import 'package:quickmedicalapp/utils/colorconstraint.dart';
import 'package:quickmedicalapp/utils/responsiveness.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text(
          'Your cart',
          style: TextStyle(
            color: Color(0xff090F47),
            fontWeight: FontWeight.bold,
            fontSize: Responsive.sp(16),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cart header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '2 Items in your cart',
                          style: TextStyle(
                            fontSize: Responsive.sp(14),
                            color: Color(0xff090F47).withOpacity(0.45),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 18,
                            color: ColorConstraint.primaryColor,
                          ),
                          label: Text(
                            'Add more',
                            style: TextStyle(
                              color: ColorConstraint.primaryColor,
                              fontSize: Responsive.sp(14),
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Responsive.h(5)),

                    _buildCartItem(
                      productName: 'Sugar free gold',
                      details: 'bottle of 500 pellets',
                      price: 'Rs.25',
                      imagePath: 'assets/images/product.png',
                    ),
                    Divider(
                      height: 30,
                      thickness: 1,
                      color: Color(0XFF000000).withOpacity(0.1),
                    ),
                    _buildCartItem(
                      productName: 'Sugar free gold',
                      details: 'bottle of 500 pellets',
                      price: 'Rs.18',
                      imagePath: 'assets/images/product_2.png',
                    ),
                    Divider(
                      height: 30,
                      thickness: 1,
                      color: Color(0XFF000000).withOpacity(0.1),
                    ),
                    SizedBox(height: Responsive.h(3)),
                  ],
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Payment Summary',
                  style: TextStyle(
                    color: Color(0xff090F47),
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.sp(16),
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  color: Color(0XFF000000).withOpacity(0.1),
                ),
                _buildSummaryRow('Order Total', '228.80'),
                _buildSummaryRow('Items Discount', '-28.80', isDiscount: true),
                _buildSummaryRow('Coupon Discount', '-15.80', isDiscount: true),
                _buildSummaryRow('Shipping', 'Free', isFree: true),
                Divider(
                  height: 20,
                  thickness: 1,
                  color: Color(0XFF000000).withOpacity(0.1),
                ),
                _buildSummaryRow('Total', 'Rs.185.00', isTotal: true),
                const SizedBox(height: 12),
                CustomButton(
                  title: 'Place Order',
                  onPressed: () {},
                  bgColor: ColorConstraint.primaryColor,
                  textColor: ColorConstraint.secondaryColor,
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildCartItem({
    required String productName,
    required String details,
    required String price,
    required String imagePath,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F0F8), // Light grey background
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            // NOTE: Use actual Image.asset if the paths are correct, otherwise use placeholder
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 12),

        // Product Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                details,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Quantity Control & Remove Button
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Remove Button (X icon)
            const Icon(Icons.close, color: Colors.grey, size: 20),
            const SizedBox(height: 10), // Space to align with price line
            // Quantity Control
            Row(
              children: [
                _buildQuantityButton(Icons.remove, isDecrease: true),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildQuantityButton(Icons.add, isDecrease: false),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, {required bool isDecrease}) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: isDecrease ? const Color(0xFFF1F0F8) : const Color(0xFF5E54F3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        size: 18,
        color: isDecrease ? Colors.grey : Colors.white,
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isTotal = false,
    bool isDiscount = false,
    bool isFree = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: Responsive.sp(14),
              color: Color(0xff090F47).withOpacity(0.45),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: Responsive.sp(14),
              color: // Free shipping color
              Color(
                0xff090F47,
              ),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
