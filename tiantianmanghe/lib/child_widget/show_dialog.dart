/*
 * @Description: 认真做事，踏实做人
 * @Author: 连京帅
 * @Date: 2019-06-27 16:59:29
 * @LastEditTime: 2021-08-17 10:01:25
 * @LastEditors: Please set LastEditors
 */
// import 'package:aplus/common/common_headers.dart';
// import 'package:aplus/page/child_widget/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tiantianmanghe/tools/variables.dart';
import 'my_cupertino_activity_indicator.dart';
import 'package:tiantianmanghe/request/network/api.dart';
// import 'package:intl/intl.dart';          // 国际化部分
// import 'package:marvel/common/page.dart';

int dfohjeoihjbdslkfnf = 0;
showLoading({
  // 上下文
  @required BuildContext? context,
  // 透明
  bool isNothingAtAll = false,
  bool isBack = false,
  // 文本
  String? text,
  // 是否可取消
  bool? barrierDismissible,
}) {
  hiddenLoading(context!);
  dfohjeoihjbdslkfnf = 1;
  if (text == null || text.length == 0) {
    text = '正在加载';
  }
  showGeneralDialog(
    context: context,
    barrierLabel: "加载动画",
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    transitionDuration: Duration(milliseconds: 1),
    pageBuilder: (BuildContext contextt, Animation animation, Animation secondaryAnimation) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: GestureDetector(
          child: Container(
            color: Colors.transparent,
            child: Material(
              color: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: statusBarHeight(context),
                      ),
                      height: appBarHeight,
                      width: 50,
                      color: Colors.transparent,
                    ),
                    onTap: () {
                      if (isBack) {
                        hiddenLoading(context);
                        hiddenOverload(context);
                        loadingPop(
                          context: context,
                        );
                      }
                    },
                  ),
                  isNothingAtAll == false
                      ? Center(
                          child: DecoratedBox(
                            position: DecorationPosition.background,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              // color: Colors.black.withOpacity(0.7),
                              color: Colors.transparent,
                            ),
                            child: Container(
                              width: screenWidth(context),
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    child: DecoratedBox(
                                      position: DecorationPosition.background,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        color: Color(0xFF333333),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xaa000000),
                                            offset: Offset(
                                              0,
                                              3,
                                            ),
                                            blurRadius: 7,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 18,
                                            ),
                                            child: MyCupertinoActivityIndicator(
                                              radius: 10,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 8,
                                              right: 18,
                                            ),
                                            height: 40,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              text!,
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: Color(0xFFC7C7CF),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Container(
                            //   width: 100,
                            //   height: 100,
                            //   child: Column(
                            //     children: <Widget>[
                            //       Padding(
                            //         padding: EdgeInsets.only(top: 25, bottom: 10),
                            //         child: MyCupertinoActivityIndicator(
                            //           radius: 15,
                            //         ),
                            //       ),
                            //       Text(
                            //         text,
                            //         style:
                            //             TextStyle(color: Colors.white, fontSize: 14),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          onTap: () {
            // 点击可取消
            if (barrierDismissible != null && barrierDismissible == true) {
              hiddenLoading(context);
            }
          },
        ),
      );
    },
  );
}

hiddenLoading(BuildContext context) {
  if (dfohjeoihjbdslkfnf != 0) {
    Navigator.pop(context);
    dfohjeoihjbdslkfnf = 0;
  }
}

int dfotyiofdhjslkfnf = 0;
showOverload({
  // 上下文
  @required BuildContext? context,
  // key
  @required GlobalKey? globalKey,
  // 文本
  String? text,
  // 点击事件
  @required Function? onTap,
  // 返回事件
  Function? backResponse,
}) {
  hiddenLoading(context!);
  hiddenOverload(context);
  dfotyiofdhjslkfnf = 1;
  if (text == null || text.length == 0) {
    text = '正在加载';
  }
  showGeneralDialog(
    context: context,
    barrierLabel: "加载动画",
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    transitionDuration: Duration(milliseconds: 1),
    pageBuilder: (BuildContext contextt, Animation animation, Animation secondaryAnimation) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: GestureDetector(
          child: Container(
            color: Colors.white,
            child: Material(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  AppBar(
                    flexibleSpace: flexibleSpace(),
                    elevation: 0,
                    centerTitle: true,
                    leading: leading(onPressed: () {
                      hiddenLoading(context);
                      hiddenOverload(context);
                      if (backResponse != null) {
                        backResponse();
                      } else {
                        loadingPop(
                          context: context,
                        );
                      }
                    }),
                  ),
                  Center(
                    child: Container(
                      width: screenWidth(context),
                      height: screenWidth(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 160,
                            height: 160,
                            child: Image(
                              image: AssetImage(
                                'images/new_images/LoadMoreImages.png',
                              ),
                              width: 160,
                              height: 160,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            height: 20,
                            // margin: EdgeInsets.only(
                            //   top: 20,
                            // ),
                            child: Text(
                              '轻触屏幕重新加载',
                              style: TextStyle(
                                fontSize: fontSize14(context),
                                color: Color(0xFFc9ced2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            // 点击可取消
            onTap!();
          },
        ),
      );
    },
  );
}

hiddenOverload(BuildContext context) {
  if (dfotyiofdhjslkfnf != 0) {
    Navigator.pop(context);
    dfotyiofdhjslkfnf = 0;
  }
}

showText({
  required String text,
  required BuildContext context,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 1500),
      content: Text(text),
    ),
  );
}

//
loadingPop({
  @required BuildContext? context,
}) {
  Api.cancel();
  Api.cancelToken = CancelToken();
  hiddenLoading(context!);
  hiddenOverload(context);

  if (Navigator.canPop(context)) {
    Navigator.of(context).pop();
  } else {
    print('🍉🍉🍉🍉🍉🍉');
    print('不能再返回了');
    print('🍉🍉🍉🍉🍉🍉');
  }
}

noDataWidget(
  BuildContext context, {
  bool visible = true,
}) {
  return Visibility(
    visible: visible,
    child: Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(
          bottom: appBarHeight + statusBarHeight(context),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                  'images/new_images/notHaveData.png',
                ),
                height: 160,
                width: 160,
                fit: BoxFit.contain,
              ),
              Container(
                height: 40,
                alignment: Alignment.topCenter,
                child: Text(
                  '暂无数据',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFC9CED2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

flexibleSpace({
  bool isLine = true,
  Color? color,
}) {
  return Stack(
    children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: isLine
            ? <Widget>[
                Container(
                  height: 0.5,
                  color: color == null ? color0xFFE5E5E5() : color,
                ),
              ]
            : <Widget>[],
      ),
    ],
  );
}

// void toast(
//   BuildContext context,
//   String msg, {
//   int gravity = 1,
//   int duration = 2,
//   Color backgroundColor = const Color(0xAA000000),
//   Color textColor = Colors.white,
//   double backgroundRadius = 20,
//   Border? border,
// }) {
//   Toast.show(msg, context,
//       duration: duration,
//       gravity: gravity,
//       backgroundColor: backgroundColor,
//       textColor: textColor,
//       backgroundRadius: backgroundRadius,
//       border: border);
// }

leading({
  String imageName = 'images/new_images/back_black.png',
  Function? onPressed,
  bool isShowBack = true,
}) {
  return Builder(
    builder: (context) {
      return Offstage(
        offstage: !isShowBack,
        child: Container(
          child: IconButton(
            icon: Image(
              image: AssetImage(
                imageName,
              ),
              width: 9,
              height: 16,
            ),
            onPressed: () {
              onPressed != null ? onPressed() : Navigator.of(context).pop();
            },
          ),
        ),
      );
    },
  );
}
