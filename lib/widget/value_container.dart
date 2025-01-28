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
      duration: const Duration(milliseconds: 300),
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
              height: isExpanded_1 ? mq.height * 0.07 : mq.height* 0.16,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: mq.height * 0.01),
                    child: Center(
                      child: Text(
                        "LTE",
                        style: AppWidget.lightTextStyle().copyWith(color: Colors.white),
                      ),
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
                                isExpanded_1
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_1
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_1
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_1
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_1
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_1
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_1
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_1
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
          Container(height: mq.height*.001,color:  Colors.white,),
          GestureDetector(
            onTap: (){
              setState(() {
                isExpanded_2 = !isExpanded_2;
              });
            },
            child: AnimatedContainer(
              width: double.infinity,
              height: isExpanded_2 ? mq.height * 0.07 : mq.height* 0.16,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: mq.height * 0.01),
                    child: Center(
                      child: Text(
                        "NR",
                        style: AppWidget.lightTextStyle().copyWith(color: Colors.white),
                      ),
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
                                isExpanded_2
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_2
                                    ? buildItem("634080")
                                    :Column(
                                  children: [
                                    buildItem("634080"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_2
                                    ? buildItem("3511.4")
                                    :Column(
                                  children: [
                                    buildItem("3511.4"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_2
                                    ? buildItem("0.004")
                                    :Column(
                                  children: [
                                    buildItem("0.004"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_2
                                    ? buildItem("37/1")
                                    :Column(
                                  children: [
                                    buildItem("37/1"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_2
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_2
                                    ? buildItem("-104.4")
                                    :Column(
                                  children: [
                                    buildItem("-104.4"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_2
                                    ? buildItem("-10.9")
                                    :Column(
                                  children: [
                                    buildItem("-10.9"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_2
                                    ? buildItem("9.5")
                                    :Column(
                                  children: [
                                    buildItem("9.5"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_2
                                    ? buildItem("0.004")
                                    :Column(
                                  children: [
                                    buildItem("0.004"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
              height: isExpanded_3 ? mq.height * 0.07 : mq.height* 0.16,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: mq.height * 0.01),
                    child: Center(
                      child: Text(
                        "NR SCG",
                        style: AppWidget.lightTextStyle().copyWith(color: Colors.white),
                      ),
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
                                isExpanded_3
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_3
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_3
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_3
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_3
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_3
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_3
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
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
                                isExpanded_3
                                    ? buildItem("--")
                                    :Column(
                                  children: [
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                    buildItem("--"),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildItem(String val){
    return Text("${val}",style: AppWidget.whiteTextStyle(),);
  }
}