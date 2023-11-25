import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_test_app/business_logic/task_bloc/task.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/widgets/dismiss_task_widget.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/widgets/task_widget.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state.tasks.isEmpty) {
              return const Center(
                child: Text('У вас пока нет задач'),
              );
            }
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
        ),
      ),
    );
  }
}
