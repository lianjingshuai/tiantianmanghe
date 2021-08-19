/*
 * @Description:  
 * @Author:  
 * @Date: 2021-05-20 14:38:04
 */
/*
 * @Description: 认真做事，踏实做人
 * @Author: 连京帅
 * @Date: 2019-10-14 12:37:57
 * @LastEditTime: 2021-07-25 17:26:42
 * @LastEditors: Please set LastEditors
 */
// import 'package:aplus/common/common_headers.dart';
import 'package:tiantianmanghe/tools/header.dart';
import 'package:tiantianmanghe/request/network/api.dart';
import 'package:tiantianmanghe/model/base_model.dart';
import 'dart:convert';

abstract class VRApi<R> extends Api<R> {
  VRApi() {
    baseUrl = "http://192.168.1.3:5088/";
    header = {
      'Accept': 'application/json',
    };
  }

  @override
  bool state({
    dynamic obj,
    dynamic isShowText,
    dynamic globalKey,
    dynamic context,
  }) {
    String resultNo = '0';
    Map? map;
    try {
      map = obj as Map;
      resultNo = map['msgcode'];
    } catch (e) {
      resultNo = '0';
    }

    if (int.parse(resultNo) != 1) {
      if (map!['msg'] != null) {
        if (isShowText != null && isShowText) {
          if (context != null) {
            showText(
              context: context,
              text: map['msg'].toString(),
            );
          }
        }
      }
    }

    return resultNo == -1 ? false : true;
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class VRApiUrl<R> extends VRApi<R> {
  // VR带看获取Token vrLeadSeeHouse
  static VRApiUrl vrLeadSeeHouse(params) => VRApiUrl<BaseModel>()
    ..path = ''
    ..body = params
    ..method = Method.POST
    ..dataConvert = (data) => BaseModel.fromJson(data);

  static VRApiUrl login(params) {
    String srt = json.encode(params);
    return VRApiUrl<BaseModel>()
      // ..path = 'user/login'
      ..path = ''
      ..body = params
      ..method = Method.GET
      ..dataConvert = (data) {
        String srt = json.encode(data);
        return BaseModel.fromJson(data);
      };
  }
}
