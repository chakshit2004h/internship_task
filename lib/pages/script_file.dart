import 'package:flutter/material.dart';

class ScriptFile extends StatefulWidget {
  const ScriptFile({super.key});

  @override
  State<ScriptFile> createState() => _ScriptFileState();
}

class _ScriptFileState extends State<ScriptFile> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _filenameController = TextEditingController();
  List<String> menuItems = [
    "Tcpdump Record",
    "Require Cell File",
    "LINE Send",
    "Instagram Download Photo",
    "Wait until SQL criteria/threshold",
    "New Sector Tag",
    "LTE EARFCN Lock disable",
    "LINE Clear History",
    "OTT Video Streaming MOS",
    "Voice + FTP Upload",
  ];
  List<String> filteredMenuItems = [];

  bool _isSearching = false;
  List<String> _searchList = [];

  @override
  void initState() {
    super.initState();
    filteredMenuItems = List.from(menuItems); // Initialize filtered list
    _searchController.addListener(_filterMenuItems); // Add listener for search bar
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterMenuItems); // Clean up the listener
    super.dispose();
  }

  void _filterMenuItems() {
    setState(() {
      String searchText = _searchController.text.toLowerCase();
      if (searchText.isEmpty) {
        _searchList.clear();
      } else {
        _searchList = menuItems
            .where((item) => item.toLowerCase().contains(searchText))
            .toList();
      }
    });
  }

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
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showCustomPopupMenu(context);
            },
            icon: const Icon(Icons.add, color: Colors.grey, size: 30),
          ),
          IconButton(
            onPressed: () {
              _showSavePopup(context); // Trigger save popup on click
            },
            icon: const Icon(Icons.save, color: Colors.grey, size: 30),
          ),
        ],
      ),
      body: Container(
        height: 800,
        width: 500,
        color: Colors.black87,
        child: Text("Script",style: TextStyle(color: Colors.grey,fontSize: 25),),
      )
    );
  }

  // Function for Popup Menu
  void _showCustomPopupMenu(BuildContext context) {
    showDialog(
      barrierColor: Colors.black87,
      context: context,
      barrierDismissible: true,  // Allow closing the dialog on outside tap
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(  // Make the dialog scrollable
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar inside popup menu
                  TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search Statement...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.black45,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      _filterMenuItems(); // Update the filtered list when the text changes
                    },
                  ),
                  const SizedBox(height: 20),
                  // List of options inside popup menu, filtered by search
                  SizedBox(
                    height: 400,  // Limit the height so it doesn't overflow the screen
                    child: ListView(
                      children: _searchList.isNotEmpty || _searchController.text.isNotEmpty
                          ? _searchList
                          .map((item) => _buildMenuItem(item))
                          .toList()
                          : menuItems
                          .map((item) => _buildMenuItem(item))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Function to display the "Save" Popup
  void _showSavePopup(BuildContext context) {
    showDialog(
      barrierColor: Colors.black87,
      context: context,
      barrierDismissible: true,  // Allow closing the dialog on outside tap
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(  // Make the dialog scrollable
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Please enter filename",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _filenameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter filename...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.black45,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close popup
                        },
                        child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          String filename = _filenameController.text.trim();
                          if (filename.isNotEmpty) {
                            // Save logic here
                            print("Filename saved: $filename");
                            Navigator.pop(context); // Close popup
                          } else {
                            // Show error if needed
                            print("Filename cannot be empty");
                          }
                        },
                        child: const Text("OK", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Build Menu Item
  Widget _buildMenuItem(String title) {
    return InkWell(
      onTap: () {
        Navigator.pop(context); // Close the dialog on selection
        print("$title selected");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
