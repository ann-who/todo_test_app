import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:todo_test_app/business_logic/task_bloc/task.dart';
import 'package:todo_test_app/presentation_layer/common_widgets/error_widget.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/widgets/dismiss_task_widget.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/widgets/task_widget.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state.error != null && state.error != null) {
              return AppErrorWidget(
                error: locale.loadingError,
                actionName: locale.tryAgain,
                action: () => context.read<TaskBloc>().add(TasksListLoaded()),
              );
            } else if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.tasks.isEmpty) {
              return Center(
                child: Text(
                  locale.empty,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge,
                ),
              );
            }
            return BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DismissTask(
                      task: state.tasks[index],
                      child: TaskWidget(task: state.tasks[index]),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16.0,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
