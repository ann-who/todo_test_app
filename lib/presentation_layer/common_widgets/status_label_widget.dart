import 'package:flutter/material.dart';

import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/resources/app_colors.dart';

class StatusLabel extends StatefulWidget {
  final TaskStatus status;

  const StatusLabel({
    super.key,
    required this.status,
  });

  @override
  State<StatusLabel> createState() => _StatusLabelState();
}

class _StatusLabelState extends State<StatusLabel> {
  bool _menuOpened = false;

  var _items = <PopupMenuEntry>[
    PopupMenuItem(
      child: Text('Новая'),
    ),
    PopupMenuItem(
      child: Text('В работе'),
    ),
    PopupMenuItem(
      child: Text('Выполнена'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      splashRadius: 8.0,
      offset: const Offset(0.0, 40.0),
      onOpened: () => setState(() {
        _menuOpened = !_menuOpened;
      }),
      onCanceled: () => setState(() {
        _menuOpened = !_menuOpened;
      }),
      itemBuilder: (context) => _items,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: _getLabelColor(widget.status),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _getLabelStatus(widget.status),
              style: const TextStyle(color: Colors.white),
            ),
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
