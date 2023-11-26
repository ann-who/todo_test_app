import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:todo_test_app/business_logic/task_bloc/task.dart';
import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/resources/app_colors.dart';

class StatusLabel extends StatefulWidget {
  final TaskModel task;

  const StatusLabel({
    super.key,
    required this.task,
  });

  @override
  State<StatusLabel> createState() => _StatusLabelState();
}

class _StatusLabelState extends State<StatusLabel> {
  bool _menuOpened = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;

    return PopupMenuButton(
      offset: const Offset(0.0, 40.0),
      padding: EdgeInsets.zero,
      onOpened: () => setState(() {
        _menuOpened = !_menuOpened;
      }),
      onCanceled: () => setState(() {
        _menuOpened = !_menuOpened;
      }),
      itemBuilder: (context) => _items(widget.task.status, locale)
          .map(
            (text) => PopupMenuItem(
              onTap: () => context
                  .read<TaskBloc>()
                  .add(TaskStatusChanged(task: widget.task)),
              child: Text(
                text,
                style: textTheme.labelMedium!.copyWith(color: Colors.black),
              ),
            ),
          )
          .toList(),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: _getLabelColor(widget.task.status),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                _getLabelStatus(widget.task.status, locale),
                style: textTheme.labelMedium,
              ),
            ),
            if (widget.task.status != TaskStatus.done)
              AnimatedRotation(
                turns: _menuOpened ? 0.25 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: SizedBox.fromSize(
                  child: const Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  List<String> _items(TaskStatus status, AppLocalizations locale) {
    if (status == TaskStatus.fresh) {
      return [locale.inProgress];
    } else if (status == TaskStatus.inProgress) {
      return [locale.done];
    } else {
      return [];
    }
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

  String _getLabelStatus(TaskStatus status, AppLocalizations locale) {
    if (status == TaskStatus.fresh) {
      return locale.newStatus;
    } else if (status == TaskStatus.inProgress) {
      return locale.inProgress;
    } else {
      return locale.done;
    }
  }
}
