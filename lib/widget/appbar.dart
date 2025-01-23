import 'package:flutter/material.dart';

import '../main.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60.0); // Provide the app bar height directly.
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isVisible = true;

  void _toggleContainer() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min, // Ensures the row takes minimal space.
        children: [
          const Text(
            "SCRIPTS",
            style: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          PopupMenuButton<String>(
            color: Colors.black87,
            icon: const Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.white,
              size: 30,
            ),
            offset: const Offset(-172, 0), // Adjust position of the popup menu.
            onSelected: (value) {
              // Handle selection logic if needed.
            },
            itemBuilder: (BuildContext context) => [
              _buildPopupMenuItem("web"),
              _buildPopupMenuItem("FTP_DL_500M"),
              _buildPopupMenuItem("FTP_DL_5MB"),
              _buildPopupMenuItem("FTP_UL_1MB"),
              _buildPopupMenuItem("HTTP_DL_5MB"),
              _buildPopupMenuItem("NONE"),
              _buildPopupMenuItem("PING"),
            ],
          ),
        ],
      ),
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: isContentVisible,
          builder: (context, isVisible, child) {
            return IconButton(
              onPressed: () {
                isContentVisible.value = !isContentVisible.value; // Toggle visibility.
              },
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
                size: 35,
              ),
            );
          },
        ),
        IconButton(
          onPressed: () {
            // Add logic for the edit button here.
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 35,
          ),
        ),
        PopupMenuButton<String>(
          color: Colors.black87,
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 30,
          ),
          onSelected: (value) {
            // Handle selection logic if needed.
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: 'Option 1',
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_right_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text(
                    "Measurement Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'Option 2',
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Icon(
                    Icons.watch_later,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Monitor Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Helper function to build popup menu items.
  PopupMenuItem<String> _buildPopupMenuItem(String text) {
    return PopupMenuItem(
      value: text,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.orangeAccent,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
