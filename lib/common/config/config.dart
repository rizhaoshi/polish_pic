import 'package:flutter/material.dart';
import 'package:polish_pic/common/model/enum.dart';
import 'package:polish_pic/common/model/image_enhancer_item.dart';

final Color textGreyColor = Color.fromRGBO(151, 158, 168, 1);
final Color textBlackColor = Color.fromRGBO(69, 80, 97, 1);
final Color commonGreenColor = Color.fromRGBO(195, 221, 83, 1);
final Color commonOrangeColor = Color.fromRGBO(227, 128, 101, 1);
final Color bgGrayColor = Color.fromRGBO(236, 236, 236, 1);
final Color itemGrayColor = Color.fromRGBO(238, 238, 239, 1);
final Color navigatorItemGrayColor = Color.fromRGBO(120, 120, 120, 1);
final Color seperatorLineColor = Color.fromRGBO(198, 198, 198, 1);

List<ImageEnhancerItemModel> cartoonItemModels = [
  ImageEnhancerItemModel(
      imageEnhancerType: ImageEnhancerType.Image_Pks,
      title: "皮克斯",
      subTitle: "皮克斯",
      description: '',
      bgImage: "exhibition/enhanced/皮克斯_11",
      smallImage: "exhibition/origin/漫画风_1"),
  ImageEnhancerItemModel(
      imageEnhancerType: ImageEnhancerType.Image_Angel,
      title: "天使",
      subTitle: "天使",
      description: '',
      bgImage: "exhibition/enhanced/天使_11",
      smallImage: "exhibition/origin/漫画风_1"),
  ImageEnhancerItemModel(
      imageEnhancerType: ImageEnhancerType.Image_Demon,
      title: "恶魔",
      subTitle: "恶魔",
      description: '',
      bgImage: "exhibition/enhanced/恶魔_11",
      smallImage: "exhibition/origin/漫画风_1"),
  ImageEnhancerItemModel(
      imageEnhancerType: ImageEnhancerType.Image_Pop,
      title: "波普风",
      subTitle: "波普风",
      description: '',
      bgImage: "exhibition/enhanced/波普_11",
      smallImage: "exhibition/origin/漫画风_1"),
  ImageEnhancerItemModel(
      imageEnhancerType: ImageEnhancerType.Image_UkiyoE,
      title: "浮世绘",
      subTitle: "浮世绘",
      description: '',
      bgImage: "exhibition/enhanced/浮世绘_11",
      smallImage: "exhibition/origin/漫画风_1"),
];
