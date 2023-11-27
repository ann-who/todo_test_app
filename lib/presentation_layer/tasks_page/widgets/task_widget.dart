import 'package:flutter/material.dart';

import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/presentation_layer/common_widgets/status_label_widget.dart';
import 'package:todo_test_app/presentation_layer/task_details_page/task_details_page.dart';
import 'package:todo_test_app/resources/extensions.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel task;

  const TaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaskDetailsPage(id: task.id)),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.shortDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
