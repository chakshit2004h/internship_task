import 'package:flutter/material.dart';

class Ping extends StatefulWidget {
  const Ping({super.key});

  @override
  State<Ping> createState() => _PingState();
}

class _PingState extends State<Ping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "AZENQOS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _showDialog,
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black87,
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:  Colors.grey[900],
          title: const Text(
            "Select a Plugin",
            style: TextStyle(color: Colors.white),
          ),
          content: const SizedBox(
            width: 300,
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                const Text(
                  "Network Capture(TShark)",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Redoable(Force&Condition)",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Wait for Events",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Screen Capture",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
