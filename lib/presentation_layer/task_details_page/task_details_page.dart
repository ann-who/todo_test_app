import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_test_app/business_logic/task_bloc/task.dart';

import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/presentation_layer/common_widgets/status_label_widget.dart';
import 'package:todo_test_app/resources/extensions.dart';

class TaskDetailsPage extends StatelessWidget {
  final String id;

  const TaskDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;

    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        TaskModel task = state.tasks.firstWhere((task) => task.id == id);
        final detailedDescription = task.detailedDescription;
        bool hasDescription =
            detailedDescription != null && detailedDescription.isNotEmpty;

        return Scaffold(
          appBar: AppBar(
            title: Text(locale.currentTask),
            actions: [
              if (task.status == TaskStatus.fresh)
                IconButton(
                  onPressed: () {
                    context.read<TaskBloc>().add(TaskDeleted(
                          id: task.databaseId,
                        ));
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.delete_rounded),
                ),
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
                    StatusLabel(task: task),
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
      },
    );
  }
}
