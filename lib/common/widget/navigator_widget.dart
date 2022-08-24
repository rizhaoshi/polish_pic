import 'package:flutter/material.dart';
import 'package:polish_pic/common/widget/glassmorphic_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polish_pic/utils/common_util.dart';
import 'package:get/get.dart';
import 'package:polish_pic/common/config/config.dart';
import '../model/enum.dart';

class NavigatorBar extends StatelessWidget {
  final NavigatorBarType type;
  final String? title;
  final double? height;

  final Function? menuButtonCallBack;

  NavigatorBar({this.type = NavigatorBarType.NavigatorBarType_Default, this.title, this.height = 50.0, this.menuButtonCallBack});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicFlexCustomContainer(
      borderRadius: 0,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0x00ffffff).withOpacity(0.6), const Color(0x00ffffff).withOpacity(0.4)],
          stops: const [0.1, 1]),
      border: 0,
      blur: 20,
      borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0x00ffffff).withOpacity(0.5), const Color(0x00ffffff).withOpacity(0.5)],
          stops: const [0.1, 1]),
      child: Container(
        width: double.infinity,
        height: height! + MediaQuery.of(context).padding.top,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                alignment: Alignment.center,
                child: Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: (type == NavigatorBarType.NavigatorBarType_Mainpage ? 24 : 20)),
                )),
            type == NavigatorBarType.NavigatorBarType_Default
                ? Positioned(
                    left: 10,
                    top: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: height,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          CommonUtils.getSvgImageByName("public_arrow_left"),
                          color: navigatorItemGrayColor,
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ))
                : Container(),
            type == NavigatorBarType.NavigatorBarType_Mainpage
                ? Positioned(
                    left: 10,
                    top: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        menuButtonCallBack?.call();
                      },
                      child: Container(
                        width: height,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          CommonUtils.getSvgImageByName("menu"),
                          color: navigatorItemGrayColor,
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }
}
