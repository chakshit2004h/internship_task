import 'package:flutter/material.dart';

class AppWidget {

  static TextStyle boldTextStyle(){
    return const TextStyle(
      color: Colors.white,
      fontSize: 12,
    );
  }
  static TextStyle whiteTextStyle(){
    return const TextStyle(
      color: Colors.white,
      fontSize: 12,
    );
  }
  static TextStyle semiboldTextStyle(){
    return const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle subtitleTextStyle(){
    return const TextStyle(
      color: Colors.grey,
      fontSize: 12,
    );
  }
  static TextStyle lightTextStyle(){
    return const TextStyle(
      color: Colors.grey,
      fontSize: 10,
    );
  }
}