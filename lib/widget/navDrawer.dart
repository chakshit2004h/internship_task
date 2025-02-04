import 'package:flutter/material.dart';

import '../font/fonts_style.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<drawer> {
  late Size mq;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 50.0), // Adjust this to align above the icon
      child: Container(
        width: mq.width * 0.7, // Adjust width if needed
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView( // Enable scrolling
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              const DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80),
                    Padding(
                      padding: EdgeInsets.only(left: 185.0),
                      child: Text("6.11.7.1", style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
              // Expandable Menu Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _drawerItems(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Drawer items to keep the code clean
  List<Widget> _drawerItems() {
    List<Map<String, dynamic>> menuItems = [
      {"icon": Icons.not_started_rounded, "title": "Start Script"},
      {"icon": Icons.list, "title": "Start Script Set"},
      {"icon": Icons.network_cell, "title": "Network Monitor"},
      {"icon": Icons.date_range_outlined, "title": "Start Schedule"},
      {"icon": Icons.edit, "title": "New Script"},
      {"icon": Icons.folder, "title": "Open Script"},
      {"icon": Icons.manage_search_outlined, "title": "Manage Script Set"},
      {"icon": Icons.share, "title": "Share Script"},
      {"icon": Icons.delete, "title": "Delete Script"},
      {"icon": Icons.settings, "title": "Settings"},
      {"icon": Icons.upload, "title": "Upload Logs"},
      {"icon": Icons.file_copy_outlined, "title": "Manage Logs"},
      {"icon": Icons.bluetooth_audio, "title": "Use Bluetooth Commander"},
      {"icon": Icons.video_call, "title": "How To Video & FAQ"},
      {"icon": Icons.question_mark_outlined, "title": "Email Support"},
      {"icon": Icons.emergency, "title": "About"},
      {"icon": Icons.bug_report, "title": "Logcat Manager"},
      {"icon": Icons.border_style_sharp, "title": "Connect to BOSS"},
      {"icon": Icons.dashboard_outlined, "title": "Open Dashboard"},
      {"icon": Icons.call, "title": "Test Call Recorder"},
    ];

    return menuItems
        .map((item) => Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 15.0),
      child: Row(
        children: [
          Icon(item["icon"], color: Colors.grey, size: 20),
          const SizedBox(width: 20),
          Text(item["title"],
              style: AppWidget.whiteTextStyle()
                  .copyWith(fontSize: 15, color: Colors.grey)),
        ],
      ),
    ))
        .toList();
  }
}
