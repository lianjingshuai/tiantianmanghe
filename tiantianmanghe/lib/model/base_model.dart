/*
 * @Description: 👉😀😁🤣😂😄😅😆👈
 * @Author: 连京帅
 * @Date: 2020-04-08 10:29:20
 * @LastEditTime: 2021-07-22 14:09:58
 * @LastEditors: Please set LastEditors
 */
class BaseModel {
  // "{"Flag":true,"ErrorMsg":null,"RunTime":null}"

  int? rCode;
  String? rMessage;
  dynamic result;
  int? total;
  bool? flag;
  String? errorMsg;
  String? runTime;
  String? inquiryKeyId;

  BaseModel({
    this.rCode,
    this.rMessage,
    this.result,
    this.total,
    this.flag,
    this.errorMsg,
    this.runTime,
    this.inquiryKeyId,
  });

  BaseModel.fromJson(Map<String, dynamic> json) {
    rCode = json['RCode'];
    rMessage = json['RMessage'];
    result = json['Result'];
    total = json['Total'];
    flag = json['Flag'];
    errorMsg = json['ErrorMsg'];
    runTime = json['RunTime'];
    inquiryKeyId = json['InquiryKeyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RCode'] = this.rCode;
    data['RMessage'] = this.rMessage;
    data['Result'] = this.result;
    data['Total'] = this.total;
    data['Flag'] = this.flag;
    data['ErrorMsg'] = this.errorMsg;
    data['RunTime'] = this.runTime;
    data['InquiryKeyId'] = this.inquiryKeyId;
    return data;
  }
}
