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
  bool _isNavBarVisible = true; // Start with the nav bar visible
  bool _isRollerVisible = true; // Track the visibility of the roller button

  // Define the content for each page
  final List<Widget> _pages = [
    const Center(child: Text('Dashboard')), // Example for the dashboard
    const TextPage(), // TextPage, assuming this page exists in your project
    const Center(child: Text('Another Page')),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent, // Ensure the screen's base background is transparent
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          // Main Content Area
          GestureDetector(
            onTap: () {
              if (_isNavBarVisible) {
                setState(() {
                  _isNavBarVisible = false; // Hide the nav bar when clicking anywhere
                  _isRollerVisible = true; // Show the roller button again
                });
              }
            },
            child: Container(
              color: Colors.grey[900], // Main background color for the screen
              child: Column(
                children: [
                  Expanded(
                    child: IndexedStack(
                      index: _selectedIndex,
                      children: _pages, // Display the selected page
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Navigation Bar and Overlay Controls
          Stack(
            children: [
              // Left Navigation Bar (with sliding animation)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: _isNavBarVisible ? 0 : -80, // Slide in/out
                top: 0,
                bottom: 0,
                child: Container(
                  width: 80,
                  color: Colors.black87, // Navigation bar background color
                  child: Navigation_Bar(
                    onPageSelected: (index) {
                      setState(() {
                        _selectedIndex = index; // Update the selected page
                      });
                    },
                  ),
                ),
              ),
              // Main Content Area (Adjusts based on navigation bar visibility)
              Positioned.fill(
                left: _isNavBarVisible ? 80 : 0, // Adjust based on navbar visibility
                child: Container(
                  child: Column(
                    children: [
                      // Animated visibility for main page
                      ValueListenableBuilder<bool>(
                        valueListenable: isContentVisible, // Assuming this is controlling visibility
                        builder: (context, isVisible, child) {
                          return AnimatedOpacity(
                            opacity: isVisible ? 1.0 : 0.0, // Fade in/out based on visibility
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            child: AnimatedSlide(
                              offset: isVisible ? Offset.zero : const Offset(0, -0.2), // Slide out if not visible
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              child: isVisible
                                  ? const mainPage()  // Show the mainPage when visible
                                  : const SizedBox(), // Hide it when not visible
                            ),
                          );
                        },
                      ),
                      // Display the corresponding page based on selection
                      _pages[_selectedIndex],
                    ],
                  ),
                ),
              ),

            ],
          ),

          // Roller Button
          Positioned(
            left: _isNavBarVisible ? 80 : 0, // Adjust based on nav bar visibility
            top: mq.height * .2, // Position vertically
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isNavBarVisible = !_isNavBarVisible; // Toggle visibility of nav bar
                  _isRollerVisible = !_isRollerVisible; // Hide the roller when clicked
                });
              },
              child: AnimatedOpacity(
                opacity: _isRollerVisible ? 1.0 : 0.0, // Fade in/out the roller button
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: 15,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ), // Roller color
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
