import 'package:flutter/material.dart';

class BottomSheetPicker_2 {
  static void show(BuildContext context) {
    final options = [
      'Ping[www.google.com][pktSize = 16][interval = 0.2]',
      'Loop[700]',
      'Script'
    ]; // List of options

    final subtitles = [
      'executing...',
      'Iteration 11 / 700',
      'running...'
    ];
    showModalBottomSheet(
      isScrollControlled: true, // Allow full-screen height
      backgroundColor: Colors.grey[200],
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          color: Colors.black87,
          height: MediaQuery.of(context).size.height * 0.95, // 95% of screen height
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          options[index],
                          maxLines: 1,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        subtitle: subtitles[index].isNotEmpty
                            ? Text(
                          subtitles[index],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        )
                            : null,
                        onTap: (){
                          Navigator.pop(context);
                        },
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
