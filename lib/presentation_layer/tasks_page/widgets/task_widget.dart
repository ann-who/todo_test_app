import 'package:flutter/material.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/presentation_layer/common_widgets/status_label_widget.dart';
import 'package:todo_test_app/presentation_layer/task_details_page/task_details_page.dart';
import 'package:todo_test_app/resources/app_colors.dart';

class TaskWidget extends StatefulWidget {
  final TaskStatus status;

  const TaskWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget>
    with SingleTickerProviderStateMixin {
  bool _isToggled = false;
  late AnimationController _expandController;
  late Animation<double> _animation;

  @override
  void initState() {
    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.easeInOut,
    );

    super.initState();
  }

  void _animate() {
    if (_isToggled) {
      _expandController.forward();
    } else {
      _expandController.reverse();
    }
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TaskDetailsPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.blue),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task short decription Sort Task short decription Sort but not too short but not too short Task short decription Sort but not too short',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                StatusLabel(
                  status: widget.status,
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
            ),
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: _animation,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                    'LOOOOOOOOOOOOOOOOOOOOOONG DESCRIPTION LOOOOOOOOOOOOOOOOOOOOOONG DESCRIPTION LOOOOOOOOOOOOOOOOOOOOOONG DESCRIPTION LOOOOOOOOOOOOOOOOOOOOOONG DESCRIPTION'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
