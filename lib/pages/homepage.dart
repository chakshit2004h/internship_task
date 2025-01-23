import 'package:flutter/material.dart';
import 'package:internship/pages/text_page.dart';
import 'package:internship/widget/appbar.dart';
import '../main.dart';
import '../widget/navigation_bar.dart';
import '../widget/value_container.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Size mq;

  // Track the selected page
  int _selectedIndex = 0;

  // Track the visibility of the navigation bar
  bool _isNavBarVisible = true;  // Start with the nav bar visible
  bool _isRollerVisible = true;  // Track the visibility of the roller button

  // Define the content for each page
  final List<Widget> _pages = [
    const Center(child: SizedBox()), // Empty widget for the dashboard
    const TextPage(), // TextPage, assuming this page exists in your project
    const Center(child: SizedBox()),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(),
      body: GestureDetector(
        onTap: () {
          if (_isNavBarVisible) {
            setState(() {
              _isNavBarVisible = false; // Hide the nav bar when clicked anywhere
              _isRollerVisible = true; // Show the roller button again when the nav bar is hidden
            });
          }
        },
        child: Stack(
          children: [
            // Main Content Area (wrapped inside Stack)
            Stack(
              children: [
                // Left Navigation Bar (with sliding animation)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: _isNavBarVisible ? 0 : -80, // Slide in/out
                  top: 0,
                  bottom: 0,
                  child: Navigation_Bar(
                    onPageSelected: (index) {
                      setState(() {
                        _selectedIndex = index; // Update the selected page
                        // Do not hide the navigation bar when selecting a page
                      });
                    },
                  ),
                ),
                // Main Content Area (Adjusts based on navigation bar visibility)
                Positioned.fill(
                  left: _isNavBarVisible ? 80 : 0, // Adjust the left padding
                  child: Container(
                    color: Colors.black87,
                    child: Column(
                      children: [
                        // Listen to the visibility state
                        ValueListenableBuilder<bool>(
                          valueListenable: isContentVisible,
                          builder: (context, isVisible, child) {
                            return isVisible
                                ? const mainPage() // Show MainPage when visible
                                : const SizedBox(); // Hide MainPage when not visible
                          },
                        ),
                        // Display the corresponding page
                        _pages[_selectedIndex],
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Roller button to toggle navigation bar
            Positioned(
              left: _isNavBarVisible ? 80 : 0, // Adjust based on nav bar visibility
              top: mq.height * .2, // Center vertically
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isNavBarVisible = !_isNavBarVisible; // Toggle visibility of nav bar
                    _isRollerVisible = !_isRollerVisible; // Hide the roller when clicked
                  });
                },
                child: AnimatedOpacity(
                  opacity: _isRollerVisible ? 1.0 : 0.0, // Fade in/out the roller button
                  duration: const Duration(milliseconds: 200), // Animation duration
                  child: Container(
                    width: 15,
                    height: 100,
                    color: Colors.grey, // Roller color
                    alignment: Alignment.center,
                    child: Icon(
                      _isNavBarVisible
                          ? Icons.arrow_back_ios
                          : Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
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
