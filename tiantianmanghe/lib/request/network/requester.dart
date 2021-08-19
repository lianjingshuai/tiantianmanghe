//import 'package:dio/adapter.dart';
//import 'package:dio/adapter.dart';
//import 'package:dio/adapter.dart';
// import 'package:common_utils/common_utils.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'network.dart';
import 'package:meta/meta.dart';
// import 'package:aplus/common/utils/utils.dart';
import 'package:flutter/material.dart';
// import 'package:aplus/common/common_headers.dart';
import 'package:flutter/material.dart';
// import 'package:connectivity/connectivity.dart';
import 'package:tiantianmanghe/child_widget/show_dialog.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:common_utils/common_utils.dart';
/// @description 网络请求器
///
/// @author 燕文强
///
/// @date 2019-09-02
class Request {
  /// dio实例对象，外部不可访问
  static Dio? _dio;

  /// 日志打印开关，外部不可访问
  static bool _logEnable = false;

  /// api配置，外部可访问，不可修改
  final Api? api;

  /// 开始发出请求时的回调事件
  final Function(Api? api)? onStart;

  /// 网络响应成功，服务器处理业务成功
  final Function(ResponseData? response)? onSuccess;

  /// 网络响应成功，但服务器处理业务失败
  final Function(ResponseData? response)? onFail;

  /// 网络请求响应错误时候的回调事件
  final Function? onError;

  /// 当捕捉到错误时的回调事件
  final Function? onCatchError;

  /// 以上三种任意错误，都会走这个回调
  final Function(String s)? onArbitraryError;

  /// 网络请求完成后的回调事件
  final Function(Api? api)? onCompleted;

  /// 请求发出时的进度变化回调事件
  final Function(int? progress, int? total)? onSendProgress;

  /// 接收数据时的进度变化回调事件
  final Function(int? progress, int? total)? onReceiveProgress;

  /// 上下文，弹窗使用，传值为 null 时，则没有弹窗
  final BuildContext? context;

  /// 是否showLoading
  final bool? isShowLoading;

  /// 是否showText
  final bool? isShowText;

  // 透明
  bool? isNothingAtAll = false;

  /// 弹窗使用
  // final ScaffoldState scaffoldState;

  /// key GlobalKey _key = GlobalKey<ScaffoldState>();
  // final GlobalKey? globalKey;

  bool? isBack;

  /// 注册网络请求器，并注入拦截器
  static void register() {
    if (_dio == null) {
      _dio = new Dio();
      // if (interceptors == null) return;
      // for (var item in interceptors) {
      //   _dio.interceptors.add(item);
      // }
    }
  }

  /// 如果你想抓包，需要设置网络代理地址
  static void setProxyUrl(String? proxyUrl) {
    if (!_checkDio()) {
      return;
    }
    if (proxyUrl?.isNotEmpty ?? false) {
      (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return "PROXY $proxyUrl";
        };
        // 允许抓https包设置
        client.badCertificateCallback = (cert, host, port) => true;
      };
    }
  }

  static void clearProxyUrl() {
    if (!_checkDio()) {
      return;
    }
    (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = null;
  }

  /// 允许请求器的内部打印
  static void logEnable() {
    _logEnable = true;
  }

  Request({
    @required this.api,
    @required this.context,
    this.isShowLoading: false,
    this.isShowText: true,
    // this.scaffoldState,
    // @required this.globalKey,
    this.onStart,
    this.onSuccess,
    this.onFail,
    this.onError,
    this.onCatchError,
    this.onArbitraryError,
    this.onSendProgress,
    this.onReceiveProgress,
    this.onCompleted,
    this.isNothingAtAll: false,
    this.isBack: false,
  }) {
    if (api == null) {
      // if (_logEnable) logFormat('*** api must not null! ***');
      return;
    }

    // 网络请求
    if (_checkDio()) {
      _request();
    }

    // // 判断网络状态
    // getNetworkStatus();
  }

  // getNetworkStatus() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   {
  //     if (connectivityResult == ConnectivityResult.mobile) {
  //       // 网络类型为移动网络
  //       prefs.setString(NetworkStatus, NetworkStatusType.Network_mobile);
  //     } else if (connectivityResult == ConnectivityResult.wifi) {
  //       // 网络类型为WIFI NetworkStatus
  //       prefs.setString(NetworkStatus, NetworkStatusType.Network_wifi);
  //     } else if (connectivityResult == ConnectivityResult.none) {
  //       // 没有网络
  //       prefs.setString(NetworkStatus, NetworkStatusType.Network_none);
  //     }
  //   }

  //   {
  //     if (connectivityResult == ConnectivityResult.none) {
  //       hiddenLoading(context);
  //       Api.cancel();
  //       Api.cancelToken = CancelToken();
  //       if (isShowText != null && isShowText) {
  //         showText(
  //           text: '当前网络较差，请稍后再试',
  //           context: context,
  //           // scaffoldState: globalKey.currentState ?? null,
  //           globalKey: globalKey ?? null,
  //         );
  //       }
  //     }
  //   }
  // }

  static bool _checkDio() {
    if (_dio == null) {
      print('*** you must use Request.register(interceptors) static method initialization dio instance at first ***');
      return false;
    }
    return true;
  }

  /// 发出网络请求
  _request() async {
    String method = _method(api!.method);
    if (onStart != null) {
      onStart!(api);
    } else {
      // if (_logEnable) logFormat('*** start request ***');
    }

    // showLoading
    if (isShowLoading != null && isShowLoading!) {
      if (context != null) {
        showLoading(
          context: context!,
          // globalKey: globalKey!,
          isNothingAtAll: isNothingAtAll!,
          isBack: isBack!,
        );
      }
    }

    if (api?.body is FormData) {
      // 上传图片
    } else {
      // 实体转json
      String jsonStr = json.encode(api?.body);
      api?.body = json.decode(jsonStr);
      print('👇👇👇👇👇👇请求参数👇👇👇👇👇👇');
      print(api!.requestUrl());
      print(jsonStr);
      print(json.encode(api!.header));
      print('👆👆👆👆👆👆请求参数👆👆👆👆👆👆');
    }

    await _dio!.request(
      api!.requestUrl(),
      data: api!.method == Method.GET || api!.method == Method.DELETE ? null : api!.body,
      queryParameters: api!.method == Method.GET || api!.method == Method.DELETE ? api!.body : null,
      // 取消请求的标记
      cancelToken: Api.cancelToken,
      options: Options(
        method: method,
        // connectTimeout: api?.connectTimeout,
        sendTimeout: api?.sendTimeout,
        receiveTimeout: api?.receiveTimeout,
        headers: api?.header,
        // 响应数据类型设置为json
        responseType: ResponseType.json,
        // 以application/x-www-form-urlencoded格式发送数据
//        contentType: api.contentType,
        // 当状态错误时是否接收数据
        receiveDataWhenStatusError: true,
        // 允许重定向
        followRedirects: true,
        maxRedirects: 10000,
      ),
      onSendProgress: (p, t) {
        if (onSendProgress != null) {
          print('进度回调');
          onSendProgress!(p, t);
        }
      },
      onReceiveProgress: (p, t) {
        if (onReceiveProgress != null) {
          onReceiveProgress!(p, t);
        }
      },
    ).then((response) {
      var result = response.toString();
      LogUtil.d('请求结果：$result');
      if (isShowLoading != null && isShowLoading!) {
        if (context != null) {
          hiddenLoading(context!);
        }
      }
      if (api?.dataConvert == null) {
        api?.dataConvert = (data) {
          return data;
        };
      }
      dynamic data = api?.dataConvert!(response.data);
      if (api?.state(
        obj: response.data,
        isShowText: isShowText ?? null,
        context: context ?? null,
        // scaffoldState: globalKey.currentState ?? null,
        // globalKey: globalKey ?? null,
      ) as bool) {
        if (onSuccess != null) {
          print('成功回调');
          onSuccess!(ResponseData(metadata: response, data: data));
        }
      } else {
        if (onFail != null) {
          onFail!(ResponseData(metadata: response, data: data));
        }
        if (onArbitraryError != null) {
          onArbitraryError!(response.data['RMessage'] ??
              response.data['ErrorMsg'] ??
              response.data['Message'] ??
              response.data['message'] ??
              '请求失败');
        }
      }
    }, onError: (error) {
      if (isShowLoading != null && isShowLoading!) {
        if (context != null) {
          hiddenLoading(context!);
        }
      }
      if (isShowText != null && isShowText!) {
        String errorMessage = '';
        if (error.type == DioErrorType.connectTimeout) {
          errorMessage = '请求超时';
        } else if (error.type == DioErrorType.sendTimeout) {
          errorMessage = '请求超时';
        } else if (error.type == DioErrorType.receiveTimeout) {
          errorMessage = '请求超时';
        } else if (error.type == DioErrorType.response) {
          errorMessage = '服务器内部错误';
        } else if (error.type == DioErrorType.cancel) {
          errorMessage = '请求已取消';
        } else if (error.type == DioErrorType.other) {
          if (error is DioError) {
            DioError dioError = error;
            if (dioError.error is SocketException) {
              SocketException socketException = dioError.error;
              if (socketException.osError is OSError) {
                OSError osError = socketException.osError!;
                if (osError.errorCode == 51 || osError.errorCode == 101) {
                  errorMessage = '当前网络较差，请稍后再试';
                } else if (osError.errorCode == 61) {
                  errorMessage = '服务器内部错误';
                } else if (osError.errorCode == 8) {
                  errorMessage = '未知';
                } else {
                  if (osError.message != null) {
                    errorMessage = osError.message;
                  }
                }
              }
            }
          }
        }
        if (context != null) {
          if (errorMessage != '请求已取消' && errorMessage != '未知') {
            showText(
              context: context!,
              text: errorMessage.length == 0 ? error.toString() : errorMessage,
            );
          }
        }
      }
      if (onError != null) {
        onError!(error.toString());
      }
      if (onArbitraryError != null) {
        if (error.type != DioErrorType.cancel) {
          onArbitraryError!(error.toString());
        }
      }
      if (_logEnable) print('*** request error : $error ***');
    }).catchError((error) {
      if (isShowLoading != null && isShowLoading!) {
        if (context != null) {
          hiddenLoading(context!);
        }
      }
      if (isShowText != null && isShowText!) {
        if (context != null) {
          showText(
            context: context!,
            text: error.toString(),
            // scaffoldState: globalKey.currentState ?? null,
          );
        }
      }
      if (onCatchError != null) {
        onCatchError!(error.toString());
      }
      if (onArbitraryError != null) {
        if (error.type != DioErrorType.cancel) {
          onArbitraryError!(error.toString());
        }
      }
      if (_logEnable) print('*** catch error : $error ***');
    }).whenComplete(() {
      if (onCompleted != null) {
        onCompleted!(api);
      }
      if (_logEnable) print('*** request done! ***');
    });
  }

  /// Method 类型转换成 String 类型
  String _method(Method method) {
    String result = 'POST';
    switch (method) {
      case Method.GET:
        result = 'GET';
        break;
      case Method.POST:
        result = 'POST';
        break;
      case Method.PUT:
        result = 'PUT';
        break;
      case Method.DELETE:
        result = 'DELETE';
        break;
      case Method.HEAD:
        result = 'HEAD';
        break;
      case Method.PATCH:
        result = 'PATCH';
        break;
      default:
        result = 'POST';
        break;
    }
    return result;
  }
}
