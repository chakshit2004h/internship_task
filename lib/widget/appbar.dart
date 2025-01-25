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
          const SizedBox(width: 80),
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
              child: Text(
                    "Start Script",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
            ),
            const PopupMenuItem(
              value: 'Option 2',
              child:Text(
                    "Monitor Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
            ),
            const PopupMenuItem(
              value: 'Option 2',
              child:Text(
                "Monitor Mode",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 3',
              child:Text(
                "End Script",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 4',
              child:Text(
                "View Theme",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 5',
              child:Text(
                "Take Screenshot",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 6',
              child:Text(
                "Add Photo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 7',
              child:Text(
                "Take Photo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 7',
              child:Text(
                "Mute/Unmute",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 7',
              child:Text(
                "Pause Recording",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 8',
              child:Text(
                "Add Tag",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 9',
              child:Text(
                "Split Tag",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 10',
              child:Text(
                "Reset Modem",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 11',
              child:Text(
                "Skip item by Airplane Mode",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const PopupMenuItem(
              value: 'Option 11',
              child:Row(
                children: [
                  Text(
                    "VoNR Enable/Disable",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.check_box_outline_blank,color: Colors.white,)
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