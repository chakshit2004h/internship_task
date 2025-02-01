import 'package:flutter/material.dart';
import 'package:internship/font/fonts_style.dart';

// Navigation Bar widget
class Navigation_Bar extends StatefulWidget {
  final Function(int) onPageSelected; // Callback to notify page change

  const Navigation_Bar({Key? key, required this.onPageSelected}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<Navigation_Bar> {
  int _selectedIndex = 0; // Track selected page

  // List of items in the navigation bar
  final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.dashboard, 'label': 'Scripts'},
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.table_view_sharp, 'label': 'RF1'},
    {'icon': Icons.home_outlined, 'label': '5G NR'},
    {'icon': Icons.cell_tower, 'label': 'Cell'},
    {'icon': Icons.area_chart_sharp, 'label': 'Charts'},
    {'icon': Icons.table_bar_sharp, 'label': 'RF1'},
    {'icon': Icons.table_rows, 'label': 'Rach'},
    {'icon': Icons.network_cell, 'label': '5G NR'},
    {'icon': Icons.radar, 'label': 'Beam'},
    {'icon': Icons.output, 'label': 'Throughput'},
    {'icon': Icons.width_wide, 'label': 'Spectrum'},
    {'icon': Icons.settings_input_antenna, 'label': 'Throughput'},
    {'icon': Icons.single_bed, 'label': 'Signaling'},
    {'icon': Icons.map, 'label': 'Map'}
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 100, // Navigation bar width
        color: Colors.black,
        child: Stack(
          children: [
            // Make the Column scrollable by wrapping it in a SingleChildScrollView
            SingleChildScrollView(
              child: Column(
                children: [
                  // Build navigation items
                  for (int i = 0; i < navItems.length; i++)
                    _buildNavItem(navItems[i]['icon'], navItems[i]['label'], i),
                ],
              ),
            ),
            // Roller indicator
          ],
        ),
      ),
    );
  }

  // Build a navigation item with highlight effect
  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Change page based on selected index
        });
        widget.onPageSelected(index); // Notify parent about page change
      },
      child: Container(
        height: 60, // Ensure the height matches the roller height
        color: Colors.black, // Background color
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 24, // Bigger icon size
                    color: isSelected ? Colors.white : Colors.grey, // Change icon color on selection
                  ),
                  const SizedBox(height: 5), // Space between icon and text
                  Text(
                    label,
                    style: AppWidget.lightTextStyle().copyWith(color: isSelected ? Colors.white : Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            if(isSelected)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 3, // Same height as the navigation item
              color: Colors.orangeAccent, // Roller color
            ),
          ],
        ),
      ),
    );
  }
}