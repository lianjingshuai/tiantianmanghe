/*
 * @Description: 👉😀😁🤣😂😄😅😆👈
 * @Author: 连京帅
 * @Date: 2020-04-08 10:29:20
 * @LastEditTime: 2021-07-22 15:00:35
 * @LastEditors: Please set LastEditors
 */
import 'dart:io';
import 'package:dio/dio.dart';

final int TimeOut = 10000;
/// @description Api基类约束
///
/// @author 燕文强
///
/// @date 2019-09-02
abstract class Api<R> {
  /// 域名Url
  String baseUrl = '';
  bool isBaseUrl = true;

  /// 后半路径
  String path = '';

  /// 请求头
  Map<String, dynamic>? header;

  /// 请求体
  dynamic body;

  /// 请求方式
  Method method = Method.POST;

  /// 以application/x-www-form-urlencoded格式发送数据
//  ContentType contentType = ContentType.parse("application/x-www-form-urlencoded");
//  ContentType contentType = ContentType.parse("application/json");

  ContentType contentType = ContentType.json;

  /// 连接超时时间
  int connectTimeout = TimeOut;

  /// 发送超时时间
  int sendTimeout = TimeOut;

  /// 接收超时时间
  int receiveTimeout = TimeOut;

  /// 取消请求的标记,每个请求对应一个
  static CancelToken cancelToken = CancelToken();

  /// 取消请求
  static void cancel() {
    return Api.cancelToken.cancel('cancel');
  }

  /// 获取请求的完整地址 '$baseUrl$path'
  String requestUrl() {
    if (isBaseUrl) {
      return baseUrl + path;
    } else {
      return path;
    }
  }

  /// 定义什么是业务处理成功状态
  bool state({
    dynamic obj,
    dynamic isShowText,
    dynamic globalKey,
    dynamic context,
  });

  /// 转json
  Map<String, dynamic> toJson();

  /// 数据转换
  R Function(dynamic data)? dataConvert;

  @override
  String toString() {
    String reqUrl = requestUrl();
    return 'Api{requestUrl: $reqUrl, body: $body, method: $method}';
  }
}

/// 网络请求方式枚举
enum Method { GET, POST, PUT, DELETE, HEAD, PATCH }
