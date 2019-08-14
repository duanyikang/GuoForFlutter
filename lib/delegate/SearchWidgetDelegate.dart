import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/widget/DestinationSearchWidget.dart';

import 'OffsetNotifierData.dart';

class SearchWidgetDelegate extends SliverPersistentHeaderDelegate {
  SearchWidgetDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
    @required this.vd,
  });

  final double minHeight;
  final double maxHeight;
  final DestinationSearchWidget child;
  final OffsetNoitiferData vd;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    vd.value = shrinkOffset;
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SearchWidgetDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
