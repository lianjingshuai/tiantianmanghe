/*
 * @Description:  
 * @Author:  
 * @Date: 2021-08-17 11:36:41
 */
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tiantianmanghe/tools/header.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarPage> {

  int _currentIndex = 0;

  @override
  void initState() {
    // 网络配置
    BasicFunction.networkConfiguration();
    // 启动
    BasicFunction.startJudgment().then((value) {
      // 请求数据
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Color(0xFFFF6666),
        // unselectedItemColor: Color(0xFF383838),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sort),
            label: '分类',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: '榜单',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
        onTap: (int index) {
          // 切换页面
          _currentIndex = index;
          setState(() {});
        },
      ),
      body: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: IndexedStack(
          index: _currentIndex,
          children: [
            HomePage(),
            SortPage(),
            LeaderboardPage(),
            PersonPage(),
          ],
        ),
      ),
    );
  }
}
