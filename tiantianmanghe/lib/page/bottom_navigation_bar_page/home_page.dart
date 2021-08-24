/*
 * @Description:  
 * @Author:  
 * @Date: 2021-08-17 11:35:06
 */

import 'dart:ui';

import 'package:tiantianmanghe/tools/header.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        // brightness: Brightness.dark,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            height: appBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 96,
                  height: 26,
                  color: colorTheme(),
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Color(0xFFF5F5F5),
                        ),
                        height: 32,
                        width: 100 * ratio(context),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 16,
                              height: 16,
                              color: colorTheme(),
                              margin: EdgeInsets.only(
                                left: 8,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 8,
                              ),
                              child: Text(
                                '搜索',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFA6B0C1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        print('搜索');
                        var key = utf8.encode('tiantianmanghe');
                        var bytes = utf8.encode("register_Mobile=18555215355");

                        var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
                        var digest = hmacSha256.convert(bytes);

                        print("HMAC digest as bytes: ${digest.bytes}");
                        print("HMAC digest as hex string: $digest");
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 14 * ratio(context),
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      color: colorTheme(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 120 * ratio(context),
              margin: EdgeInsets.only(
                top: 4 * ratio(context),
                left: 24,
                right: 24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: colorTheme(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                top: 16 * ratio(context),
                left: 24,
                right: 24,
              ),
              height: 72 * ratio(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 48 * ratio(context),
                        height: 48 * ratio(context),
                        color: colorTheme(),
                      ),
                      Container(
                        height: 16 * ratio(context),
                        width: 48 * ratio(context),
                        alignment: Alignment.center,
                        child: Text(
                          '功能模块',
                          style: TextStyle(
                            fontSize: 11 * ratio(context),
                            color: Color(0xFF060E1D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 48 * ratio(context),
                        height: 48 * ratio(context),
                        color: colorTheme(),
                      ),
                      Container(
                        height: 16 * ratio(context),
                        width: 48 * ratio(context),
                        alignment: Alignment.center,
                        child: Text(
                          '功能模块',
                          style: TextStyle(
                            fontSize: 11 * ratio(context),
                            color: Color(0xFF060E1D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 48 * ratio(context),
                        height: 48 * ratio(context),
                        color: colorTheme(),
                      ),
                      Container(
                        height: 16 * ratio(context),
                        width: 48 * ratio(context),
                        alignment: Alignment.center,
                        child: Text(
                          '功能模块',
                          style: TextStyle(
                            fontSize: 11 * ratio(context),
                            color: Color(0xFF060E1D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 48 * ratio(context),
                        height: 48 * ratio(context),
                        color: colorTheme(),
                      ),
                      Container(
                        height: 16 * ratio(context),
                        width: 48 * ratio(context),
                        alignment: Alignment.center,
                        child: Text(
                          '功能模块',
                          style: TextStyle(
                            fontSize: 11 * ratio(context),
                            color: Color(0xFF060E1D),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                top: 16 * ratio(context),
                left: 24,
                right: 24,
              ),
              height: 32 * ratio(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16 * ratio(context)),
                color: Color(0xFFFFF8E5),
              ),
              child: Row(
                children: [
                  Container(
                    height: 16 * ratio(context),
                    width: 16 * ratio(context),
                    margin: EdgeInsets.only(
                      left: 16 * ratio(context),
                    ),
                    color: colorTheme(),
                  ),
                  Container(
                    height: 16 * ratio(context),
                    margin: EdgeInsets.only(
                      left: 8 * ratio(context),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '新版APP即将上线，届时将会有超级大奖等待大家哦！',
                      style: TextStyle(
                        fontSize: 11 * ratio(context),
                        color: Color(0xFFFFB800),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                top: 24 * ratio(context),
              ),
              height: 132 * ratio(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 24 * ratio(context),
                    margin: EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text(
                            '最新开箱',
                            style: TextStyle(
                              fontSize: 17 * ratio(context),
                              color: Color(0xFF060E1D),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '排行榜',
                            style: TextStyle(
                              fontSize: 13 * ratio(context),
                              color: Color(0xFF060E1D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 24,
                    ),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(16 * ratio(context)),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          16,
                        ),
                        bottomLeft: Radius.circular(
                          16,
                        ),
                      ),
                      color: Color(0xFFF5F5F5),
                    ),
                    height: 100 * ratio(context),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                top: 24 * ratio(context),
                left: 24,
                right: 24,
              ),
              height: 132 * ratio(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24 * ratio(context),
                        child: Text(
                          '秒杀',
                          style: TextStyle(
                            fontSize: 17 * ratio(context),
                            color: Color(0xFF060E1D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 158 * ratio(context),
                        height: 100 * ratio(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16 * ratio(context)),
                          color: Color(0xFF4279FF),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 73 * ratio(context),
                              height: 92 * ratio(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12 * ratio(context)),
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: 73 * ratio(context),
                              height: 92 * ratio(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12 * ratio(context)),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24 * ratio(context),
                        child: Text(
                          '新品首发',
                          style: TextStyle(
                            fontSize: 17 * ratio(context),
                            color: Color(0xFF060E1D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 158 * ratio(context),
                        height: 100 * ratio(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16 * ratio(context)),
                          color: Color(0xFFE44FFA),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 73 * ratio(context),
                              height: 92 * ratio(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12 * ratio(context)),
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: 73 * ratio(context),
                              height: 92 * ratio(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12 * ratio(context)),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),









          //
          //
          //
          //
          //
          //
        ],
      ),
    );
  }
}
