/*
 * @Description:  
 * @Author:  
 * @Date: 2021-08-17 10:06:13
 */
// import 'package:flutter/material.dart';
import 'package:tiantianmanghe/tools/header.dart';

class BasicFunction {

  // 👇👇👇网络配置
  static networkConfiguration() {
    Request.register();
  }

  // 👇👇👇启动判断
  static Future<Null> startJudgment() async {
    if (packageInfo == null) {
      packageInfo = await PackageInfo.fromPlatform();
    }
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    // // 首次启动
    // var _carousel = prefs.getBool(EnumKey.IsFirstStart);
    // // 是否登录
    // var _login = prefs.getBool(EnumKey.IsLogin);
    // // 是否设置手势密码
    // var _gesture = prefs.getBool(EnumKey.IsGesture);
  }
}
