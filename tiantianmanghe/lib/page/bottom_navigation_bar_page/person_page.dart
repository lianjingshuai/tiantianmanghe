/*
 * @Description:  
 * @Author:  
 * @Date: 2021-08-17 12:42:22
 */

// import 'package:tiantianmanghe/tools/header.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qiniu_flutter_sdk/qiniu_flutter_sdk.dart'; // 七牛云存储

class PersonPage extends StatefulWidget {
  @override
  _PersonState createState() {
    return _PersonState();
  }
}

class _PersonState extends State<PersonPage> {
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
        title: Text('我的'),
      ),
      body: Container(
        color: Colors.white,
        child: GestureDetector(
          child: Container(
            color: Colors.red,
            width: 100,
            height: 50,
            child: Text('data'),
          ),
          onTap: () {
            shangchauntupian();
          },
        ),
      ),
    );
  }

  shangchauntupian() {
    // 创建 storage 对象
    Storage storage = Storage();
    // 使用 storage 的 putFile 对象进行文件上传
    storage.putFile(File('/Users/lianjingshuai/Desktop/123.png'), 'TOKEN')
      ..then((value) {
        print(value);
      })
      ..catchError((onError) {
        print(onError);
      });
  }
}
