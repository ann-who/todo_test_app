import 'package:flutter/material.dart';
import 'package:todo_test_app/resources/app_colors.dart';

class DismissTask extends StatelessWidget {
  final Widget child;
  // final Task task;
  const DismissTask({
    required this.child,
    // required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;

    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Dismissible(
        key: ValueKey(0),
        confirmDismiss: (DismissDirection direction) async {
          bool needDelete = false;
          if (direction == DismissDirection.startToEnd) {
          } else if (direction == DismissDirection.endToStart) {}
          return needDelete;
        },
        background: ChangeStatusBackground(),
        secondaryBackground: DeleteBackground(
          brightness: brightness,
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[AppColors.blue, Colors.red],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class DeleteBackground extends StatelessWidget {
  const DeleteBackground({
    Key? key,
    required this.brightness,
  }) : super(key: key);

  final Brightness? brightness;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      color: Colors.red,
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
  // final Task task;

  const ChangeStatusBackground({
    // required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: AppColors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Icon(
          Icons.arrow_right_alt_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
