import 'package:flutter/material.dart';
import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/resources/app_colors.dart';

class DismissTask extends StatelessWidget {
  final Widget child;
  final TaskModel task;

  const DismissTask({
    required this.child,
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Dismissible(
        key: ValueKey(task.id),
        confirmDismiss: (DismissDirection direction) async {
          bool needDelete = false;
          if (direction == DismissDirection.startToEnd) {
          } else if (direction == DismissDirection.endToStart) {}
          return needDelete;
        },
        background: ChangeStatusBackground(
          status: task.status,
          title: _getNextLabelStatus(task.status),
          color: _getNextLabelColor(task.status),
        ),
        secondaryBackground: DeleteBackground(
          color: _getDeleteColor(task.status),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                _getNextLabelColor(task.status),
                _getDeleteColor(task.status),
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Color _getNextLabelColor(TaskStatus status) {
    if (status == TaskStatus.fresh) {
      return AppColors.green;
    } else if (status == TaskStatus.inProgress) {
      return AppColors.violet;
    } else {
      return Colors.grey;
    }
  }

  Color _getDeleteColor(TaskStatus status) {
    if (status == TaskStatus.fresh) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  String _getNextLabelStatus(TaskStatus status) {
    if (status == TaskStatus.fresh) {
      return 'В работe';
    } else if (status == TaskStatus.inProgress) {
      return 'Выполнена';
    } else {
      return 'Задача уже\nвыполнена';
    }
  }
}

class DeleteBackground extends StatelessWidget {
  final Color color;

  const DeleteBackground({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      color: color,
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Icon(
          Icons.delete_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ChangeStatusBackground extends StatelessWidget {
  final TaskStatus status;
  final String title;
  final Color color;

  const ChangeStatusBackground({
    required this.status,
    required this.title,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            if (status != TaskStatus.done)
              const Icon(
                Icons.arrow_right_alt_rounded,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
