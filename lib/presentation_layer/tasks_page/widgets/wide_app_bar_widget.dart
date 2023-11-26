import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:todo_test_app/business_logic/task_bloc/task.dart';
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
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;

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
            padding: const EdgeInsets.only(left: 16.0),
            alignment: Alignment.bottomLeft,
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
                      locale.appName,
                      style: textTheme.headlineLarge!.copyWith(
                        fontSize: lerpDouble(32.0, 16.0, progress),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<TaskBloc, TaskState>(
                  buildWhen: (previous, current) =>
                      previous.newTasksCounter != current.newTasksCounter,
                  builder: (context, state) {
                    return Text(
                      locale.newTasks(state.newTasksCounter),
                      style: textTheme.headlineMedium!.copyWith(
                        fontSize: lerpDouble(18.0, 20.0, progress),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8.0),
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
