/*
 * @Description:  
 * @Author:  
 * @Date: 2021-08-17 11:35:06
 */

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
      appBar: AppBar(
        brightness: Brightness.dark,
        flexibleSpace: Container(
          margin: EdgeInsets.only(
            left: 12 * ratio(context),
            right: 12 * ratio(context),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            height: appBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    '天天盲盒',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xAAFFFFFF),
                  ),
                  width: 230 * ratio(context),
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xAAFF6666),
                          ),
                          height: 30,
                          width: 50 * ratio(context),
                          alignment: Alignment.center,
                          child: Text(
                            '搜索',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
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
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    '客服',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
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
              // child: Container(
              //   height: 100 * ratio(context),
              //   width: screenWidth(context),
              //   color: Colors.orange,
              // ),
              ),
        ],
      ),
    );
  }
}
