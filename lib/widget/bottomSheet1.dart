import 'package:flutter/material.dart';

class BottomSheetPicker_1 {
  static void show(BuildContext context) {
    final options = [
      'RAT Lock',
      'NR SA PCI LOCK',
      'NR ARFCN LOCK',
      'NR NSA Band Lock',
      'LTE PCI Lock',
      'LTE EARFCN Lock',
      'LTE Band Lock',
      'WCDMA DedMode-PSC Stay',
      'WCDMA UARFCN Lock',
      'GSM/WCDMA Band Lock',
      'R99 Lock',
      'GPRS Lock',
      'Ignore Cell Barred'
    ]; // List of options

    final subtitles = [
      'unknown(4)',
      '',
      '',
      '[41,78]',
      'Please force RAT to LTE only first',
      'Please force RAT to LTE only first',
      '[]',
      'Please force RAT to WCDMA only first',
      'Please force RAT to WCDMA only first',
      '',
      '',
      'Not supported in new models\n(LE2111)',
      ''
    ];

    final val = [
      'EDIT',
      'OFF',
      'OFF',
      'EDIT',
      'EDIT',
      'OFF',
      'OFF',
      'EDIT',
      'OFF',
      'OFF',
      'EDIT',
      'OFF',
      'OFF'
    ]; // List of values for editing or off state

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
                      bool isDisabled = val[index] == 'OFF';

                      return ListTile(
                        leading: Material(
                          elevation: 10,
                          child: Container(
                            width: 80,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isDisabled ? Colors.grey : Colors.black54,
                            ),
                            child: Center(
                              child: Text(
                                val[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          options[index],
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
                        onTap: isDisabled
                            ? null
                            : () {
                          // Perform your action here
                          Navigator.pop(context); // Close the BottomSheet after selection
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
