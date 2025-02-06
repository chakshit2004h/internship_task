import 'package:flutter/material.dart';
import '../font/fonts_style.dart';
import '../pages/script_file.dart'; // Import the new page

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
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
        width: mq.width * 0.7,
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              _drawerButton(Icons.not_started_rounded, "Start Script"),
              _drawerButton(Icons.list, "Start Script Set"),
              _drawerButton(Icons.network_cell, "Network Monitor"),
              _drawerButton(Icons.date_range_outlined, "Start Schedule"),
              _drawerButton(Icons.edit, "New Script"),
              _drawerButton(Icons.folder, "Open Script"),
              _drawerButton(Icons.manage_search_outlined, "Manage Script Set"),
              _drawerButton(Icons.share, "Share Script"),
              _drawerButton(Icons.delete, "Delete Script"),
              _drawerButton(Icons.settings, "Settings"),
              _drawerButton(Icons.upload, "Upload Logs"),
              _drawerButton(Icons.file_copy_outlined, "Manage Logs"),
              _drawerButton(Icons.bluetooth_audio, "Use Bluetooth Commander"),
              _drawerButton(Icons.video_call, "How To Video & FAQ"),
              _drawerButton(Icons.question_mark_outlined, "Email Support"),
              _drawerButton(Icons.emergency, "About"),
              _drawerButton(Icons.bug_report, "Logcat Manager"),
              _drawerButton(Icons.border_style_sharp, "Connect to BOSS"),
              _drawerButton(Icons.dashboard_outlined, "Open Dashboard"),
              _drawerButton(Icons.call, "Test Call Recorder"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerButton(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
      child: TextButton(
        onPressed: () => _onDrawerItemTap(title),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey, size: 20),
            const SizedBox(width: 15),
            Text(title,
                style: AppWidget.whiteTextStyle()
                    .copyWith(fontSize: 15, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  void _onDrawerItemTap(String title) {
    print("$title clicked");
    if (title == "New Script") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScriptFile()),
      );
    }
  }
}
