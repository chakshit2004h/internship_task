import 'package:flutter/material.dart';
import 'package:internship/pages/rlf.dart';
import 'package:internship/pages/text_page.dart';
import 'package:internship/widget/appbar.dart';
import '../font/fonts_style.dart';
import '../main.dart';
import '../widget/bottomSheet1.dart';
import '../widget/bottomSheet2.dart';
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
    const Rlf(),
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
                  width: 70,
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

            ],
          ),

          // Roller Button
          Positioned(
            left: _isNavBarVisible ? 70 : 0, // Adjust based on nav bar visibility
            top: mq.height * .2, // Position vertically
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                // Detect horizontal drag and only toggle on a left drag
                if (details.delta.dx < -10) {
                  setState(() {
                    _isNavBarVisible = false; // Hide the nav bar on left drag
                    _isRollerVisible = true; // Show the roller
                  });
                } else if (details.delta.dx > 10) {
                  setState(() {
                    _isNavBarVisible = true; // Show the nav bar on right drag
                    _isRollerVisible = false; // Hide the roller
                  });
                }
              },
              onTap: (){
                setState(() {
                  _isNavBarVisible = true; // Show the nav bar on right drag
                  _isRollerVisible = false; // Hide the roller
                });
              },
              // onTap: () {
              //   setState(() {
              //     _isNavBarVisible = !_isNavBarVisible; // Toggle visibility of nav bar
              //     _isRollerVisible = !_isRollerVisible; // Hide the roller when clicked
              //   });
              // },
              child: AnimatedOpacity(
                opacity: _isRollerVisible ? 1.0 : 0.0, // Fade in/out the roller button
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: 10,
                  height: 100,
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
          // Positioned(
          //   bottom: 50,
          //   left: _isNavBarVisible ? 80 : 0, // Adjust the left position dynamically
          //   child: GestureDetector(
          //     onVerticalDragEnd: (details) {
          //       // Check if the user is dragging upwards (negative primaryVelocity)
          //       if (details.primaryVelocity! < 0) {
          //         BottomSheetPicker_2.show(context); // Show the bottom sheet when dragged upwards
          //       }
          //     },
          //     onTap: (){
          //       BottomSheetPicker_2.show(context);
          //     },
          //     child: AnimatedContainer(
          //       duration: const Duration(milliseconds: 300), // Smooth resizing animation
          //       width: _isNavBarVisible ? mq.width - 80 : mq.width, // Adjust width dynamically
          //       height: mq.height * .08, // Maintain a slightly larger height for text
          //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Add padding for text
          //       color: Colors.black26,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
          //         children: [
          //           Text(
          //             "Ping[www.google.com][pktSize = 16][interval = 0.2]",
          //             style: TextStyle(
          //               fontSize: _isNavBarVisible ? 15 : 18,
          //               color: Colors.white,
          //               overflow: TextOverflow.ellipsis, // Prevent text overflow
          //             ),
          //             maxLines: 1, // Limit to a single line
          //           ),
          //           const SizedBox(height: 4), // Add space between texts
          //           Text(
          //             "executing...",
          //             style: TextStyle(
          //               fontSize: _isNavBarVisible ? 13 : 15,
          //               color: Colors.grey,
          //               overflow: TextOverflow.ellipsis, // Prevent text overflow
          //             ),
          //             maxLines: 1, // Limit to a single line
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Force/Lock Button
          // Force/Lock Button
          if (_selectedIndex == 0)
            Positioned(
              bottom: 10,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  BottomSheetPicker_1.show(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Add padding for a button-like appearance
                  child: const Text(
                    "FORCE/LOCK",
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
