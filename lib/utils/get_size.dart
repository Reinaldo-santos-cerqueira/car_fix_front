import 'package:flutter/material.dart';

class GetSize {
  Size sizeScreen(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double getHeightWithoutAppBar(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return screenHeight - appBarHeight - statusBarHeight - 20;
  }

  double getHeightFromPercent(BuildContext context,double percent){
    return sizeScreen(context).height / 100 * percent;
  }
  double getWidthFromPercent(BuildContext context,double percent){
    return sizeScreen(context).width / 100 * percent;
  }

}