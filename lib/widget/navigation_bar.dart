import 'package:flutter/material.dart';

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
    {'icon': Icons.dashboard, 'label': 'Dashboard'},
    {'icon': Icons.person, 'label': 'Profile'},
    {'icon': Icons.settings, 'label': 'Settings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Navigation bar width
      color: Colors.black,
      child: Stack(
        children: [
          Column(
            children: [
              // Build navigation items
              for (int i = 0; i < navItems.length; i++)
                _buildNavItem(navItems[i]['icon'], navItems[i]['label'], i),
            ],
          ),
          // Roller indicator
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: _selectedIndex * 70.0 , // Position based on selected index
            left: 75, // Align with the right side of the nav bar
            child: Container(
              width: 5, // Slim vertical strip
              height: 70, // Same height as the navigation item
              color: Colors.grey, // Roller color
            ),
          ),
        ],
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
        height: 70, // Ensure the height matches the roller height
        color: Colors.black, // Background color
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32, // Bigger icon size
              color: isSelected ? Colors.blue : Colors.white, // Change icon color on selection
            ),
            const SizedBox(height: 8), // Space between icon and text
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.white, // Change text color on selection
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}