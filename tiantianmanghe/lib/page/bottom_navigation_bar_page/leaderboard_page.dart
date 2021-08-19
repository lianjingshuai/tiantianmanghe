/*
 * @Description:  
 * @Author:  
 * @Date: 2021-08-17 12:42:12
 */

// import 'package:tiantianmanghe/tools/header.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardState createState() {
    return _LeaderboardState();
  }
}

class _LeaderboardState extends State<LeaderboardPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        title: Text('榜单'),
      ),
      body: Container(
        color: Colors.white
      ),
    );
  }

}