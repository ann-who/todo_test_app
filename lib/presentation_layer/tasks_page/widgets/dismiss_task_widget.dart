import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:todo_test_app/business_logic/task_bloc/task_bloc.dart';
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
    final locale = AppLocalizations.of(context)!;

    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Dismissible(
        key: ValueKey(task.id),
        confirmDismiss: (DismissDirection direction) async {
          bool canDelete = task.status == TaskStatus.fresh;

          if (direction == DismissDirection.startToEnd) {
            context.read<TaskBloc>().add(TaskStatusChanged(task: task));
            canDelete = false;
          } else if (direction == DismissDirection.endToStart && canDelete) {
            context.read<TaskBloc>().add(TaskDeleted(id: task.databaseId));
          }
          return canDelete;
        },
        background: ChangeStatusBackground(
          status: task.status,
          title: _getNextLabelStatus(task.status, locale),
          color: _getNextLabelColor(task.status),
        ),
        secondaryBackground: DeleteBackground(
          color: _getDeleteColor(task.status),
        ),
        child: DecoratedBox(
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

  String _getNextLabelStatus(TaskStatus status, AppLocalizations locale) {
    if (status == TaskStatus.fresh) {
      return locale.inProgress;
    } else if (status == TaskStatus.inProgress) {
      return locale.done;
    } else {
      return locale.alreadyDone;
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
    var textTheme = Theme.of(context).textTheme;

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
            Text(
              title,
              style: textTheme.labelMedium,
            ),
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
