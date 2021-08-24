/*
 * @Description: 认真做事，踏实做人
 * @Author: 连京帅
 * @Date: 2019-06-28 11:14:59
 * @LastEditTime: 2021-08-20 09:39:09
 * @LastEditors: Please set LastEditors
 */
// import 'package:aplus/common/common_headers.dart';
import 'package:flutter/material.dart';
import 'package:tiantianmanghe/tools/header.dart';
// import 'dart:ui';

// 类名首字母大写，用驼峰命名法，如果是界面最是是Page.dart，如果是封装的公用控件用Widget.dart结尾
// 方法名首字母小写，用驼峰命名法

// 顶级变量👇👇👇👇👇👇👇👇👇👇
// double screenWidth0 = MediaQueryData.fromWindow(window).size.width;
// double screenHeight0 = MediaQueryData.fromWindow(window).size.height;
// double ratio0 = screenWidth0 / 375.0;
// double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
// double safeAreaHeight = MediaQueryData.fromWindow(window).padding.bottom;

/*
 * 👇👇👇把异步实体设置为顶级变量
 */
/// 持久化存储
SharedPreferences? prefs;

/// 包信息
PackageInfo? packageInfo;

/// 获取临时目录 getTemporaryDirectory()
Directory? temporaryDirectory;

/// 是否支持震动
bool? canVibrate;

/// 获取应用文档目录 getApplicationDocumentsDirectory()
/// 获取外部存储目录 getExternalStorageDirectory()
/// 请求token

// 导航栏高度
double appBarHeight = AppBar().preferredSize.height;
// 屏幕宽度
double screenWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width > 1200.0) {
    return 1200.0;
  }else {
    return MediaQuery.of(context).size.width;
  }
}
double screenWidthMax(BuildContext context) => MediaQuery.of(context).size.width;

// 屏幕高度
double screenHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  if (height < 600.0) {
    return 600.0;
  }else {
    return MediaQuery.of(context).size.height;
  }
}
double screenHeightMax(BuildContext context) => MediaQuery.of(context).size.height;

// // 屏幕适配的比例，按照iPhone6s的屏幕为基础
double ratio(BuildContext context) => screenWidth(context) / 375.0;
// 状态栏高度
double constStatusBarHeight = 0.0;
double statusBarHeight(BuildContext context) {
  double top = MediaQuery.of(context).padding.top;
  if (top != null && top != 0.0) {
    constStatusBarHeight = top;
  }
  return constStatusBarHeight;
}
    
// 底部安全高度，如iPhoneX的底部安全高度
double constsafeAreaHeight = 0.0;
double safeAreaHeight(BuildContext context) {
  double bottom = MediaQuery.of(context).padding.bottom;
  if (bottom != null && bottom != 0.0) {
    constsafeAreaHeight = bottom;
  }
  return constsafeAreaHeight;
}
    
// body高度，减去了 状态栏高度 导航栏高度 底部安全高度
bodyHeight(BuildContext context) => (screenHeight(context) - statusBarHeight(context) - appBarHeight - safeAreaHeight(context));

// /*
//  * 👇👇👇字号
//  */
// // 主要字号大小
// fontSizeMain(BuildContext context) => 15;
// // 大号字号
// fontSizeBig(BuildContext context) => 16;
// // 最大字号
// fontSizeMax(BuildContext context) => 18;
// // 小号字号
// fontSizeSmall(BuildContext context) => 12;
// // 最小字号
// fontSizeMin(BuildContext context) => 11;
fontSize14(BuildContext context) => 14;
fontSize12(BuildContext context) => 12;
fontSize18(BuildContext context) => 18;
fontSize17(BuildContext context) => 17;
fontSize16(BuildContext context) => 16;
fontSize15(BuildContext context) => 15;

// /*
//  * 👇👇👇高度
//  */
// // 列表高度包括分割线
// heightListOverall(BuildContext context) => 44;
// // 列表高度不包括分割线
// heightListItem(BuildContext context) => 43;
// // 列表分割线高度
// heightListLine(BuildContext context) => 1;
// height50(BuildContext context) => 50;
// height49(BuildContext context) => 49;
// height1(BuildContext context) => 1;

// /*
//  * 👇👇👇边距
//  */
// // 宽边距
// boundaryBroad(BuildContext context) => 15;
// // 窄边距
// boundaryNarrow(BuildContext context) => 10;
// // 边框16
// boundary16(BuildContext context) => 16;

// /*
//  * 👇👇👇圆角
//  */
// // 主要圆角大小
// radianSizeMain(BuildContext context) => 5;
// radianSizeBig(BuildContext context) => 3;
// radianSizeSmall(BuildContext context) => 8;

/*
 * 👇👇👇颜色
 */

// 主题色背景色
colorTheme() => Color(0xFFFFD569);
// // 主题色红色
// colorThemeRed() => Colors.red;
// bottomItemCancelButtonColor() => Color(0xFF2187FF);
// // 主题色红色
// colorThemeWhite() => Colors.white;
// // 文字颜色主要
// colorTextMain() => Color(0xFF333333);
// // 文字颜色浅色
// colorTextLight() => Color(0xFF676767);
// // 文字颜色最浅
// colorTextLightEst() => Color(0xFF999999);
// // 主要分割线颜色
// colorLineMain() => Color(0xFFF5F5F9);
// // 主要边框颜色
// colorRimMain() => Color(0xFFD6D6D6);
// 黑色透明
colorTransparent() => Color(0x66000000);
color0xFF2F3A45() => Color(0xFF2F3A45);
color0xFF666666() => Color(0xFF666666);
color0xFFE73C38() => Color(0xFFE73C38);
color0xFF2A3137() => Color(0xFF2A3137);
color0xFF999999() => Color(0xFF999999);
color0xFF333333() => Color(0xFF333333);
color0xFFF5F5F9() => Color(0xFFF5F5F9); // 分割线
color0xFFFF3333() => Color(0xFFFF3333);
color0xFF060E1D() => Color(0xFF060E1D);
color0xFF504F50() => Color(0xFF504F50);
color0xFF3391FF() => Color(0xFF3391FF);
color0xFFE5E5E5() => Color(0xFFE5E5E5); // 分割线
color0xFFFF5252() => Color(0xFFFF5252);
color0xFF5CDA8C() => Color(0xFF5CDA8C);
color0xFFECECEC() => Color(0xFFECECEC);
color0xFF4A4A4A() => Color(0xFF4A4A4A);
color0xFF383838() => Color(0xFF383838);
color0xFFB2B2B2() => Color(0xFFB2B2B2);
color0xFFFFF3F3() => Color(0xFFFFF3F3);
color0xFF9B9B9B() => Color(0xFF9B9B9B);
color0xFF949BC0() => Color(0xFF949BC0);

/*
 * 👇👇👇 设置状态栏
 */
/// 设置状态栏颜色 https://www.jianshu.com/p/b931c05b0df9
/// 在没有appBar的时候
/// SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
/// 在有appBar的时候
/// Scaffold(
///   appBar: AppBar(brightness: Brightness.dark)
/// );

// 显示状态栏和虚拟按键
statusBar() {
  return SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
}
