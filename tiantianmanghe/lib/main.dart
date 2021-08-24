/*
 * @Description:  
 * @Author:  
 * @Date: 2021-08-17 09:51:59
 */
import 'package:flutter/material.dart';
import 'package:tiantianmanghe/tools/header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: colorTheme(),
      ),
      home: BottomNavigationBarPage(),
    );
  }
}

