import 'package:flutter/material.dart';
import 'package:todo_test_app/data_layer/task_status.dart';
import 'package:todo_test_app/resources/app_colors.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    Key? key,
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
        setState(() {
          _isToggled = !_isToggled;
        });
        _animate();
      },
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blue),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Task short decription Sort but not too short',
                  ),
                ),
                Text('10:00'),
                const SizedBox(width: 8.0),
                Text('24.11.2023'),
              ],
            ),
            const SizedBox(height: 16.0),
            StatusLabel(
              status: TaskStatus.fresh,
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

class StatusLabel extends StatelessWidget {
  final TaskStatus status;

  const StatusLabel({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: _getLabelColor(status),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(_getLabelStatus(status)),
    );
  }

  Color _getLabelColor(TaskStatus status) {
    if (status == TaskStatus.fresh) {
      return AppColors.lightBlue;
    } else if (status == TaskStatus.inProgress) {
      return AppColors.green;
    } else {
      return AppColors.violet;
    }
  }

  String _getLabelStatus(TaskStatus status) {
    if (status == TaskStatus.fresh) {
      return 'Новая';
    } else if (status == TaskStatus.inProgress) {
      return 'В работе';
    } else {
      return 'Выполнена';
    }
  }
}
