import 'package:flutter/material.dart';
import 'package:polish_pic/common/config/config.dart';
import 'package:polish_pic/common/model/enum.dart';
import 'package:polish_pic/common/model/image_enhancer_item.dart';
import 'package:polish_pic/utils/common_util.dart';

class MainGirdItem extends StatelessWidget {
  final ImageEnhancerItemModel enhancerItemModel;
  final Function(ImageEnhancerType imageEnhancerType)? clickCallBack;

  const MainGirdItem({Key? key, required this.enhancerItemModel, this.clickCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickCallBack?.call(enhancerItemModel.imageEnhancerType);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: seperatorLineColor.withOpacity(0.2), width: 0.5)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: const EdgeInsets.all(2),
                  child: Image.asset(
                    CommonUtils.getImageAssetByName(enhancerItemModel.bgImage!),
                    fit: BoxFit.cover,
                  ))
            ],
          )),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              enhancerItemModel.subTitle ?? '',
              textAlign: TextAlign.left,
              style: TextStyle(color: textBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
