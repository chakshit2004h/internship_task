import 'package:flutter/material.dart';

import '../font/fonts_style.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  late Size mq;
  bool isExpanded_1 = true;
  bool isExpanded_2 = true;
  bool isExpanded_3 = true;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return AnimatedContainer(
      height: 500,
      duration: Duration(milliseconds: 300),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                isExpanded_1 = !isExpanded_1;
              });
            },
            child: AnimatedContainer(
              width: double.infinity,
              height: isExpanded_1 ? mq.height * 0.05 : mq.height* 0.15,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: mq.height * 0.01),
                    child: Text(
                      "LTE",
                      style: AppWidget.boldTextStyle(),
                    ),
                  ),
                  // Wrap the columns in a horizontally scrollable view
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "Band",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "EARFCN",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "Freq",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "DL BW",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "RSRP",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "SINR",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style:AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "PDSCH",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "PUSCH",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(height: mq.height*.001,color: Colors.white,),
          GestureDetector(
            onTap: (){
              setState(() {
                isExpanded_2 = !isExpanded_2;
              });
            },
            child: AnimatedContainer(
              width: double.infinity,
              height: isExpanded_2 ? mq.height * 0.05 : mq.height* 0.15,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: mq.height * 0.01),
                    child: Text(
                      "NR",
                      style: AppWidget.boldTextStyle(),
                    ),
                  ),
                  // Wrap the columns in a horizontally scrollable view
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR Band",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR ARFCN",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "634080",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR Freq",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "3511.2",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR DL BW",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR PCI/SSB",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "37/1",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "SINR",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style:AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR SS RSRP",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "-104.4",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR SS RSRQ",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "-10.9",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR SS SINR",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "9.5",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR PDSCH",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "0.004",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(height: mq.height*.001,color: Colors.white,),
          GestureDetector(
            onTap: (){
              setState(() {
                isExpanded_3 = !isExpanded_3;
              });
            },
            child: AnimatedContainer(
              width: double.infinity,
              height: isExpanded_3 ? mq.height * 0.05 : mq.height* 0.15,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: mq.height * 0.01),
                    child: Text(
                      "NR SCG",
                      style: AppWidget.boldTextStyle(),
                    ),
                  ),
                  // Wrap the columns in a horizontally scrollable view
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR Band",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR ARFCN",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style:AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR Freq",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR DL BW",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR PCI/SSB",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR SS RSRP",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR SS RSRQ",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style: AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "NR SS SINR",
                                  style: AppWidget.lightTextStyle(),
                                ),
                                Text(
                                  "--",
                                  style:AppWidget.whiteTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(height: mq.height*.002,color: Colors.white,),
        ],
      ),
    );
  }
}