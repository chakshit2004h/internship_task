import 'package:flutter/material.dart';
import 'package:internship/pages/5G_NR.dart';
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

  int _selectedIndex = 0;
  bool _isNavBarVisible = true;
  bool _isRollerVisible = true;

  final List<Widget> _pages = [
    const Center(child: Text('Dashboard')),
    const TextPage(),
    const Rlf(),
    const NR_5G(),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (_isNavBarVisible) {
                setState(() {
                  _isNavBarVisible = false;
                  _isRollerVisible = true;
                });
              }
            },
            child: Container(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ValueListenableBuilder<bool>(
                        valueListenable: isContentVisible,
                        builder: (context, isVisible, child) {
                          return Column(
                            children: [
                              if (isVisible) const mainPage(),
                              if (_selectedIndex == 2 && isVisible)
                                const Expanded(child: Rlf()), // Show below mainPage
                              if (_selectedIndex != 2 || !isVisible)
                                Expanded(child: _pages[_selectedIndex]), // Take full screen if not Rlf
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Navigation Bar
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isNavBarVisible ? 0 : -80,
            top: 0,
            bottom: 0,
            child: Container(
              width: 70,
              color: Colors.black87,
              child: Navigation_Bar(
                onPageSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),

          // Roller Button
          Positioned(
            left: _isNavBarVisible ? 70 : 0,
            top: mq.height * .2,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx < -10) {
                  setState(() {
                    _isRollerVisible = true;
                    _isNavBarVisible = false;
                  });
                } else if (details.delta.dx > 10) {
                  setState(() {
                    _isNavBarVisible = true;
                  });
                }
              },
              onTap: () {
                setState(() {
                  _isNavBarVisible = true;
                  _isRollerVisible = true;
                });
              },
              child: AnimatedOpacity(
                opacity: _isRollerVisible ? 1.0 : 0.0,
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
                  ),
                ),
              ),
            ),
          ),

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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
