import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:todo_test_app/business_logic/task_bloc/task.dart';
import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:uuid/uuid.dart';

class CreateTask {
  CreateTask._();

  static Future modalBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const CreateTaskBody();
      },
    );
  }
}

class CreateTaskBody extends StatefulWidget {
  const CreateTaskBody({super.key});

  @override
  State<CreateTaskBody> createState() => _CreateTaskBodyState();
}

class _CreateTaskBodyState extends State<CreateTaskBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.0,
          left: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  locale.newTask,
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: locale.taskTitle,
                    hintStyle: textTheme.bodyMedium,
                    errorText: hasError ? locale.enterText : null,
                  ),
                  controller: titleController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        hasError = false;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: locale.taskDescription,
                    hintStyle: textTheme.bodyMedium,
                  ),
                  controller: descriptionController,
                ),
                const Spacer(),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      if (titleController.text.isNotEmpty) {
                        context.read<TaskBloc>().add(
                              TaskCreated(
                                task: TaskModel(
                                  id: const Uuid().v4(),
                                  shortDescription: titleController.text.trim(),
                                  detailedDescription:
                                      descriptionController.text.trim(),
                                  status: TaskStatus.fresh,
                                  creationDate: DateTime.now(),
                                ),
                              ),
                            );

                        Navigator.of(context).pop();
                      } else {
                        setState(() {
                          hasError = true;
                        });
                      }
                    },
                    child: Text(locale.createTask),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
