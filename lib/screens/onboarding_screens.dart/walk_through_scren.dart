import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // make sure correct import
import 'package:quickmedicalapp/routes/routes.dart';
import 'package:quickmedicalapp/screens/models/walkthrough_model.dart';
import 'package:quickmedicalapp/utils/colorconstraint.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int currentIndex = 0;

  final PageController _pageController = PageController();
  final List<WalkthroughModel> walkthroughList = [
    WalkthroughModel(
      title: "View and Buy Medical Online",
      description:
          "Find trusted medicines and healthcare products — all from the comfort of your home.",
    ),
    WalkthroughModel(
      title: "Your Online Medical Store",
      description:
          "Browse, compare, and order genuine medicines with just a few taps.",
    ),
    WalkthroughModel(
      title: "Fast & Reliable Delivery",
      description:
          "Get your prescribed medicines delivered safely and quickly to your doorstep.",
    ),
    WalkthroughModel(
      title: "Health Products You Can Trust",
      description:
          "From vitamins to medical devices, we bring you only verified and top-quality products.",
    ),
    WalkthroughModel(
      title: "Stay Informed, Stay Healthy",
      description:
          "Access helpful tips, dosage guides, and reminders to manage your medicines with ease.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (currentIndex < walkthroughList.length - 1) {
      _pageController.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushNamed(context, Routes.quickNumber);
      // Navigate to HomeScreen or login
    }
  }

  void _onSkip() {
    // Handle skip action (navigate directly)
  }

  // ---------------------------
  // 🔹 Widget builder methods
  // ---------------------------

  Widget _buildPage(WalkthroughModel model) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/onboarding.svg',
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 24),
          Text(
            model.title ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            model.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(walkthroughList.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? ColorConstraint.primaryColor
                : Colors.grey,
          ),
        );
      }),
    );
  }

  Widget _buildBottomNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: _onSkip,
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(
              ColorConstraint.lightPrimaryColor,
            ),
            textStyle: WidgetStateProperty.all(
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          child: const Text("Skip"),
        ),
        _buildPageIndicator(),
        TextButton(
          onPressed: _onNext,
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(
              ColorConstraint.primaryColor,
            ),
            textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16)),
          ),
          child: Text(
            currentIndex == walkthroughList.length - 1 ? "Done" : "Next",
          ),
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemCount: walkthroughList.length,
        onPageChanged: (int page) {
          setState(() {
            currentIndex = page;
          });
        },
        itemBuilder: (context, index) {
          final model = walkthroughList[index];
          return _buildPage(model);
        },
      ),
    );
  }

  // ---------------------------
  // 🔹 Main build method
  // ---------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstraint.secondaryColor,
      body: SafeArea(
        child: Column(children: [_buildPageView(), _buildBottomNavigation()]),
      ),
    );
  }
}
