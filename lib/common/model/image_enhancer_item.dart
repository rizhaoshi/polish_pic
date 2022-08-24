import 'package:flutter/material.dart';

import 'package:polish_pic/common/model/enum.dart';

class ImageEnhancerItemModel {
  final ImageEnhancerType imageEnhancerType;
  final String? title;
  final String? subTitle;
  final String? description;
  final Color? bgColor;
  final String? bgImage;
  final String? smallImage;

  ImageEnhancerItemModel({required this.imageEnhancerType, this.title, this.subTitle, this.description, this.bgColor, this.bgImage, this.smallImage});
}
