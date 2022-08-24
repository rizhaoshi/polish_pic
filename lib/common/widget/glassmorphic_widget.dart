import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassmorphicFlexCustomContainer extends StatelessWidget {
  /// Creates a widget with Glassmorphic Trend that combines [CustomPainter] class,[BackdropFilter], [Expanded], and [Flex].
  ///
  ///
  /// The [color] and [decoration] arguments cannot be supplied, since
  /// in glassmorphic container designs [BoxDecoration] is alredy being configured to you
  /// You can easily customize [borderGradient] and [linearGradient] like:
  ///! [Note] If you want to create a container with fixed size or dimentions like `height` , 'width','Size',
  ///! please user use [GlassmorphismContainer]
  ///* [GlassmorphicFlexContainer] is only of UIs where you need flexibility and responsiveness [Expample link](https://github.com/RitickSaha/glassmorphism/tree/master/example/lib)
  /// ```dart
  /// GlassmorphicFlexContainer(
  ///   flex:2
  ///   borderRadius: 20,
  ///   blur: 3,
  ///   alignment: Alignment.bottomCenter,
  ///   border: 2,
  ///   linearGradient: LinearGradient(
  ///     begin: Alignment.topLeft,
  ///     end: Alignment.bottomRight,
  ///     colors: [
  ///         Color(0xFFffffff).withOpacity(0.5),
  ///         Colors.red.withOpacity(0.2),
  ///       ],
  ///     stops: [
  ///       0.1,
  ///       1,
  ///     ]),
  ///   borderGradient: LinearGradient(
  ///     begin: Alignment.topLeft,
  ///     end: Alignment.bottomRight,
  ///     colors: [
  ///         Color(0xFFffffff).withOpacity(0.5),
  ///         Colors.red.withOpacity(0.5),
  ///       ],
  ///     ),
  ///   child: SizedBox()
  /// ),
  /// ```

  final Key? key;

  /// Align the [child] within the container.
  ///
  /// If non-null, the container will expand to fill its parent and position its
  /// child within itself according to the given value. If the incoming
  /// constraints are unbounded, then the child will be shrink-wrapped instead.
  ///
  /// Ignored if [child] is null.
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry? alignment;

  /// Empty space to inscribe inside the [decoration]. The [child], if any, is
  /// placed inside this padding.
  ///
  /// This padding is in addition to any padding inherent in the [decoration];
  /// see [Decoration.padding].
  final EdgeInsetsGeometry? padding;

  final int? flex;

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsetsGeometry? margin;

  /// The transformation matrix to apply before painting the container.
  /// it is similar to all the containers
  final Matrix4? transform;

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child
  final Widget? child;

  /// All the bellow parametrs are used to design the Glassmorphic effects and this effect is used to
  /// improve the performance ans scalablility as per the requirement.
  /// with good response i will try to [add more featurs and resolve the issues] on my github regarding this package
  /// Thanks for the support... even you can contribute to this project on github.
  final double borderRadius;
  final BoxShape shape;
  final BoxConstraints? constraints;
  final double border;
  final double blur;
  final LinearGradient linearGradient;
  final LinearGradient borderGradient;
  GlassmorphicFlexCustomContainer(
      {this.key,
      this.child,
      this.alignment,
      this.padding,
      this.shape = BoxShape.rectangle,
      this.margin,
      this.transform,
      required this.borderRadius,
      required this.linearGradient,
      required this.border,
      required this.blur,
      required this.borderGradient,
      this.constraints,
      this.flex = 1})
      : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(
          flex! >= 1,
          'Flex value can be less than 1 : $flex. Please Provide a flex value > 1',
        ),
        assert(constraints == null || constraints.debugAssertIsValid()),
        super(key: key);

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty<AlignmentGeometry>(
  //       'alignment', alignment,
  //       showName: false, defaultValue: null));
  //   properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding,
  //       defaultValue: null));
  //   properties.add(DiagnosticsProperty<BoxConstraints>(
  //       'constraints', constraints,
  //       defaultValue: null));
  //   properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin,
  //       defaultValue: null));
  //   properties.add(ObjectFlagProperty<Matrix4>.has('transform', transform));
  // }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
        child: Container(
          // alignment: alignment ?? Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: linearGradient,
          ),
          child: child,
        ),
      ),
    );
    // return Container(
    //     child: Stack(fit: StackFit.loose, children: [
    //   ClipRRect(
    //     clipBehavior: Clip.hardEdge,
    //     borderRadius: BorderRadius.circular(borderRadius),
    //     child:
    //     BackdropFilter(
    //       filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
    //       child: Container(
    //         // alignment: alignment ?? Alignment.topLeft,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(borderRadius),
    //           gradient: linearGradient,
    //         ),
    //         child: child,
    //       ),
    //     ),
    //   ),
    //   // GlassmorphicBorder(
    //   //   strokeWidth: border,
    //   //   radius: borderRadius,
    //   //   gradient: borderGradient,
    //   // ),
    //   // child!
    // ]));

    //  Container(
    //   key: key,
    //   // alignment: alignment,
    //   padding: padding,
    //   // constraints: BoxConstraints.tightForFinite(),
    //   transform: transform,
    //   child: Stack(
    //     fit: StackFit.loose,
    //     children: [
    //       ClipRRect(
    //         clipBehavior: Clip.hardEdge,
    //         borderRadius: BorderRadius.circular(borderRadius),
    //         child: BackdropFilter(
    //           filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
    //           child: Container(
    //             alignment: alignment ?? Alignment.topLeft,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(borderRadius),
    //               gradient: linearGradient,
    //             ),
    //           ),
    //         ),
    //       ),
    //       GlassmorphicBorder(
    //         strokeWidth: border,
    //         radius: borderRadius,
    //         gradient: borderGradient,
    //       ),
    //       ClipRRect(
    //         clipBehavior: Clip.hardEdge,
    //         borderRadius: BorderRadius.circular(borderRadius),
    //         child: Container(
    //           child: child,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
