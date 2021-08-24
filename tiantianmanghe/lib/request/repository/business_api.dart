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

abstract class BusinessApi<R> extends Api<R> {
  BusinessApi() {
    baseUrl = "http://47.242.14.242/";
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
    print(obj);
    String resultNo = '0';
    Map? map;
    try {
      map = obj as Map;
      resultNo = map['respCode'];
    } catch (e) {
      resultNo = '0';
    }

    if (resultNo != '9999') {
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

    // ignore: unrelated_type_equality_checks
    return resultNo == -1 ? false : true;
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class BusinessApiUrl<R> extends BusinessApi<R> {
  // VR带看获取Token vrLeadSeeHouse
  // static VRApiUrl vrLeadSeeHouse(params) => VRApiUrl<BaseModel>()
  //   ..path = ''
  //   ..body = params
  //   ..method = Method.POST
  //   ..dataConvert = (data) => BaseModel.fromJson(data);

  static BusinessApiUrl login(params) {
    // String srt = json.encode(params);
    return BusinessApiUrl<BaseModel>()
      ..path = 'manghe_account/loginSendMessage'
      ..body = params
      ..method = Method.POST
      ..dataConvert = (data) {
        String srt = json.encode(data);
        return BaseModel.fromJson(data);
      };
  }
}
