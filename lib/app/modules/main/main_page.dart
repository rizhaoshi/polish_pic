import 'dart:math';

import 'package:flutter/material.dart';
import 'package:polish_pic/common/config/config.dart';
import 'package:get/get.dart';
import 'package:polish_pic/common/widget/glass_widget.dart';
import 'package:polish_pic/common/widget/grid_item.dart';
import '../../../common/model/enum.dart';
import '../../../common/widget/navigator_widget.dart';
import 'main_controller.dart';

class MainPage extends GetView<MainController> {
  MainPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Container(
        width: 300,
        color: Colors.orange,
      ),
      drawerEdgeDragWidth: 0.0,
      drawerScrimColor: Colors.white.withOpacity(0.6),
      body: SafeArea(
          top: false,
          bottom: false,
          child: GlassWidget(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50 + MediaQuery.of(context).padding.top),
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Scrollbar(
                          thumbVisibility: true,
                          thickness: 2.5,
                          radius: const Radius.circular(3),
                          child: SingleChildScrollView(
                              child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: const Text("3D卡通风",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ))),
                                Container(
                                  width: double.infinity,
                                  height: 140,
                                  child: GridView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: cartoonItemModels.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisSpacing: 10, childAspectRatio: 0.8),
                                      itemBuilder: (context, index) {
                                        if (index >= cartoonItemModels.length) {
                                          return Container();
                                        }
                                        return MainGirdItem(enhancerItemModel: cartoonItemModels[index]);
                                      }),
                                ),
                              ],
                            ),
                          )))),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: NavigatorBar(
                      type: NavigatorBarType.NavigatorBarType_Mainpage,
                      menuButtonCallBack: () {
                        _globalKey.currentState?.openDrawer();
                      },
                      title: "Polish Pic",
                    ))
              ],
            ),
          )),
    );
  }
}
