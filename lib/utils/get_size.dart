import 'package:flutter/material.dart';

class GetSize {
  Size sizeScreen(context) {
    return MediaQuery.of(context).size;
  }

  double getHeightWithoutAppBar(context){
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return screenHeight - appBarHeight - statusBarHeight - 20;
  }
}