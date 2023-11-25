import 'package:flutter/material.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/widgets/dismiss_task_widget.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/widgets/task_widget.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return DismissTask(
              child: TaskWidget(
                  status: index == 0
                      ? TaskStatus.fresh
                      : index.isOdd
                          ? TaskStatus.inProgress
                          : TaskStatus.done),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 16.0,
          ),
        ),
      ),
    );
  }
}
