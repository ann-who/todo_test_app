import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:todo_test_app/resources/app_colors.dart';

class WideAppBarWidget extends StatelessWidget {
  const WideAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MyHeaderDelegate(
        appBarExpandedHeight: kToolbarHeight * 3,
        statusBarHeight: MediaQuery.of(context).viewPadding.top,
      ),
    );
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double appBarExpandedHeight;
  final double statusBarHeight;

  const MyHeaderDelegate({
    required this.appBarExpandedHeight,
    required this.statusBarHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;

    return Material(
      child: Stack(
        fit: StackFit.loose,
        children: [
          // Background
          AnimatedContainer(
            color: AppColors.mainOrange,
            duration: const Duration(milliseconds: 300),
          ),

          // Animated title and subtitle
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.lerp(
              const EdgeInsets.only(left: 30),
              const EdgeInsets.only(left: 16.0, top: 24.0),
              progress,
            ),
            alignment: Alignment.lerp(
              Alignment.bottomLeft,
              Alignment.centerLeft,
              progress,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: lerpDouble(32.0, 16.0, progress),
                      color: AppColors.lightOrange,
                    ),
                    Text(
                      'TODO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: lerpDouble(32.0, 16.0, progress),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // TODO new tasks counter
                Text(
                  'You have __ new tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: lerpDouble(18.0, 20.0, progress),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => appBarExpandedHeight;

  @override
  double get minExtent => kToolbarHeight + statusBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
