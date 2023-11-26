import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_test_app/business_logic/task_bloc/task.dart';

import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/presentation_layer/common_widgets/status_label_widget.dart';
import 'package:todo_test_app/resources/extensions.dart';

class TaskDetailsPage extends StatelessWidget {
  final TaskModel task;

  const TaskDetailsPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;
    bool hasDescription = task.detailedDescription != null &&
        task.detailedDescription!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.currentTask),
        actions: [
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (task.status == TaskStatus.fresh) {
                return IconButton(
                  onPressed: () {
                    context.read<TaskBloc>().add(TaskDeleted(id: task.id));
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.delete_rounded),
                );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.shortDescription,
              style: textTheme.headlineSmall,
            ),
            const Divider(),
            if (hasDescription) const SizedBox(height: 16.0),
            if (hasDescription)
              Text(
                task.detailedDescription!,
                style: textTheme.bodyLarge,
              ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return StatusLabel(task: task);
                  },
                ),
                const Spacer(),
                Text(
                  task.creationDate.parseTime(),
                  style: textTheme.labelSmall,
                ),
                const SizedBox(width: 8.0),
                Text(
                  task.creationDate.parseDayMonthYear(),
                  style: textTheme.labelSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
