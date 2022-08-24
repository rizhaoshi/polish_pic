import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:polish_pic/utils/common_util.dart';

class GlassWidget extends StatelessWidget {
  final Widget? child;

  GlassWidget({Key? key, required Widget this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Lottie.asset(CommonUtils.getLottieByName("gradient_background"), repeat: true, fit: BoxFit.fill),
        GlassmorphicContainer(
          width: double.infinity,
          height: double.infinity,
          borderRadius: 0,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0x00ffffff).withOpacity(0.1), const Color(0x00ffffff).withOpacity(0.05)],
              stops: const [0.1, 1]),
          border: 0,
          blur: 20,
          borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0x00ffffff).withOpacity(0.5), const Color(0x00ffffff).withOpacity(0.5)],
              stops: const [0.1, 1]),
          child: child,
        )
      ],
    );
  }
}
