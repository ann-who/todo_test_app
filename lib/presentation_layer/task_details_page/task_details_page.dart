import 'package:flutter/material.dart';

import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/presentation_layer/common_widgets/status_label_widget.dart';
import 'package:todo_test_app/resources/extensions.dart';

class TaskDetailsPage extends StatelessWidget {
  final TaskModel task;

  const TaskDetailsPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    bool hasDescription = task.detailedDescription != null &&
        task.detailedDescription!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ваша задача:'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_rounded))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.shortDescription,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (hasDescription) const SizedBox(height: 16.0),
            if (hasDescription)
              Text(
                task.detailedDescription!,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w200,
                ),
              ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                StatusLabel(task: task),
                const Spacer(),
                Text(
                  task.creationDate.parseTime(),
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 8.0),
                Text(
                  task.creationDate.parseDayMonthYear(),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
