import 'package:flutter/material.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/presentation_layer/common_widgets/status_label_widget.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current task is:'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_rounded))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('This is a short description'),
            const SizedBox(height: 16.0),
            Text(
                'loooooooooooooooooooong detaaaailed yedg weufgue description.................... ............................'),
            const SizedBox(height: 16.0),
            Row(
              children: [
                StatusLabel(
                  status: TaskStatus.fresh,
                ),
                const Spacer(),
                Text(
                  '10:00',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 8.0),
                Text(
                  '24.11.2023',
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
