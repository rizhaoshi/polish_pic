import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:polish_pic/app/modules/red_envelope/red_envelope_controller.dart';
import 'package:polish_pic/utils/common_util.dart';

class RedEnvelopePage extends GetView<RedEnvelopeController> {
  const RedEnvelopePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新年红包'),
        backgroundColor: Colors.red,
      ),
      body: const RreEnvelopeView(),
    );
  }
}

class RreEnvelopeView extends StatefulWidget {
  const RreEnvelopeView({Key? key}) : super(key: key);

  @override
  State<RreEnvelopeView> createState() => _RreEnvelopeViewState();
}

class _RreEnvelopeViewState extends State<RreEnvelopeView> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  late AnimationController upController;
  late Animation<double> upAnimation;

  double scrollViewMarginTop = 800.0;

  Widget _renderFrontWidget() {
    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24)), color: Colors.red),
      width: 300,
      height: 360,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
              left: 0,
              right: 0,
              top: 60,
              child: Text(
                "新年發發發",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600, color: Color.fromRGBO(251, 253, 197, 1)),
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: ScaleTransition(
                scale: animation,
                child: Image.asset(
                  CommonUtils.getImageAssetByName("open"),
                  width: 200,
                  height: 200,
                ),
              )),
        ],
      ),
    );
  }

  Widget _renderBackWidget() {
    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24)), color: Colors.red),
      width: 300,
      height: 360,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Stack(children: [
            const Positioned(
                right: 0,
                left: 0,
                top: 28,
                child: Text("恭喜您获得3个大红包",
                    textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(255, 248, 234, 1), fontWeight: FontWeight.w600, fontSize: 20))),
            Positioned(
                right: 0,
                left: 0,
                top: scrollViewMarginTop,
                child: Container(
                  height: 252,
                  child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: _renderCouponColumn(),
                      )),
                ))
          ]),
          Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              top: 140,
              child: Container(
                height: 100,
                child: Image.asset(
                  CommonUtils.getImageAssetByName("redbag"),
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }

  Widget _renderCouponColumn() {
    List<Widget> widgets = [];
    for (int i = 0; i < 3; i++) {
      widgets.add(Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 12),
        height: 75,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Color.fromRGBO(253, 244, 237, 1)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: double.infinity,
                                child: const Text(
                                  "大红包",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Color.fromRGBO(83, 3, 5, 1), fontWeight: FontWeight.w600, fontSize: 16),
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 5),
                                width: double.infinity,
                                child: const Text(
                                  "2022.08.24--2023.2.24",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Color.fromRGBO(83, 3, 5, 1), fontWeight: FontWeight.w400, fontSize: 12),
                                )),
                          ],
                        ))),
                Container(
                    margin: const EdgeInsets.only(left: 4, right: 16),
                    child: const Text(
                      '9999.99 元',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Color.fromRGBO(234, 34, 34, 1), fontWeight: FontWeight.w600, fontSize: 16),
                    ))
              ],
            )
          ],
        ),
      ));
    }
    widgets.add(const SizedBox(height: 75));
    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: widgets);
  }

  @override
  void initState() {
    super.initState();
    //创建 AnimationController
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))..repeat(reverse: true);
    //申明动画曲线并创建动画
    animation = Tween(begin: 1.0, end: 1.2).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    //创建 AnimationController
    upController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    //申明动画曲线并创建动画
    upAnimation = Tween(begin: 800.0, end: 75.0).animate(CurvedAnimation(parent: upController, curve: Curves.linearToEaseOut))
      ..addListener(() {
        setState(() {
          scrollViewMarginTop = upAnimation.value;
        });
      });
    Future.delayed(const Duration(milliseconds: 500),(){
      upController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        alignment: Alignment.center,
        child: _renderBackWidget(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
