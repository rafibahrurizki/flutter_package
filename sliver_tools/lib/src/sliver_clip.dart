import 'package:flutter/widgets.dart';

import 'rendering/sliver_clip.dart';

/// [SliverClip] clips its sliver child from its paintOrigin to its paintExtent.
/// Also clips off any overlap if [clipOverlap] is `true`
class SliverClip extends SingleChildRenderObjectWidget {
  const SliverClip({
    super.key,
    required Widget super.child,
    this.clipOverlap = true,
  });

  /// Whether or not any overlap with previous slivers should be clipped
  /// default value is `true`
  final bool clipOverlap;

  @override
  RenderSliverClip createRenderObject(BuildContext context) {
    return RenderSliverClip(clipOverlap: clipOverlap);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderSliverClip renderObject,
  ) {
    renderObject.clipOverlap = clipOverlap;
  }
}
