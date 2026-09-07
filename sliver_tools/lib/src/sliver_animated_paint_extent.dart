import 'package:flutter/widgets.dart';

import 'rendering/sliver_animated_paint_extent.dart';

/// [SliverAnimatedPaintExtent] allows for smoothly animating maxPaintExtent changes
class SliverAnimatedPaintExtent extends StatefulWidget {
  /// The duration that the animation will take
  final Duration duration;

  /// The curve for the animation
  final Curve curve;

  /// The child widget that will be rendered
  final Widget child;

  const SliverAnimatedPaintExtent({
    super.key,
    required this.duration,
    required this.child,
    this.curve = Curves.linear,
  });

  @override
  State<SliverAnimatedPaintExtent> createState() =>
      _SliverAnimatedPaintExtentState();
}

class _SliverAnimatedPaintExtentState extends State<SliverAnimatedPaintExtent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _SliverAnimatedPaintExtent(
      controller: _controller,
      duration: widget.duration,
      curve: widget.curve,
      child: widget.child,
    );
  }
}

class _SliverAnimatedPaintExtent extends SingleChildRenderObjectWidget {
  /// The controller in charge of the animation
  final AnimationController controller;

  /// The duration that the animation will take
  final Duration duration;

  /// The curve for the animation
  final Curve curve;

  const _SliverAnimatedPaintExtent({
    required this.controller,
    required this.duration,
    required this.curve,
    required Widget super.child,
  });

  @override
  RenderSliverAnimatedPaintExtent createRenderObject(BuildContext context) {
    return RenderSliverAnimatedPaintExtent()
      ..duration = duration
      ..controller = controller
      ..curve = curve;
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderSliverAnimatedPaintExtent renderObject,
  ) {
    renderObject
      ..duration = duration
      ..controller = controller
      ..curve = curve;
  }
}
