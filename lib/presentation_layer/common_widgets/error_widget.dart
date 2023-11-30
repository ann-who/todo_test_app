import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String error;
  final String? actionName;
  final VoidCallback? action;

  const AppErrorWidget({
    super.key,
    required this.error,
    this.actionName,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(error),
      actions: [
        if (action != null)
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: action,
              child: Text(actionName!),
            ),
          ),
      ],
    );
  }
}
